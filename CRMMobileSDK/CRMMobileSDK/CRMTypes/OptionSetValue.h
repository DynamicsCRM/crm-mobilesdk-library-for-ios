//  OptionSetValue.h

#import "JSONGenerator.h"
#import "JSONParser.h"
#import "SOAPGenerator.h"
#import "SOAPParser.h"

@interface OptionSetValue : NSObject <JSONGenerator, JSONParser, SOAPGenerator, SOAPParser>

@property int value;

- (instancetype)initWithValue:(int)value;

@end
