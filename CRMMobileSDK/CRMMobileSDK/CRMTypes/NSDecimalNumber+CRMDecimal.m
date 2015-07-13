//  NSDecimalNumber+CRMDecimal.m

#import "NSDecimalNumber+CRMDecimal.h"

@implementation NSDecimalNumber (CRMDecimal)

- (NSObject *)generateJSON
{
    return [self stringValue];
}

- (NSString *)generateSOAP
{
    return [NSString stringWithFormat:
            @"<b:value i:type=\"d:decimal\" xmlns:d=\"http://www.w3.org/2001/XMLSchema\">"
                "%@"
            "</b:value>",
            [self stringValue]];
}

+ (instancetype)instanceWithJSONObject:(NSObject *)obj
{
    if (![obj isKindOfClass:[NSString class]]) {
        return nil;
    }
    
    return [NSDecimalNumber decimalNumberWithString:(NSString *)obj];
}

+ (instancetype)instanceWithObject:(NSObject *)obj
{
    if (![obj isKindOfClass:[NSString class]]) {
        return nil;
    }
    
    return [NSDecimalNumber decimalNumberWithString:(NSString *)obj];
}

@end
