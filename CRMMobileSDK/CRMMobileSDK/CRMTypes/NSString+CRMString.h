//  NSString+CRMString.h

#import "JSONGenerator.h"
#import "JSONParser.h"
#import "SOAPGenerator.h"
#import "SOAPParser.h"

@interface NSString (CRMString) <JSONGenerator, JSONParser, SOAPGenerator, SOAPParser>

@end
