//  NSUUID+CRMUUID.m

#import "NSUUID+CRMUUID.h"

@implementation NSUUID (CRMUUID)

- (NSObject *)generateJSON
{
    return [self UUIDString];
}

- (NSString *)generateSOAP
{
    return [NSString stringWithFormat:
            @"<b:value i:type=\"d:guid\" xmlns:d=\"http://schemas.microsoft.com/2003/10/Serialization/\">"
                "%@"
            "</b:value>",
            [self UUIDString]];
}

- (NSString *)generateSOAPForArray
{
    return [NSString stringWithFormat:@"<d:guid>%@</d:guid>", [self UUIDString]];
}

+ (instancetype)instanceWithJSONObject:(NSObject *)obj
{
    if (![obj isKindOfClass:[NSString class]]) {
        return nil;
    }
    
    return [[NSUUID alloc] initWithUUIDString:(NSString *)obj];
}

+ (instancetype)instanceWithObject:(NSObject *)obj
{
    if (![obj isKindOfClass:[NSString class]]) {
        return nil;
    }
    
    return [[NSUUID alloc] initWithUUIDString:(NSString *)obj];
}

+ (instancetype)emptyUUID
{
    return [[NSUUID alloc] initWithUUIDString:@"00000000-0000-0000-0000-000000000000"];
}

@end
