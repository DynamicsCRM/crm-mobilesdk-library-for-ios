//  ErrorInfo.h

#import "SOAPParser.h"

@interface ErrorInfo : NSObject <SOAPParser>

@property (nonatomic, strong) NSString *errorCode;
@property (nonatomic, strong) NSArray *resourceList;

@end
