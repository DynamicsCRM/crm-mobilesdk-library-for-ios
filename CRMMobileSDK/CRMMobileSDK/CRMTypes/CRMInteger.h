//  CRMInteger.h

#import "JSONGenerator.h"
#import "JSONParser.h"
#import "SOAPGenerator.h"
#import "SOAPParser.h"

@interface CRMInteger : NSObject <JSONGenerator, JSONParser, SOAPGenerator, SOAPParser>

@property int intValue;

- (instancetype)initWithIntValue:(int)intValue;

@end
