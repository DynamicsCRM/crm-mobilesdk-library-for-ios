//  TraceInfo.m

#import "TraceInfo.h"
#import "ErrorInfo.h"
#import "SOAPMapper.h"
#import "NSArray+CRMArray.h"

@implementation TraceInfo

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.errorInfoList = [NSMutableArray array];
    }
    
    return self;
}

+ (instancetype)instanceWithObject:(NSObject *)obj
{
    if (![obj isKindOfClass:[NSArray class]]) {
        return nil;
    }
    
    NSArray *array = (NSArray *)obj;
    
    TraceInfo *traceInfo = [[TraceInfo alloc] init];
    traceInfo.errorInfoList = [NSArray instanceWithObject:[SOAPMapper oneForKey:@"ErrorInfoList" inArray:array]];
    
    return traceInfo;
}

@end
