//  EntityCollection.m

#import "EntityCollection.h"
#import "Entity.h"
#import "SOAPMapper.h"
#import "NSString+XMLEncode.h"

@implementation EntityCollection

- (instancetype)init
{
    return [self initWithEntityName:nil];
}

- (instancetype)initWithEntityName:(NSString *)entityName
{
    self = [super init];
    if (self) {
        self.entities = [NSMutableArray array];
        self.entityName = entityName;
        
        self.moreRecords = false;
        self.totalRecordCount = -1;
        self.totalRecordCountLimitExceeded = false;
    }
    
    return self;
}

- (instancetype)initWithEntityName:(NSString *)entityName schemaName:(NSString *)schemaName dictionary:(NSDictionary *)dict
{
    Class entityClass = NSClassFromString(schemaName);
    if (![entityClass isSubclassOfClass:[Entity class]]) {
        [NSException raise:@"Invalid Type" format:@"%@ is not a strongly-typed subclass of Entity", schemaName];
    }
    
    self = [self initWithEntityName:entityName];
    
    NSDictionary *d = dict[@"d"];
    if (!d) {
        return self;
    }
    
    NSArray *results = d[@"results"];
    if (!results) {
        return self;
    }
    
    for (NSDictionary *entity in results) {
        [(NSMutableArray *)self.entities addObject:[[entityClass alloc] initWithDictionary:entity]];
    }
    
    return self;
}

- (NSString *)generateSOAP
{
    NSString *entities = @"";
    for (id entity in self.entities) {
        entities = [entities stringByAppendingString:[entity generateSOAPForArray]];
    }
    
    NSString *entityNameSOAP = (self.entityName == nil) ?
        @"<a:EntityName i:nil=\"true\" />" :
        [NSString stringWithFormat:@"<a:EntityName>%@</a:EntityName>", [self.entityName xmlEncode]];
    NSString *minActiveSOAP = (self.minActiveRowVersion == nil) ?
        @"<a:MinActiveRowVersion>-1</a:MinActiveRowVersion>" :
        [NSString stringWithFormat:@"<a:MinActiveRowVersion>%@</a:MinActiveRowVersion", [self.minActiveRowVersion xmlEncode]];
    NSString *pagingCookieSOAP = (self.pagingCookie == nil) ?
        @"<a:PagingCookie i:nil=\"true\" />" :
        [NSString stringWithFormat:@"<a:PagingCookie>%@</a:PagingCookie>", [self.pagingCookie xmlEncode]];
    
    return [NSString stringWithFormat:
            @"<b:value i:type=\"a:EntityCollection\">"
                "<a:Entities>"
                    "%@"
                "</a:Entities>"
                "%@"
                "%@"
                "<a:MoreRecords>%@</a:MoreRecords>"
                "%@"
                "<a:TotalRecordCount>%d</a:TotalRecordCount>"
                "<a:TotalRecordCountLimitExceeded>%@</a:TotalRecordCountLimitExceeded>"
            "</b:value>",
            entities, entityNameSOAP, minActiveSOAP,
            (self.moreRecords ? @"true" : @"false"),
            pagingCookieSOAP,
            self.totalRecordCount, (self.totalRecordCountLimitExceeded ? @"true" : @"false")];
}

+ (instancetype)instanceWithObject:(NSObject *)obj
{
    if (![obj isKindOfClass:[NSArray class]]) {
        return nil;
    }
    
    NSArray *objArray = (NSArray *)obj;
    
    NSString *entityName = (NSString *)[SOAPMapper oneForKey:@"EntityName" inArray:objArray];
    EntityCollection *collection = [[EntityCollection alloc] initWithEntityName:entityName];
    
    collection.minActiveRowVersion = (NSString *)[SOAPMapper oneForKey:@"MinActiveRowVersion" inArray:objArray];
    collection.pagingCookie = (NSString *)[SOAPMapper oneForKey:@"PagingCookie" inArray:objArray];
    
    collection.moreRecords = [(NSString *)[SOAPMapper oneForKey:@"MoreRecords" inArray:objArray] boolValue];
    collection.totalRecordCount = [(NSString *)[SOAPMapper oneForKey:@"TotalRecordCount" inArray:objArray] intValue];
    collection.totalRecordCountLimitExceeded = [(NSString *)[SOAPMapper oneForKey:@"TotalRecordCountLimitExceeded"  inArray:objArray] boolValue];
    
    NSArray *entities = (NSArray *)[SOAPMapper oneForKey:@"Entities" inArray:objArray];
    if (entities != nil) {
        NSMutableArray *serializedEntities = [NSMutableArray array];
        [SOAPMapper forKey:@"Entity" inArray:entities with:^(NSObject *entityPairs) {
            [serializedEntities addObject:[Entity instanceWithObject:entityPairs]];
        }];
        collection.entities = serializedEntities;
    }

    return collection;
}

@end
