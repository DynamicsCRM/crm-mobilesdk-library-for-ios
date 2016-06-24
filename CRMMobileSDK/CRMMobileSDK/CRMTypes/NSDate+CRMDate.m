//  NSDate+CRMDate.m

#import "NSDate+CRMDate.h"

@implementation NSDate (CRMDate)

- (NSObject *)generateJSON
{
    long long dateInMilliseconds = ([self timeIntervalSince1970] * 1000);
    return [NSString stringWithFormat:@"/Date(%lld)/", dateInMilliseconds];
}

- (NSString *)generateSOAP
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"];
    
    return [NSString stringWithFormat:
            @"<b:value i:type=\"d:dateTime\" xmlns:d=\"http://www.w3.org/2001/XMLSchema\">"
                "%@"
            "</b:value>",
            [formatter stringFromDate:self]];
}

+ (instancetype)instanceWithJSONObject:(NSObject *)obj
{
    if (![obj isKindOfClass:[NSString class]]) {
        return nil;
    }
    
    NSString *strValue = (NSString *)obj;
    NSString *milliseconds = [[strValue substringToIndex:([strValue length] - 2)] substringFromIndex:6];
    
    return [NSDate dateWithTimeIntervalSince1970:([milliseconds doubleValue] / 1000)];
}

+ (instancetype)instanceWithObject:(NSObject *)obj
{
    if (![obj isKindOfClass:[NSString class]]) {
        return nil;
    }
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"];
    
    return [formatter dateFromString:(NSString *)obj];
}

@end
