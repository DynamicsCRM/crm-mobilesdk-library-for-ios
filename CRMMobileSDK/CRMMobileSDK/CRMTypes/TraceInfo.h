//  TraceInfo.h

#import "SOAPParser.h"

@interface TraceInfo : NSObject <SOAPParser>

@property (nonatomic, strong) NSArray *errorInfoList;

@end
