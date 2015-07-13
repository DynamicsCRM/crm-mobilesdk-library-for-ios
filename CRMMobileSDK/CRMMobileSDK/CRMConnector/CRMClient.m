//  CRMClient.m

//#import <ADALiOS/ADAuthenticationParameters+Internal.h>
#import "CRMClient.h"
#import "CRMClientPrivate.h"
#import "NSString+XMLEncode.h"
#import "SOAPMapper.h"
#import "XMLParsingHelper.h"

extern NSString* const OAuth2_Authenticate_Header;

@interface CRMClient ()

@property (nonatomic, copy) NSURL *endpointURL;
@property (nonatomic, copy) NSString *clientID;
@property (nonatomic, copy) NSString *redirectURI;

@property (nonatomic, copy) NSString *accessToken;

@end

@implementation CRMClient

+ (instancetype)clientWithClientID:(NSString *)clientId redirectURI:(NSString *)redirectURI {
    CRMClient *client = [self sharedClient];
    client.clientID = clientId;
    client.redirectURI = redirectURI;
    
    return client;
}

+ (instancetype)sharedClient {
    static CRMClient *sharedClient;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedClient = [[CRMClient alloc] init];
    });
    return sharedClient;
}

#pragma mark - Authentication methods

- (void)loginWithEndpoint:(NSString *)endpoint completion:(ADAuthenticationCallback)completion {
    self.endpointURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/XRMServices/2011/", endpoint]];
    
    // Create an auth challenge request
    NSString *path = @"Organization.svc/web?SdkClientVersion=6.1.0.533";
    
    NSMutableURLRequest *authorityRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:path relativeToURL:self.endpointURL]];
    [authorityRequest setHTTPMethod:@"GET"];
    [authorityRequest setValue:@"Bearer" forHTTPHeaderField:@"Authorization"];
    [authorityRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Accept"];
    
    NSURLSessionDataTask *authorityTask = [[NSURLSession sharedSession] dataTaskWithRequest:authorityRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
        NSString  *authenticateHeader = [httpResponse.allHeaderFields valueForKey:OAuth2_Authenticate_Header];
        // Pre Vega builds sometimes have extra information, this removes it
        NSRange commaRange = [authenticateHeader rangeOfString:@","];
        if (commaRange.location != NSNotFound)
        {
            authenticateHeader = [authenticateHeader substringToIndex:commaRange.location];
        }
        
        NSRange equalRange = [authenticateHeader rangeOfString:@"="];
        if (equalRange.location != NSNotFound) {
            NSString *updatedHeader = [authenticateHeader stringByReplacingOccurrencesOfString:@"=" withString:@"=\""];
            updatedHeader = [updatedHeader stringByAppendingString:@"\""];
            authenticateHeader = updatedHeader;
        }
        
        NSError *adError = nil;
        ADAuthenticationParameters *params = [ADAuthenticationParameters parametersFromResponseAuthenticateHeader:authenticateHeader error:&adError];
        
        if (adError)
        {
            NSLog(@"AD error %@ : %@", error.debugDescription, error.localizedRecoverySuggestion);
            dispatch_sync(dispatch_get_main_queue(), ^{
                UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"The authentication parameters could not be determined.  Please check your server settings and try again." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                [errorAlert show];
            });
            
            return;
        }
        
        NSString *authorityEndpoint = params.authority;
        
        // Don't validate the authority as ADFS authorities cannot be validated
        ADAuthenticationContext* context = [ADAuthenticationContext authenticationContextWithAuthority:authorityEndpoint validateAuthority:NO error:&adError];
        if (!context)
        {
            if (adError)
            {
                NSLog(@"AD error %@ : %@", error.debugDescription, error.localizedRecoverySuggestion);
            }
            dispatch_sync(dispatch_get_main_queue(), ^{
                UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"The login authority could not be established." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                [errorAlert show];
            });
            return;
        }
        
        // This performs the authentication and the library will jump in with the login page if needed
        [context acquireTokenWithResource:endpoint
                                 clientId:self.clientID
                              redirectUri:[NSURL URLWithString:self.redirectURI]
                          completionBlock:^(ADAuthenticationResult *result) {
                              if (result.status == AD_SUCCEEDED) {
                                  self.accessToken = result.accessToken;
                              }
                              
                              if (completion) completion(result);
                          }];
    }];
    
    [authorityTask resume];
}

#pragma mark - SOAP methods

- (void)execute:(OrganizationRequest *)request withCompletionBlock:(void (^) (OrganizationResponse *response, NSError *error))completionBlock
{
    NSString *executeXML = [NSString stringWithFormat:@""
                            "<Execute xmlns='http://schemas.microsoft.com/xrm/2011/Contracts/Services' xmlns:i='http://www.w3.org/2001/XMLSchema-instance'>"
                                "%@"
                            "</Execute>", [request generateSOAP]];
    NSString *executeBody = [self requestBodyForExecuteXML:executeXML];
    
    NSURLRequest *executeRequest = [self soapRequestForBody:executeBody soapAction:@"http://schemas.microsoft.com/xrm/2011/Contracts/Services/IOrganizationService/Execute"];
    
    NSURLSessionDataTask *executeTask = [[NSURLSession sharedSession] dataTaskWithRequest:executeRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error == nil)
        {
            NSInteger statusCode = [(NSHTTPURLResponse *)response statusCode];
            NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            
            if (statusCode == 200) {
                XMLParsingHelper *parser = [XMLParsingHelper parsingHelperWithXML:responseString];
                
                NSArray *executeResults = [parser xPathSearchFor:@"//*[local-name()='ExecuteResult']"];
                NSArray *executeResult = (NSArray *)[SOAPMapper oneForKey:@"ExecuteResult" inArray:executeResults];
                
                if (executeResult != nil) {
                    OrganizationResponse *orgResponse = [OrganizationResponse instanceWithObject:executeResult];
                    if (completionBlock) completionBlock(orgResponse, nil);
                }
                else {
                    if (completionBlock) completionBlock(nil, nil);
                }
            }
            else {
                NSString *statusText = [NSHTTPURLResponse localizedStringForStatusCode:statusCode];
                NSError *statusError = [NSError errorWithDomain:statusText code:statusCode
                                                       userInfo:@{ NSLocalizedDescriptionKey: responseString }];
                
                if (completionBlock) completionBlock(nil, statusError);
            }
        }
        else
        {
            if (completionBlock) completionBlock(nil, error);
        }
    }];
    
    [executeTask resume];
}

#pragma mark - OData methods

- (void)create:(Entity *)entity completionBlock:(void (^) (NSUUID *id, NSError *error))completionBlock
{
    Class entityClass = [entity class];
    NSString *schemaName = NSStringFromClass(entityClass);
    
    if (![entityClass isSubclassOfClass:[Entity class]]) {
        [NSException raise:@"Invalid Type" format:@"%@ is not a strongly-typed subclass of Entity", schemaName];
    }
    
    NSError *serError = nil;
    NSData *body = [NSJSONSerialization dataWithJSONObject:[entity generateJSON] options:0 error:&serError];
    if (serError)
    {
        if (completionBlock) completionBlock(nil, serError);
        return;
    }
    
    NSString *endpoint = [schemaName stringByAppendingString:@"Set"];
    NSURLRequest *request = [self oDataRequest:@"POST" forEndpoint:endpoint withBody:body];
    
    NSURLSessionDataTask *createTask = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error == nil)
        {
            NSError *serError = nil;
            NSDictionary *resultDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&serError];
            if (serError)
            {
                if (completionBlock) completionBlock(nil, serError);
                return;
            }
            
            NSError *returnedError = [self errorFromResponse:response dictionary:resultDict];
            if (returnedError)
            {
                if (completionBlock) completionBlock(nil, returnedError);
                return;
            }
            
            Entity *returnedEntity = [[entityClass alloc] initWithDictionary:resultDict];
            if (completionBlock) completionBlock(returnedEntity.id, nil);
        }
        else
        {
            if (completionBlock) completionBlock(nil, error);
        }
    }];
    
    [createTask resume];
}

- (void)update:(Entity *)entity completionBlock:(void (^) (NSError *error))completionBlock
{
    Class entityClass = [entity class];
    NSString *schemaName = NSStringFromClass(entityClass);
    
    if (![entityClass isSubclassOfClass:[Entity class]]) {
        [NSException raise:@"Invalid Type" format:@"%@ is not a strongly-typed subclass of Entity", schemaName];
    }
    
    NSError *serError = nil;
    NSData *body = [NSJSONSerialization dataWithJSONObject:[entity generateJSON] options:0 error:&serError];
    if (serError)
    {
        if (completionBlock) completionBlock(serError);
        return;
    }
    
    NSString *endpoint = [NSString stringWithFormat:@"%@Set(guid'%@')", schemaName, [entity.id UUIDString]];
    NSURLRequest *request = [self oDataRequest:@"MERGE" forEndpoint:endpoint withBody:body];
    
    NSURLSessionDataTask *updateTask = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error == nil)
        {
            if ([data length] > 0)
            {
                NSError *serError = nil;
                NSDictionary *resultDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&serError];
                if (serError)
                {
                    if (completionBlock) completionBlock(serError);
                    return;
                }
            
                NSError *returnedError = [self errorFromResponse:response dictionary:resultDict];
                if (returnedError)
                {
                    if (completionBlock) completionBlock(returnedError);
                    return;
                }
            }
            
            if (completionBlock) completionBlock(nil);
        }
        else
        {
            if (completionBlock) completionBlock(error);
        }
    }];
    
    [updateTask resume];
}

- (void)delete:(NSString *)schemaName id:(NSUUID *)id completionBlock:(void (^) (NSError *error))completionBlock
{
    Class entityClass = NSClassFromString(schemaName);
    if (![entityClass isSubclassOfClass:[Entity class]]) {
        [NSException raise:@"Invalid Type" format:@"%@ is not a strongly-typed subclass of Entity", schemaName];
    }
    
    NSString *endpoint = [NSString stringWithFormat:@"%@Set(guid'%@')", schemaName, [id UUIDString]];
    NSURLRequest *request = [self oDataRequest:@"DELETE" forEndpoint:endpoint withBody:nil];
    
    NSURLSessionDataTask *deleteTask = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error == nil)
        {
            if ([data length] > 0)
            {
                NSError *serError = nil;
                NSDictionary *resultDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&serError];
                if (serError)
                {
                    if (completionBlock) completionBlock(serError);
                    return;
                }
                
                NSError *returnedError = [self errorFromResponse:response dictionary:resultDict];
                if (returnedError)
                {
                    if (completionBlock) completionBlock(returnedError);
                    return;
                }
            }
            
            if (completionBlock) completionBlock(nil);
        }
        else
        {
            if (completionBlock) completionBlock(error);
        }
    }];
    
    [deleteTask resume];
}

- (void)retrieve:(NSString *)schemaName id:(NSUUID *)id attributes:(NSArray *)attributes completionBlock:(void (^) (Entity *entity, NSError *error))completionBlock
{
    Class entityClass = NSClassFromString(schemaName);
    if (![entityClass isSubclassOfClass:[Entity class]]) {
        [NSException raise:@"Invalid Type" format:@"%@ is not a strongly-typed subclass of Entity", schemaName];
    }
    
    NSString *columns = @"";
    for (NSString *column in attributes) {
        columns = [columns stringByAppendingString:[NSString stringWithFormat:@",%@", column]];
    }
    
    columns = [columns substringFromIndex:1];
    NSString *endpoint = [NSString stringWithFormat:@"%@Set(guid'%@')?$select=%@", schemaName, [id UUIDString], columns];
    NSURLRequest *request = [self oDataRequest:@"GET" forEndpoint:endpoint withBody:nil];
    
    NSURLSessionDataTask *retrieveTask = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error == nil)
        {
            NSError *serError = nil;
            NSDictionary *resultDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&serError];
            if (serError)
            {
                if (completionBlock) completionBlock(nil, serError);
                return;
            }
            
            NSError *returnedError = [self errorFromResponse:response dictionary:resultDict];
            if (returnedError)
            {
                if (completionBlock) completionBlock(nil, returnedError);
                return;
            }
            
            Entity *returnedEntity = [[entityClass alloc] initWithDictionary:resultDict];
            if (completionBlock) completionBlock(returnedEntity, nil);
        }
        else
        {
            if (completionBlock) completionBlock(nil, error);
        }
    }];
    
    [retrieveTask resume];
}

- (void)retrieveMultiple:(NSString *)schemaName attributes:(NSArray *)attributes completionBlock:(void (^) (EntityCollection *entities, NSError *error))completionBlock
{
    Class entityClass = NSClassFromString(schemaName);
    if (![entityClass isSubclassOfClass:[Entity class]]) {
        [NSException raise:@"Invalid Type" format:@"%@ is not a strongly-typed subclass of Entity", schemaName];
    }
    
    NSString *columns = @"";
    for (NSString *column in attributes) {
        columns = [columns stringByAppendingString:[NSString stringWithFormat:@",%@", column]];
    }
    
    columns = [columns substringFromIndex:1];
    NSString *endpoint = [NSString stringWithFormat:@"%@Set?$select=%@", schemaName, columns];
    NSURLRequest *request = [self oDataRequest:@"GET" forEndpoint:endpoint withBody:nil];
    
    NSURLSessionDataTask *retrieveTask = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error == nil)
        {
            NSError *serError = nil;
            NSDictionary *resultDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&serError];
            if (serError)
            {
                if (completionBlock) completionBlock(nil, serError);
                return;
            }
            
            NSError *returnedError = [self errorFromResponse:response dictionary:resultDict];
            if (returnedError)
            {
                if (completionBlock) completionBlock(nil, returnedError);
                return;
            }
            
            EntityCollection *entities = [[EntityCollection alloc] initWithEntityName:[entityClass entityLogicalName]
                                                                           schemaName:schemaName
                                                                           dictionary:resultDict];
            if (completionBlock) completionBlock(entities, nil);
        }
        else
        {
            if (completionBlock) completionBlock(nil, error);
        }
    }];
    
    [retrieveTask resume];
}

#pragma mark - SOAP endpoint

//  These methods set up the request for communicating with the SOAP endpoint
//  The SOAP endpoint is at /Organization.svc/web

- (NSURLRequest *)soapRequestForBody:(NSString *)body soapAction:(NSString*)soapAction {
    NSMutableURLRequest *retVal = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"Organization.svc/web" relativeToURL:self.endpointURL]];
    [retVal setHTTPMethod:@"POST"];
    [retVal setValue:[NSString stringWithFormat:@"Bearer %@", self.accessToken] forHTTPHeaderField:@"Authorization"];
    [retVal setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [retVal setValue:soapAction forHTTPHeaderField:@"SOAPAction"];
    [retVal setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
    
    return retVal;
}

- (NSString*)requestBodyForExecuteXML:(NSString*)executeXML {
    NSString *postData = [NSString stringWithFormat:@""
                          "<s:Envelope xmlns:s='http://schemas.xmlsoap.org/soap/envelope/'>"
                            "<s:Body>"
                                "%@"
                            "</s:Body>"
                          "</s:Envelope>", executeXML];
    
    return postData;
}

#pragma mark - OData endpoint

//  These methods setup up the request for communicating with the OData endpoint
//  The OData endpoint is at /OrganizationData.svc

- (NSURLRequest *)oDataRequest:(NSString *)request forEndpoint:(NSString *)endpoint withBody:(NSData *)body {
    NSString *path = [NSString stringWithFormat:@"OrganizationData.svc/%@", endpoint];
    
    NSMutableURLRequest *retVal =[[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:path relativeToURL:self.endpointURL]];
    [retVal setHTTPMethod:request];
    [retVal setValue:[NSString stringWithFormat:@"Bearer %@", self.accessToken] forHTTPHeaderField:@"Authorization"];
    [retVal setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    if (body) {
        [retVal setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        [retVal setHTTPBody:body];
    }
    
    return retVal;
}

- (NSError *)errorFromResponse:(NSURLResponse *)response dictionary:(NSDictionary *)dict
{
    NSDictionary *returnedError = dict[@"error"];
    if (returnedError)
    {
        NSInteger statusCode = [(NSHTTPURLResponse *)response statusCode];
        NSString *statusText = [NSHTTPURLResponse localizedStringForStatusCode:statusCode];
        NSString *statusMessage = returnedError[@"message"][@"value"];
        NSError *statusError = [NSError errorWithDomain:statusText code:statusCode
                                               userInfo:@{ NSLocalizedDescriptionKey: statusMessage }];
        
        return statusError;
    }
    
    return nil;
}

@end
