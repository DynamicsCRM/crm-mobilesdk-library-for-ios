//  ErrorInfo.m

#import "ErrorInfo.h"
#import "ResourceInfo.h"
#import "SOAPMapper.h"
#import "NSArray+CRMArray.h"
#import "NSString+CRMString.h"

@implementation ErrorInfo

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.resourceList = [NSMutableArray array];
    }
    
    return self;
}

+ (instancetype)instanceWithObject:(NSObject *)obj
{
    if (![obj isKindOfClass:[NSArray class]]) {
        return nil;
    }
    
    NSArray *array = (NSArray *)obj;
    
    ErrorInfo *errorInfo = [[ErrorInfo alloc] init];
    errorInfo.errorCode = [NSString instanceWithObject:[SOAPMapper oneForKey:@"ErrorCode" inArray:array]];
    errorInfo.resourceList = [NSArray instanceWithObject:[SOAPMapper oneForKey:@"ResourceList" inArray:array]];

    return errorInfo;
}

@end
