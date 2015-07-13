//  RelationshipQueryCollection.m

#import "QueryBase.h"
#import "RelationshipQueryCollection.h"
#import "Relationship.h"

@implementation RelationshipQueryCollection

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
    NSString *relationships = @"";
    for (Relationship *relationship in self.items.allKeys) {
        QueryBase *query = (QueryBase *)self.items[relationship];
        
        NSString *relationshipSOAP = [NSString stringWithFormat:
                                      @"<a:KeyValuePairOfRelationshipQueryBaseX_PsK4FkN>"
                                        "<b:key>%@</b:key>"
                                        "%@"
                                      "</a:KeyValuePairOfRelationshipQueryBaseX_PsK4FkN>",
                                      [relationship generateSOAP],
                                      [query generateSOAP]];
        
        relationships = [relationships stringByAppendingString:relationshipSOAP];
    }
    
    return [NSString stringWithFormat:
            @"<b:value i:type=\"a:RelationshipQueryCollection\">"
                "%@"
            "</b:value>",
            relationships];
}

@end
