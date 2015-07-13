//  CRMBigInt.m

#import "CRMBigInt.h"

@implementation CRMBigInt

- (instancetype)init
{
    return [self initWithLongValue:0];
}

- (instancetype)initWithLongValue:(long)longValue
{
    self = [super init];
    if (self) {
        self.longValue = longValue;
    }
    
    return self;
}

- (NSObject *)generateJSON
{
    return [NSNumber numberWithLong:self.longValue];
}

- (NSString *)generateSOAP
{
    return [NSString stringWithFormat:
            @"<b:value i:type=\"d:long\" xmlns:d=\"http://www.w3.org/2001/XMLSchema\">"
                "%ld"
            "</b:value>",
            self.longValue];
}

+ (instancetype)instanceWithJSONObject:(NSObject *)obj
{
    if (![obj isKindOfClass:[NSNumber class]]) {
        return nil;
    }
    
    return [[CRMBigInt alloc] initWithLongValue:[(NSNumber *)obj longValue]];
}

+ (instancetype)instanceWithObject:(NSObject *)obj
{
    if (![obj isKindOfClass:[NSString class]]) {
        return nil;
    }
    
    return [[CRMBigInt alloc] initWithLongValue:[(NSString *)obj longLongValue]];
}

@end
