//  NSArray+CRMArray.m

#import "NSArray+CRMArray.h"
#import "SOAPMapper.h"
#import "CRMBoolean.h"
#import "Entity.h"

@implementation NSArray (CRMArray)

- (NSString *)generateSOAP
{
    NSString *iType = @"";
    NSString *type = @"";
    NSString *ns = @"";
    
    if (self.count > 0) {
        if ([self[0] class] == [Entity class]) {
            iType = @"a:Entity";
            type = @"a:ArrayOfEntity";
        }
        else if ([self[0] class] == [CRMBoolean class]) {
            iType = @"d:boolean";
            type = @"a:ArrayOfboolean";
            ns = @" xmlns:d=\"http://schemas.microsoft.com/2003/10/Serialization/Arrays\"";
        }
        else if ([self[0] class] == [NSUUID class]) {
            iType = @"d:guid";
            type = @"d:ArrayOfguid";
            ns = @" xmlns:d=\"http://schemas.microsoft.com/2003/10/Serialization/Arrays\"";
        }
    }
    
    NSString *values = @"";
    for (id obj in self) {
        if (obj == nil) {
            NSString *nilValue = [NSString stringWithFormat:@"<%@ i:nil=\"true\" />", iType];
            values = [values stringByAppendingString:nilValue];
        }
        else {
            if (![obj conformsToProtocol:@protocol(SOAPGenerator)]) {
                [NSException raise:@"Invalid Array Member"
                            format:@"Object \"%@\" does not conform to SOAPGenerator protocol.", obj];
            }
        
            values = [values stringByAppendingString:[obj generateSOAPForArray]];
        }
    }
    
    return [NSString stringWithFormat:
            @"<b:value i:type=\"%@\"%@>"
                "%@"
            "</b:value>",
            type, ns, values];
}

+ (instancetype)instanceWithObject:(NSObject *)obj
{
    if (![obj isKindOfClass:[NSArray class]]) {
        return nil;
    }
    
    NSArray *objects = (NSArray *)obj;
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    for (NSDictionary *object in objects) {
        NSString *type = object[@"nodeName"];
        
        Class class = [SOAPMapper classForType:type];
        NSObject *value = object[type];
        
        if (value != nil) {
            [array addObject:[class instanceWithObject:value]];
        }
    }
    
    return array;
}

@end
