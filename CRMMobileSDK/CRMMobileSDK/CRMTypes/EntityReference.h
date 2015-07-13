//  EntityReference.h

#import "JSONGenerator.h"
#import "JSONParser.h"
#import "SOAPGenerator.h"
#import "SOAPParser.h"

@interface EntityReference : NSObject <JSONGenerator, JSONParser, SOAPGenerator, SOAPParser>

@property (nonatomic, strong) NSUUID *id;
@property (nonatomic, strong) NSString *logicalName;
@property (nonatomic, strong) NSString *name;

- (instancetype)initWithLogicalName:(NSString *)logicalName id:(NSUUID *)id;

@end
