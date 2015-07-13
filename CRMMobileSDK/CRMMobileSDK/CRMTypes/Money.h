//  Money.h

#import "JSONGenerator.h"
#import "JSONParser.h"
#import "SOAPGenerator.h"
#import "SOAPParser.h"

@interface Money : NSObject <JSONGenerator, JSONParser, SOAPGenerator, SOAPParser>

@property NSDecimal value;

- (instancetype)initWithValue:(NSDecimal)value;

@end
