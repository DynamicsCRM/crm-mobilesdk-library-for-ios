//  OrganizationRequest.m

#import "OrganizationRequest.h"
#import "NSUUID+CRMUUID.h"

@implementation OrganizationRequest

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.requestId = [NSUUID emptyUUID];
        self.parameters = [NSMutableDictionary dictionary];
    }
    
    return self;
}

- (id)objectForKeyedSubscript:(id <NSCopying>)key
{
    return [self.parameters valueForKey:(NSString *)key];
}

- (void)setObject:(id)obj forKeyedSubscript:(id <NSCopying>)key;
{
    [self.parameters setValue:obj forKey:(NSString *)key];
}

- (NSString *)generateSOAP
{
    NSString *parameters = @"";
    for (id parameter in [self.parameters allKeys]) {
        id value = self.parameters[parameter];
        
        if (![value conformsToProtocol:@protocol(SOAPGenerator)]) {
            [NSException raise:@"Invalid Parameter"
                        format:@"Parameter \"%@\" does not conform to SOAPGenerator protocol.", parameter];
        }
        
        NSString *valueSOAP = (value == nil) ? @"<b:value i:nil=\"true\" />" : [value generateSOAP];
        
        NSString *paramSOAP = [NSString stringWithFormat:
                               @"<a:KeyValuePairOfstringanyType>"
                                "<b:key>%@</b:key>"
                                "%@"
                               "</a:KeyValuePairOfstringanyType>",
                               parameter, valueSOAP];
        parameters = [parameters stringByAppendingString:paramSOAP];
    }
    
    NSString *requestIdSOAP = (self.requestId == nil) ?
        @"<a:RequestId i:nil=\"true\" />" :
        [NSString stringWithFormat:@"<a:RequestId>%@</a:RequestId>", [self.requestId UUIDString]];
    NSString *requestNameSOAP = (self.requestName == nil) ?
        @"<a:RequestName i:nil=\"true\" />" :
        [NSString stringWithFormat:@"<a:RequestName>%@</a:RequestName>", self.requestName];
    
    return [NSString stringWithFormat:
            @"<request i:type='%@:%@' xmlns:a='http://schemas.microsoft.com/xrm/2011/Contracts' xmlns:c='http://schemas.microsoft.com/crm/2011/Contracts'>"
                "<a:Parameters xmlns:b='http://schemas.datacontract.org/2004/07/System.Collections.Generic'>"
                    "%@"
                "</a:Parameters>"
                "%@"
                "%@"
            "</request>",
            [[self class] requestNamespace], NSStringFromClass([self class]), parameters, requestIdSOAP, requestNameSOAP];
}

+ (NSString *)requestNamespace {
    return @"";
}

@end
