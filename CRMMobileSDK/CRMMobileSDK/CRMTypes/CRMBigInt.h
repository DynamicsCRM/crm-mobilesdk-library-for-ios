//  CRMBigInt.h

#import "JSONGenerator.h"
#import "JSONParser.h"
#import "SOAPGenerator.h"
#import "SOAPParser.h"

@interface CRMBigInt : NSObject <JSONGenerator, JSONParser, SOAPGenerator, SOAPParser>

@property long longValue;

- (instancetype)initWithLongValue:(long)longValue;

@end
