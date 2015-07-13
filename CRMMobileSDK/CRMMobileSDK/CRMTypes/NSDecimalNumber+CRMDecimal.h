//  NSDecimalNumber+CRMDecimal.h

#import "JSONGenerator.h"
#import "JSONParser.h"
#import "SOAPGenerator.h"
#import "SOAPParser.h"

@interface NSDecimalNumber (CRMDecimal) <JSONGenerator, JSONParser, SOAPGenerator, SOAPParser>

@end
