//  EntityReferenceCollection.m

#import "EntityReferenceCollection.h"
#import "EntityReference.h"
#import "NSArray+CRMArray.h"

@implementation EntityReferenceCollection

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.items = [NSMutableArray array];
    }
    
    return self;
}

+ (instancetype)instanceWithObject:(NSObject *)obj
{
    EntityReferenceCollection *collection = [[EntityReferenceCollection alloc] init];
    collection.items = [NSMutableArray arrayWithArray:[NSArray instanceWithObject:obj]];
    
    return collection;
}

@end
