//  CRMBoolean.h

#import "JSONGenerator.h"
#import "JSONParser.h"
#import "SOAPGenerator.h"
#import "SOAPParser.h"

@interface CRMBoolean : NSObject <JSONGenerator, JSONParser, SOAPGenerator, SOAPParser>

@property BOOL boolValue;

- (instancetype)initWithBoolValue:(BOOL)boolValue;

@end
