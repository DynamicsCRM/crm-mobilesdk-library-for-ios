//  NSDate+CRMDate.h

#import "JSONGenerator.h"
#import "JSONParser.h"
#import "SOAPGenerator.h"
#import "SOAPParser.h"

@interface NSDate (CRMDate) <JSONGenerator, JSONParser, SOAPGenerator, SOAPParser>

@end
