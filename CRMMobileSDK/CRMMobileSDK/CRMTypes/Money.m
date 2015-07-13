//  Money.m

#import "Money.h"
#import "SOAPMapper.h"
#import "NSDecimalNumber+CRMDecimal.h"

@implementation Money

- (instancetype)init
{
    return [self initWithValue:[[NSDecimalNumber zero] decimalValue]];
}

- (instancetype)initWithValue:(NSDecimal)value
{
	self = [super init];
	if (self) {
		self.value = value;
	}
	
	return self;
}

- (NSObject *)generateJSON
{
    return @{
        @"Value": [[NSDecimalNumber decimalNumberWithDecimal:self.value] generateJSON]
    };
}

- (NSString *)generateSOAP
{
    NSDecimal decimalValue = self.value;
    
    return [NSString stringWithFormat:
            @"<b:value i:type=\"a:Money\">"
                "<a:Value>%@</a:Value>"
            "</b:value>",
            NSDecimalString(&decimalValue, nil)];
}

+ (instancetype)instanceWithJSONObject:(NSObject *)obj
{
    if (![obj isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    
    NSDictionary *dict = (NSDictionary *)obj;
    NSObject *decimalValue = dict[@"Value"];
    if (![decimalValue isKindOfClass:[NSString class]]) {
        return nil;
    }
    
    return [[Money alloc] initWithValue:[[NSDecimalNumber decimalNumberWithString:(NSString *)decimalValue] decimalValue]];
}

+ (instancetype)instanceWithObject:(NSObject *)obj
{
    if (![obj isKindOfClass:[NSArray class]]) {
        return nil;
    }
    
    NSDecimal value = [[NSDecimalNumber instanceWithObject:[SOAPMapper oneForKey:@"Value" inArray:(NSArray *)obj]] decimalValue];
    return [[Money alloc] initWithValue:value];
}

@end
