# Microsoft Dynamics CRM Mobile SDK Library for iOS (Objective-C)
-------------------------------------------------

This document describes the iOS version of the Dynamics CRM Mobile SDK that is being released under an open source license on [GitHub.com](http://github.com/dynamicscrm). This SDK provides a service proxy class, message classes, and data classes that enable you to develop iOS mobile applications in Objective-C that can connect to the CRM organization web service and perform various operations. The supported messages in this SDK, that are defined later in this document, represents a usable subset of what is available in the .NET version of the CRM SDK. In general, it is best to be familiar with the .NET version of the [CRM SDK](https://msdn.microsoft.com/en-us/library/gg309408(v=crm.7).aspx) as the programming API in this mobile SDK was based on it. The following documentation describes the key features and API available in this SDK.

[OAuth](http://oauth.net/2/) authentication with the Dynamics CRM web service is provided within this SDK. That functionality is handled using an SDK method call that internally invokes the [Azure Active Directory Authentication Library](https://github.com/AzureAD/azure-activedirectory-library-for-objc) (ADAL). For an example of using this SDK in a real world iOS application, complete with OAuth web service authentication, refer to the Activity Tracker sample iOS app that is provided as a separate download.

## Requirements

This SDK supports and has been tested with the following development environment.

* iOS 7 and 8
* Xcode 6

At build time, the following open source or 3rd party libraries are downloaded and installed, which require and active internet connection on the development computer.

* [Azure Active Directory Authentication Library](https://github.com/AzureAD/azure-activedirectory-library-for-objc)

This SDK is known to work with Dynamics CRM 2013 and 2015, for both on-premises and Online deployments. On-premises identity authentication is provided by Active Directory Federation Services (3.0 or greater) while Online identity authentication is provided by Microsoft Azure Active Directory.

Applications must be registered with the identity provider (AD FS or Azure AD) before run-time authentication can be successfully completed. The process to register an app can be found in the topic [Walkthrough: Register a CRM app with Active Directory](https://msdn.microsoft.com/en-us/library/dn531010.aspx). A sample iOS app named Activity Tracker that demonstrates using app registration is provided as a separate download.

## Getting Started

Prior to using the methods provided by this mobile SDK, you must build and run the (.NET) *MobileSdkGen* command line tool to generate early-bound classes for each entity in the CRM organization that your app needs to access. The tool plus related documentation is provided as a separate download. This tool is similar to the *CrmSvcUtil* tool provided in the .NET version of the CRM SDK. After running the MobileSdkGen tool, the result will be two files (.h and .m) containing CRM specific early-bound entity types that is to be included in your Xcode app projects.

For more information about using early-bound entity types, refer to the related CRM SDK topic [Use the early bound entity classes in code](https://msdn.microsoft.com/en-us/library/gg328210.aspx). For more information about the CrmSvcUtil tool, see [Create early bound entity classes with the code generation tool](https://msdn.microsoft.com/en-us/library/gg327844.aspx).

To build this mobile SDK you will need CocoaPods installed to resolve the project dependencies. Follow the instructions from [CocoaPods.org](https://guides.cocoapods.org/using/getting-started.html). Download the project dependency by running `pod install`. The dependency that will be installed is the [Microsoft ADAL](https://github.com/AzureAD/azure-activedirectory-library-for-objc).

## Web Service Proxy

The `CRMClient` class, located in the CRMMobileSdk/CRMConnector folder, provides methods for authentication, sending SOAP based message requests, and performing certain basic operations against the CRM web service OData v2 endpoint. It is up to you to decide whether to use the OData methods, send SOAP messages, or both. Most operations supported by CRM are invoked through SOAP messages while only a small subset of operations are supported by the OData v2 endpoint. For more information on the OData v2 endpoint, see [Use web service data in web resources (OData and Modern app SOAP endpoint)](https://msdn.microsoft.com/en-us/library/gg490659.aspx).

The `CRMClient` class provides the following class method to initialize a singleton instance. The client ID and redirect URI values are obtained when registering the app with Active Directory.

```objective-c
+ (instancetype)clientWithClientID:(NSString *)clientId redirectURI:(NSString *)redirectURI;
```

After initialization, use the following class method to obtain the singleton instance.

```objective-c
+ (instancetype)sharedClient;
```

You may want to initialize the singleton instance of `CRMClient` on application load. Then obtain the instance from anywhere in the application using the second class method.

```objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [CRMClient clientWithClientID:@"d47e2562-ac02-46ff-8dbf-e652cb15c7dd" redirectURI:@"http://www.example.com"];
    return YES;
}
```

A common task after updating or retrieving data using the methods on `CRMClient` may be to perform GUI updates. However, it may also be common to spend computational resources processing records. For this reason, callback blocks passed to these methods are not guaranteed to run on the main thread.

## Web Service Identity Authentication

Before calling any `CRMClient` OData method or sending a SOAP message request to the web service, your app must first authenticate the logged-on user with the identity provider of the organization web service. The `CRMClient` class uses the ADAL library to obtain an authentication access token for all web service operations. Prior to using any of the SOAP or OData methods, call the following method to authenticate with the web service identity provider.

```objective-c
- (void)loginWithEndpoint:(NSString *)serverURL completion:(ADAuthenticationCallback)completion;
```

`ADAuthenticationCallback` is a callback block receiving an instance of `ADAuthenticationResult` as a parameter. This parameter has an `error` property of type `ADAuthenticationError`. This property will have a value of `nil` if authentication is successful and an error describing the failure if not successful.

```objective-c
CRMClient *client = [CRMClient sharedClient];
[client loginWithEndpoint:@"https://mydomain.crm.dynamics.com" completion:^(ADAuthenticationResult *result) {
    if (result.error) {
        // TODO: Handle the error
    }
    else {
        // TODO: Do some work
    }
}];
```

Substitute the appropriate CRM server SSL (https://) root address in the method call.

## OData Related Methods

The following sections describe the available `CRMClient` methods that perform organization web service operations against the CRM server's OData v2 endpoint.

### Create

Creates an entity record.

```objective-c
- (void)create:(Entity *)entity completionBlock:(void (^) (NSUUID *id, NSError *error))completionBlock;
```

For the `Entity` instance provided to the method to be serialized correctly, it must be an early-bound subclass of the `Entity` class provided in the mobile SDK. You can generate these classes using the MobileSdkGen tool. In the example below, the `Contact` class was generated using this tool.

```objective-c
Contact *contact = [[Contact alloc] init];
contact.FirstName = @"John";
contact.LastName = @"Doe";
contact.NumberOfChildren = [[CRMInteger alloc] initWithIntValue:2];

[client create:contact completionBlock:^(NSUUID *id, NSError *error) {
    if (error) {
        // TODO: Handle error
    }
    else {
        contact.id = id;
    }
}];
```

### Update

Updates an existing entity record.

```objective-c
- (void)update:(Entity *)entity completionBlock:(void (^) (NSError *error))completionBlock;
```

For the `Entity` instance provided to the method to be serialized correctly, it must be an early-bound subclass of the `Entity` class provided in the Mobile SDK. You can generate these classes using the MobileSdkGen tool. In the example below, the `Contact` class was generated using this tool. For update, the record ID must be supplied.

```objective-c
Contact *contact = [[Contact alloc] init];
contact.NumberOfChildren = [[CRMInteger alloc] initWithIntValue:3];
contact.id = [[NSUUID alloc] initWithUUIDString:@"ab4db725-0aab-45c9-a23d-d7a865635974"];

[client update:contact completionBlock:^(NSError *error) {
    if (error) {
        // TODO: Handle error
    }
}];
```

### Delete

Deletes an existing entity record.

```objective-c
- (void)delete:(NSString *)schemaName id:(NSUUID *)id completionBlock:(void (^) (NSError *error))completionBlock;
```

```objective-c
NSUUID *contactId = [[NSUUID alloc] initWithUUIDString:@"ab4db725-0aab-45c9-a23d-d7a865635974"];
[client delete:@"Contact" id:contactId completionBlock:^(NSError *error) {
    if (error) {
        // TODO: Handle error
    }
}];
```

### Retrieve

Two methods are provided on the `CRMClient` instance to retrieve records: one to retrieve a single record, and another to retrieve multiple records of the given type to which the user has read access. At this time, no filtering or sorting can be performed using the OData retrieve methods in this SDK. However, the equivalent SOAP messages do have a mechanism to achieve this.

For the `Entity` instances returned by these methods to be deserialized correctly, they must be early-bound subclass instances of the `Entity` class provided in the mobile SDK. You can generate these classes using the MobileSdkGen tool. In the example below, the `Contact` class was generated using this tool.

```objective-c
- (void)retrieve:(NSString *)schemaName id:(NSUUID *)id attributes:(NSArray *)attributes completionBlock:(void (^) (Entity *entity, NSError *error))completionBlock;
- (void)retrieveMultiple:(NSString *)schemaName attributes:(NSArray *)attributes completionBlock:(void (^) (EntityCollection *entities, NSError *error))completionBlock;
```

```objective-c
NSUUID *contactId = [[NSUUID alloc] initWithUUIDString:@"ab4db725-0aab-45c9-a23d-d7a865635974"];
[client retrieve:@"Contact" id:contactId attributes:@[@"FirstName", @"LastName"] completionBlock:^(Entity *entity, NSError *error) {
    if (error) {
        // TODO: Handle error
    }
    else {
        Contact *contact = (Contact *)entity;
    }
}];

[CRMClient retrieveMultiple:@"Contact" attributes:@[@"FirstName, @"LastName" completionBlock:^(EntityCollection *entities, NSError *error) {
    if (error) {
        // TODO: Handle error
    }
    else {
        for (Contact *contact in entities.entities) {
            // TODO: Do something with contact record
        }
    }
}];
```

## SOAP Methods

The following section describes the `Execute` method of the service proxy that sends SOAP based messages to the organization web service. Note that there are no Create, Update, Delete, etc. methods provided for the SOAP endpoint when compared to the OData endpoint.

### Execute

This mobile SDK provides `OrganizationRequest` and `OrganizationResponse` base classes. These classes represent the input and output of sending a SOAP message request to the web service and receiving a response.

```objective-c
- (void)execute:(OrganizationRequest *)request withCompletionBlock:(void (^) (OrganizationResponse *response, NSError *error))completionBlock;
```

A list of supported SOAP message requests and responses is provided at the end of this document. The following is an example use of the `SetStateRequest`.

```objective-c
NSUUID *accountId = [[NSUUID alloc] initWithUUIDString:@"6997a469-a735-45f8-a4bf-fe31526a086b"];

SetStateRequest *request = [[SetStateRequest alloc] init];
request.entityMoniker = [[EntityReference alloc] initWithLogicalName:@"account" id:accountId];
request.state = [[OptionSetValue alloc] initWithValue:1];
request.status = [[OptionSetValue alloc] initWithValue:2];

[client execute:request withCompletionBlock:^(OrganizationResponse *response, NSError *error) {
    if (error) {
        // TODO: Handle error
    }
    else {
        SetStateResponse *myResponse = (SetStateResponse *)response;
    }
}];
```

Note that when using the SOAP messages, the type of `Entity` is returned by messages with responses containing `Entity` records, such as `RetrieveRequest` and `RetrieveMultipleRequest`. While the entities returned by the OData methods are instances of early-bound types, the entities returned by SOAP message requests are not. However, you may still provide instances of early-bound types as parameters to requests. This means that early-bound types generated by the MobileSdkGen tool are not required for the use with SOAP messages. The `Entity` class does provide the following method for converting instances of the `Entity` class to instances of early-bound sub-classes.

```objective-c
- (id)toEntity:(Class)entityType;
```

Early-bound entity types can be used when performing a `RetrieveMultipleRequest`.

```objective-c
FetchExpression *fetch = [[FetchExpression alloc] init];
fetch.query = @""
    "<fetch version=\"1.0\" mapping=\"logical\">"
        "<entity name=\"account\">"
            "<attribute name=\"name\" />"
            "<attribute name=\"accountnumber\" />"
            "<order attribute=\"name\" />"
        "</entity>"
    "</fetch>";

RetrieveMultipleRequest *request = [[RetrieveMultipleRequest alloc] init];
request.query = fetch;

[client execute:request withCompletionBlock:^(OrganizationResponse *response, NSError *error) {
    if (error) {
        // TODO: Handle error
    }
    else {
        RetrieveMultipleResponse *myResponse = (RetrieveMultipleResponse *)response;
        for (Entity *entity in myResponse.entityCollection.entities) {
            Account *account = [entity toEntity:[Account class]];
            // TODO: Do something interesting with properties from early-bound Account class
        }
    }
}];
```

## Adding SOAP Messages

It is possible to add request/response class pairs that subclass `OrganizationRequest` and `OrganizationResponse` to provide messages supported by the web service SOAP endpoint and not included in this SDK. To do so, you must override the getter method for the `requestName` property, as well as the `+ (NSString *)requestNamespace;` class method on `OrganizationRequest`. This method should return `@"a"` for messages in the .NET [Microsoft.Xrm.Sdk.Messages](https://msdn.microsoft.com/en-us/library/microsoft.xrm.sdk.messages.aspx) namespace and `@"c"` for messages in the .NET [Microsoft.Crm.Sdk.Messages](https://msdn.microsoft.com/en-us/library/microsoft.crm.sdk.messages.aspx) namespace. In addition, getters/setters for request or response properties should access the parameters and results dictionaries, respectively. The following is an example of the `AutoMapEntityRequest` and `AutoMapEntityResponse` pair.

```objective-c
// AutoMapEntityRequest.h

#import "OrganizationRequest.h"

@interface AutoMapEntityRequest : OrganizationRequest

@property (nonatomic, strong) NSUUID *entityMapId;

@end


// AutoMapEntityRequest.m

#import "AutoMapEntityRequest.h"

@implementation AutoMapEntityRequest

- (NSUUID *)entityMapId {
    return (NSUUID *)self.parameters[@"EntityMapId"];
}

- (void)setEntityMapId:(NSUUID *)entityMapId {
    self.parameters[@"EntityMapId"] = entityMapId;
}

- (NSString *)requestName {
    return @"AutoMapEntity";
}

+ (NSString *)requestNamespace {
    return @"c";
}

@end


// AutoMapEntityResponse.h

#import "OrganizationResponse.h"

@interface AutoMapEntityResponse : OrganizationResponse

@end


// AutoMapEntityResponse.m

#import "AutoMapEntityResponse.h"

@implementation AutoMapEntityResponse

- (NSString *)responseName {
    return @"AutoMapEntity";
}

@end
```

## Supported Organization Web Service (SOAP) Messages

For each of the messages listed below, there exists a request and response class. For example, the Create message includes `CreateRequest` and `CreateResponse` classes. These classes can be found in the SDK folder CRMMobileSdk/CRMRequests.

For more information about each of these messages, see [CRM messages in the organization service](https://msdn.microsoft.com/en-us/library/gg309482.aspx) and [xRM messages in the Organization service](https://msdn.microsoft.com/en-us/library/gg334698.aspx).

**A**: AddItemCampaign, AddListMembersList, AddMemberList, AddPrincipalToQueue, AddProductToKit, AddRecurrence, AddToQueue, Assign, AssociateEntities

**B**: BackgroundSendEmail, Book

**C**: CancelContract, CancelSalesOrder, CheckIncomingEmail, CheckPromoteEmail, CloneContract, CloseIncident, CloseQuote, CopyDynamicListToStatic, Create, CreateException, CreateInstance

**D**: Delete, DeleteOpenInstances, DeliverIncomingEmail, DeliverPromoteEmail, DisassociateEntities

**L**: LockInvoicePricing, LockSalesOrderPricing, LoseOpportunity

**M**: Merge

**P**: PickFromQueue  

**Q**: QualifyLead  

**R**: Recalculate, ReleaseToQueue, RemoveFromQueue, RemoveItemCampaign, RemoveMemberList, RemovePrivilegeRole, RemoveRelated, ReplacePrivilegesRole, Reschedule, Retrieve, RetrieveMultiple, RetrieveUserQueues, RouteTo  

**S**: SendEmail, SendFax, SetRelated, SetState

**U**: Update

**V**: ValidateRecurrenceRule

**W**: WinOpportunity, WinQuote  

## CRM Specific Types

This mobile SDK provides a number of classes that represent parameter/result types for `OrganizationRequest` and `OrganizationResponse` classes and/or `Entity` attribute types. Simple types, such as `int` and `BOOL` are wrapped for serialization purposes and for inclusion in attribute dictionaries. In addition, several built-in classes are extended with categories to facilitate serialization. Below is the list of CRM types provided by this SDK and located in the CRMMobileSDK/CRMTypes folder.


CRMBigInt  
CRMBoolean  
CRMDouble  
CRMInteger
ColumnSet  
Entity  
EntityCollection  
EntityReference  
EntityReferenceCollection  
ErrorInfo  
FetchExpression  
Money  
NSArray+CRMArray  
NSDate+CRMDate  
NSDecimalNumber+CRMDecimal  
NSNull+CRMNull  
NSString+CRMString  
NSUUID+CRMUUID  
OptionSetValue  
QueryBase  
RelatedEntityCollection  
Relationship  
RelationshipQueryCollection  
ResourceInfo  
TraceInfo  
UIImage+CRMImage  
ValidationResult  

## Additional Information

> Setting `nil` as the value of an attribute for an early-bound entity instance will add that attribute to the entity's `attribute` dictionary as `[NSNull null]` (behind the scenes). This value is serialized into SOAP and OData messages and will therefore clear the value in CRM on an update.
>
> If you do not wish to set (or clear) an attribute value, you must remove the logical name/attribute value pair from the entity's `attribute` dictionary.
