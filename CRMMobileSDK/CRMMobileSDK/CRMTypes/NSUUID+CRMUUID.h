//  NSUUID+CRMUUID.h

#import "JSONGenerator.h"
#import "JSONParser.h"
#import "SOAPGenerator.h"
#import "SOAPParser.h"

@interface NSUUID (CRMUUID) <JSONGenerator, JSONParser, SOAPGenerator, SOAPParser>

+ (instancetype)emptyUUID;

@end
