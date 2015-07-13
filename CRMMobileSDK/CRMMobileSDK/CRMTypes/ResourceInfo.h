//  ResourceInfo.h

#import "SOAPParser.h"

@interface ResourceInfo : NSObject <SOAPParser>

@property (nonatomic, strong) NSString *displayName;
@property (nonatomic, strong) NSString *entityName;
@property (nonatomic, strong) NSUUID *id;

@end
