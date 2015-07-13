//  NSString+CRMString.m

#import "NSstring+CRMString.h"
#import "NSString+XMLEncode.h"

@implementation NSString (CRMString)

- (NSObject *)generateJSON
{
    return self;
}

- (NSString *)generateSOAP
{
    return [NSString stringWithFormat:
            @"<b:value i:type=\"d:string\" xmlns:d=\"http://www.w3.org/2001/XMLSchema\">"
                "%@"
            "</b:value>",
            [self xmlEncode]];
}

+ (instancetype)instanceWithJSONObject:(NSObject *)obj
{
    if (![obj isKindOfClass:[NSString class]]) {
        return nil;
    }
    
    return (NSString *)obj;
}

+ (instancetype)instanceWithObject:(NSObject *)obj
{
    if (![obj isKindOfClass:[NSString class]]) {
        return nil;
    }
    
    return (NSString *)obj;
}

@end
