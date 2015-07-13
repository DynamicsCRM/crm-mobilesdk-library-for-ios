//  ResourceInfo.m

#import "ResourceInfo.h"
#import "SOAPMapper.h"
#import "NSString+CRMString.h"
#import "NSUUID+CRMUUID.h"

@implementation ResourceInfo

+ (instancetype)instanceWithObject:(NSObject *)obj
{
    if (![obj isKindOfClass:[NSArray class]]) {
        return nil;
    }
    
    ResourceInfo *resourceInfo = [[ResourceInfo alloc] init];
    
    NSArray *array = (NSArray *)obj;
    
    resourceInfo.displayName = [NSString instanceWithObject:[SOAPMapper oneForKey:@"DisplayName" inArray:array]];
    resourceInfo.entityName = [NSString instanceWithObject:[SOAPMapper oneForKey:@"EntityName" inArray:array]];
    resourceInfo.id = [NSUUID instanceWithObject:[SOAPMapper oneForKey:@"Id" inArray:array]];
    
    return resourceInfo;
}

@end
