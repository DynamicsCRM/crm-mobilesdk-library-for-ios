//  RelatedEntityCollection.m

#import "EntityCollection.h"
#import "RelatedEntityCollection.h"
#import "Relationship.h"
#import "SOAPMapper.h"

@implementation RelatedEntityCollection

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.items = [NSMutableDictionary dictionary];
    }
    
    return self;
}

- (NSString *)generateSOAP
{
    NSString *collection = @"";
    
    for (Relationship *relationship in self.items.allKeys) {
        EntityCollection *entities = self.items[relationship];
        
        NSString *keyValuePair = [NSString stringWithFormat:
                                  @"<a:KeyValuePairOfRelationshipEntityCollectionX_PsK4FkN>"
                                    "<b:key>%@</b:key>"
                                    "%@"
                                  "</a:KeyValuePairOfRelationshipEntityCollectionX_PsK4FkN>",
                                  [relationship generateSOAP], [entities generateSOAP]];
        collection = [collection stringByAppendingString:keyValuePair];
    }
    
    return collection;
}

+ (instancetype) instanceWithObject:(NSObject *)obj
{
    if (![obj isKindOfClass:[NSArray class]]) {
        return nil;
    }
    
    RelatedEntityCollection *collection = [[RelatedEntityCollection alloc] init];
    
    [SOAPMapper forKey:@"KeyValuePairOfRelationshipEntityCollectionX_PsK4FkN" inArray:(NSArray *)obj with:^(NSObject *value) {
        NSArray *keyArray = (NSArray *)[SOAPMapper oneForKey:@"key" inArray:(NSArray *)value];
        NSArray *valueArray = (NSArray *)[SOAPMapper oneForKey:@"value" inArray:(NSArray *)value];
        
        Relationship *relationship = [Relationship instanceWithObject:keyArray];
        EntityCollection *entities = [EntityCollection instanceWithObject:valueArray];
        
        [(NSMutableDictionary *)collection.items setObject:entities forKey:relationship];
    }];
    
    return collection;
}

@end
