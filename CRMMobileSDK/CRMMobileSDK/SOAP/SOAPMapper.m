//  SOAPMapper.m

#import "SOAPMapper.h"

@implementation SOAPMapper

+ (Class)classForType:(NSString *)type
{
    NSArray *typeComponents = [type componentsSeparatedByString:@":"];
    NSString *class = (NSString *)[typeComponents lastObject];
    
    if ([class isEqual:@"long"]) {
        class = @"CRMBigInt";
    }
    else if ([class isEqual:@"boolean"]) {
        class = @"CRMBoolean";
    }
    else if ([class isEqual:@"double"]) {
        class = @"CRMDouble";
    }
    else if ([class isEqual:@"int"]) {
        class = @"CRMInteger";
    }
    else if ([class isEqual:@"dateTime"]) {
        class = @"NSDate";
    }
    else if ([class isEqual:@"decimal"]) {
        class = @"NSDecimalNumber";
    }
    else if ([class isEqual:@"string"]) {
        class = @"NSString";
    }
    else if ([class isEqual:@"guid"]) {
        class = @"NSUUID";
    }
    else if ([class containsString:@"ArrayOf"]) {
        class = @"NSArray";
    }
    else if ([class isEqual:@"base64Binary"]) {
        class = @"UIImage";
    }
    else if (![class isEqualToString:@"Entity"] &&
             ![class isEqualToString:@"EntityCollection"] &&
             ![class isEqualToString:@"EntityReference"] &&
             ![class isEqualToString:@"EntityReferenceCollection"] &&
             ![class isEqualToString:@"ErrorInfo"] &&
             ![class isEqualToString:@"FetchExpression"] &&
             ![class isEqualToString:@"Money"] &&
             ![class isEqualToString:@"OptionSetValue"] &&
             ![class isEqualToString:@"QueryBase"] &&
             ![class isEqualToString:@"RelatedEntityCollection"] &&
             ![class isEqualToString:@"Relationship"] &&
             ![class isEqualToString:@"ResourceInfo"] &&
             ![class isEqualToString:@"TraceInfo"] &&
             ![class isEqualToString:@"ValidationResult"]) {
        [NSException raise:@"Invalid Type"
                    format:@"The type '%@' is not valid for SOAP.", class];
    }
    
    return NSClassFromString(class);
}

+ (NSArray *)attributesForKey:(NSString *)key inArray:(NSArray *)array
{
    for (id dict in array) {
        if ([dict isKindOfClass:[NSDictionary class]]) {
            id nodeName = dict[@"nodeName"];
            
            if ([nodeName isKindOfClass:[NSString class]] && [nodeName isEqual:key]) {
                return (NSArray *)dict[@"attributes"];
            }
        }
    }
    
    return nil;
}

+ (NSObject *)oneForKey:(NSString *)key inArray:(NSArray *)array
{
    __block NSObject *retVal = nil;
    
    [SOAPMapper forKey:key inArray:array with:^void(NSObject *value) {
        retVal = value;
    }];
    
    return retVal;
}

+ (void)forKey:(NSString *)key inArray:(NSArray *)array with:(void(^)(NSObject *value))handler
{
    for (id dict in array) {
        if ([dict isKindOfClass:[NSDictionary class]]) {
            id nodeName = dict[@"nodeName"];
            
            if ([nodeName isKindOfClass:[NSString class]] && [nodeName isEqual:key]) {
                handler(dict[nodeName]);
            }
        }
    }
}

@end
