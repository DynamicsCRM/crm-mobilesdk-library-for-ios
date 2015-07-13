//  NSNull+CRMNull.m

#import "NSNull+CRMNull.h"

@implementation NSNull (CRMNull)

- (NSObject *)generateJSON
{
    return self;
}

+ (instancetype)instanceWithJSONObject:(NSObject *)obj
{
    return [NSNull null];
}

@end
