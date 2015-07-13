//  OptionSetValue.m

#import "OptionSetValue.h"
#import "SOAPMapper.h"

@implementation OptionSetValue

- (instancetype)init
{
	return [self initWithValue:0];
}

- (instancetype)initWithValue:(int)value
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
        @"Value": [NSNumber numberWithInt:self.value]
    };
}

- (NSString *)generateSOAP
{
    return [NSString stringWithFormat:
            @"<b:value i:type=\"a:OptionSetValue\">"
                "<a:Value>%d</a:Value>"
            "</b:value>",
            self.value];
}

+ (instancetype)instanceWithJSONObject:(NSObject *)obj
{
    if (![obj isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    
    NSDictionary *dict = (NSDictionary *)obj;
    NSObject *intValue = dict[@"Value"];
    if (![intValue isKindOfClass:[NSNumber class]]) {
        return nil;
    }
    
    return [[OptionSetValue alloc] initWithValue:[(NSNumber *)intValue intValue]];
}

+ (instancetype)instanceWithObject:(NSObject *)obj
{
    if (![obj isKindOfClass:[NSArray class]]) {
        return nil;
    }
    
    return [[OptionSetValue alloc] initWithValue:[(NSString *)[SOAPMapper oneForKey:@"Value" inArray:(NSArray *)obj] intValue]];
}

@end
