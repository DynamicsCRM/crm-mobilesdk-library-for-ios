//  ValidationResult.h

#import "SOAPParser.h"
#import "TraceInfo.h"

@interface ValidationResult : NSObject <SOAPParser>

@property (nonatomic, strong) NSUUID *activityId;
@property (nonatomic, strong) TraceInfo *traceInfo;
@property BOOL validationSuccess;

@end
