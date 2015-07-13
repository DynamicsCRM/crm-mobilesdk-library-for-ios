//  ValidationResult.m

#import "ValidationResult.h"
#import "SOAPMapper.h"
#import "CRMBoolean.h"
#import "NSUUID+CRMUUID.h"

@implementation ValidationResult

+ (instancetype)instanceWithObject:(NSObject *)obj
{
    if (![obj isKindOfClass:[NSArray class]]) {
        return nil;
    }
    
    ValidationResult *result = [[ValidationResult alloc] init];
    
    NSArray *array = (NSArray *)obj;
    
    result.activityId = [NSUUID instanceWithObject:[SOAPMapper oneForKey:@"ActivityId" inArray:array]];
    result.traceInfo = [TraceInfo instanceWithObject:[SOAPMapper oneForKey:@"TraceInfo" inArray:array]];
    result.validationSuccess = [(NSString *)[SOAPMapper oneForKey:@"ValidationSuccess" inArray:array] boolValue];
    
    return result;
}

@end
