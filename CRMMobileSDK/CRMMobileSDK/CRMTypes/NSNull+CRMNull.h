//  NSNull+CRMNull.h

#import <Foundation/Foundation.h>
#import "JSONGenerator.h"
#import "JSONParser.h"

@interface NSNull (CRMNull) <JSONGenerator, JSONParser>

@end
