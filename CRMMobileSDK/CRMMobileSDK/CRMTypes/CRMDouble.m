//  CRMDouble.m

#import "CRMDouble.h"

@implementation CRMDouble

- (instancetype)init
{
    return [self initWithDoubleValue:0];
}

- (instancetype)initWithDoubleValue:(double)doubleValue
{
    self = [super init];
    if (self) {
        self.doubleValue = doubleValue;
    }
    
    return self;
}

- (NSObject *)generateJSON
{
    return [NSNumber numberWithDouble:self.doubleValue];
}

- (NSString *)generateSOAP
{
    return [NSString stringWithFormat:
            @"<b:value i:type=\"d:double\" xmlns:d=\"http://www.w3.org/2001/XMLSchema\">"
                "%f"
            "</b:value>",
            self.doubleValue];
}

+ (instancetype)instanceWithJSONObject:(NSObject *)obj
{
    if (![obj isKindOfClass:[NSNumber class]]) {
        return nil;
    }
    
    return [[CRMDouble alloc] initWithDoubleValue:[(NSNumber *)obj doubleValue]];
}

+ (instancetype)instanceWithObject:(NSObject *)obj
{
    if (![obj isKindOfClass:[NSString class]]) {
        return nil;
    }
    
    return [[CRMDouble alloc] initWithDoubleValue:[(NSString *)obj doubleValue]];
}

@end
