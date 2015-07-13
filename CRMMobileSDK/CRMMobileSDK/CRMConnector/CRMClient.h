//  CRMClient.h

#import <Foundation/Foundation.h>
#import "OrganizationRequest.h"
#import "OrganizationResponse.h"
#import "Entity.h"
#import "EntityCollection.h"

typedef void(^AuthCallback)(id result);

@interface CRMClient : NSObject

+ (instancetype)clientWithClientID:(NSString *)clientId redirectURI:(NSString *)redirectURI;
+ (instancetype)sharedClient;

- (void)loginWithEndpoint:(NSString *)endpoint completion:(AuthCallback)completion;

- (void)execute:(OrganizationRequest *)request withCompletionBlock:(void (^) (OrganizationResponse *response, NSError *error))completionBlock;

- (void)create:(Entity *)entity completionBlock:(void (^) (NSUUID *id, NSError *error))completionBlock;
- (void)update:(Entity *)entity completionBlock:(void (^) (NSError *error))completionBlock;
- (void)delete:(NSString *)schemaName id:(NSUUID *)id completionBlock:(void (^) (NSError *error))completionBlock;
- (void)retrieve:(NSString *)schemaName id:(NSUUID *)id attributes:(NSArray *)attributes completionBlock:(void (^) (Entity *entity, NSError *error))completionBlock;
- (void)retrieveMultiple:(NSString *)schemaName attributes:(NSArray *)attributes completionBlock:(void (^) (EntityCollection *entities, NSError *error))completionBlock;

@end
