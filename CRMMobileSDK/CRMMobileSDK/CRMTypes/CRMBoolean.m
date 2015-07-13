//  CRMBoolean.m

#import "CRMBoolean.h"

@implementation CRMBoolean

- (instancetype)init
{
    return [self initWithBoolValue:NO];
}

- (instancetype)initWithBoolValue:(BOOL)boolValue
{
    self = [super init];
    if (self) {
        self.boolValue = boolValue;
    }
    
    return self;
}

- (NSObject *)generateJSON
{
    return self.boolValue ? @YES : @NO;
}

- (NSString *)generateSOAP
{
    return [NSString stringWithFormat:
            @"<b:value i:type=\"d:boolean\" xmlns:d=\"http://www.w3.org/2001/XMLSchema\">"
                "%@"
            "</b:value>",
            (self.boolValue ? @"true" : @"false")];
}

- (NSString *)generateSOAPForArray
{
    return [NSString stringWithFormat:@"<d:boolean>%@</d:boolean>", (self.boolValue ? @"true" : @"false")];
}

+ (instancetype)instanceWithJSONObject:(NSObject *)obj
{
    if (![obj isKindOfClass:[NSNumber class]]) {
        return nil;
    }
    
    return [[CRMBoolean alloc] initWithBoolValue:[(NSNumber *)obj boolValue]];
}

+ (instancetype)instanceWithObject:(NSObject *)obj
{
    if (![obj isKindOfClass:[NSString class]]) {
        return nil;
    }
    
    return [[CRMBoolean alloc] initWithBoolValue:[(NSString *)obj boolValue]];
}

@end
