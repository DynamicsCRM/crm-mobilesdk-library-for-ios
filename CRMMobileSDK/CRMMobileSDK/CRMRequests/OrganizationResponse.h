//  OrganizationResponse.h

#import "SOAPParser.h"

@interface OrganizationResponse : NSObject <SOAPParser>

@property (nonatomic, strong) NSString *responseName;
@property (nonatomic, strong) NSMutableDictionary *results;

@end
