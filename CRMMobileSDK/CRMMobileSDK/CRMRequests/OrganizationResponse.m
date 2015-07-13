//  OrganizationResponse.m

#import "OrganizationResponse.h"
#import "SOAPMapper.h"

@implementation OrganizationResponse

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.results = [NSMutableDictionary dictionary];
    }
    
    return self;
}

- (id)objectForKeyedSubscript:(id <NSCopying>)key
{
    return [self.results valueForKey:(NSString *)key];
}

- (void)setObject:(id)obj forKeyedSubscript:(id <NSCopying>)key;
{
    [self.results setValue:obj forKey:(NSString *)key];
}

+ (instancetype)instanceWithObject:(NSObject *)obj
{
    NSArray *array = (NSArray *)obj;
    
    NSString *responseName = (NSString *)[SOAPMapper oneForKey:@"ResponseName" inArray:array];
    NSString *responseClassName = [NSString stringWithFormat:@"%@Response", responseName];
    
    OrganizationResponse *instance = (OrganizationResponse *)[[NSClassFromString(responseClassName) alloc] init];
    
    NSArray *results = (NSArray *)[SOAPMapper oneForKey:@"Results" inArray:array];
    if (results != nil) {
        [SOAPMapper forKey:@"KeyValuePairOfstringanyType" inArray:results with:^(NSObject *keyValuePair) {
            NSString *key = (NSString *)[SOAPMapper oneForKey:@"key" inArray:(NSArray *)keyValuePair];
            NSObject *value = [SOAPMapper oneForKey:@"value" inArray:(NSArray *)keyValuePair];
            
            NSArray *attributes = [SOAPMapper attributesForKey:@"value" inArray:(NSArray *)keyValuePair];
            NSString *type = (NSString *)[SOAPMapper oneForKey:@"type" inArray:attributes];
            
            if (value != nil && type != nil) {
                Class class = [SOAPMapper classForType:type];
                instance.results[key] = [class instanceWithObject:value];
            }
        }];
    }
    
    return instance;
}

@end
