//  OrganizationRequest.h

#import "SOAPGenerator.h"

@interface OrganizationRequest : NSObject <SOAPGenerator>

@property (nonatomic, strong) NSString *requestName;
@property (nonatomic, strong) NSUUID *requestId;
@property (nonatomic, strong) NSMutableDictionary *parameters;

- (id)objectForKeyedSubscript:(id <NSCopying>)key;
- (void)setObject:(id)obj forKeyedSubscript:(id <NSCopying>)key;

@end
