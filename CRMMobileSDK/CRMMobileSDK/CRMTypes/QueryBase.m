//  QueryBase.m

#import "QueryBase.h"

@implementation QueryBase

- (NSString *)generateSOAP
{
    [NSException raise:@"Method Not Implemented"
                format:@"The class QueryBase should not be instantiated directly. Use FetchExpression instead."];
    
    return nil;
}

+ (instancetype)instanceWithObject:(NSObject *)obj
{
    [NSException raise:@"Method Not Implemented"
                format:@"The class QueryBase should not be instantiated directly. Use FetchExpression instead."];
    
    return nil;
}

@end
