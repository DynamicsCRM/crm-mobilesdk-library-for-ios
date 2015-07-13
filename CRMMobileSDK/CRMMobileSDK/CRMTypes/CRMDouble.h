//  CRMDouble.h

#import "JSONGenerator.h"
#import "JSONParser.h"
#import "SOAPGenerator.h"
#import "SOAPParser.h"

@interface CRMDouble : NSObject <JSONGenerator, JSONParser, SOAPGenerator, SOAPParser>

@property double doubleValue;

- (instancetype)initWithDoubleValue:(double)doubleValue;

@end
