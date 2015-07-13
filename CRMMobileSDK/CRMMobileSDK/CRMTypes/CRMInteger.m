//  CRMInteger.m

#import "CRMInteger.h"

@implementation CRMInteger

- (instancetype)init
{
    return [self initWithIntValue:0];
}

- (instancetype)initWithIntValue:(int)intValue
{
    self = [super init];
    if (self) {
        self.intValue = intValue;
    }
    
    return self;
}

- (NSObject *)generateJSON
{
    return [NSNumber numberWithInt:self.intValue];
}

- (NSString *)generateSOAP
{
    return [NSString stringWithFormat:
            @"<b:value i:type=\"d:int\" xmlns:d=\"http://www.w3.org/2001/XMLSchema\">"
                "%d"
            "</b:value>",
            self.intValue];
}

+ (instancetype)instanceWithJSONObject:(NSObject *)obj
{
    if (![obj isKindOfClass:[NSNumber class]]) {
        return nil;
    }
    
    return [[CRMInteger alloc] initWithIntValue:[(NSNumber *)obj intValue]];
}

+ (instancetype)instanceWithObject:(NSObject *)obj
{
    if (![obj isKindOfClass:[NSString class]]) {
        return nil;
    }
    
    return [[CRMInteger alloc] initWithIntValue:[(NSString *)obj intValue]];
}

@end
