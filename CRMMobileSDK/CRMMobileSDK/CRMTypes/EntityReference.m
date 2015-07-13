//  EntityReference.m

#import "EntityReference.h"
#import "SOAPMapper.h"
#import "NSNull+CRMNull.h"
#import "NSString+CRMString.h"
#import "NSUUID+CRMUUID.h"
#import "NSString+XMLEncode.h"

@implementation EntityReference

- (instancetype)init
{
	return [self initWithLogicalName:nil id:nil];
}

- (instancetype)initWithLogicalName:(NSString *)logicalName id:(NSUUID *)id
{
	self = [super init];
	if (self) {
		self.logicalName = logicalName;
		self.id = id;
	}
	
	return self;
}

- (NSObject *)generateJSON
{
    return @{
        @"Id": [self.id generateJSON],
        @"LogicalName": [self.logicalName generateJSON],
        @"Name": [[NSNull null] generateJSON]
    };
}

- (NSString *)generateSOAP
{
    NSString *idSOAP = (self.id == nil) ?
        @"<a:Id i:nil=\"true\" />" :
        [NSString stringWithFormat:@"<a:Id>%@</a:Id>", [self.id UUIDString]];
    
    NSString *logicalNameSOAP = (self.logicalName == nil) ?
        @"<a:LogicalName i:nil=\"true\" />" :
        [NSString stringWithFormat:@"<a:LogicalName>%@</a:LogicalName>", [self.logicalName xmlEncode]];
    
    return [NSString stringWithFormat:
            @"<b:value i:type=\"a:EntityReference\">"
                "%@"
                "%@"
                "<a:Name i:nil=\"true\" />"
            "</b:value>",
            idSOAP, logicalNameSOAP];
}

+ (instancetype)instanceWithJSONObject:(NSObject *)obj
{
    if (![obj isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    
    NSDictionary *dict = (NSDictionary *)obj;
    NSUUID *entityId = [NSUUID instanceWithJSONObject:dict[@"Id"]];
    if (!entityId) {
        return nil;
    }
    
    EntityReference *entityRef = [[EntityReference alloc] init];
    
    entityRef.id = entityId;
    entityRef.logicalName = [NSString instanceWithJSONObject:dict[@"LogicalName"]];
    entityRef.name = [NSString instanceWithJSONObject:dict[@"Name"]];
    
    return entityRef;
}

+ (instancetype)instanceWithObject:(NSObject *)obj
{
    if (![obj isKindOfClass:[NSArray class]]) {
        return nil;
    }
    
    NSArray *objArray = (NSArray *)obj;
    NSUUID *id = [NSUUID instanceWithObject:[SOAPMapper oneForKey:@"Id" inArray:objArray]];
    NSString *logicalName = (NSString *)[SOAPMapper oneForKey:@"LogicalName" inArray:objArray];
    
    EntityReference *entityReference = [[EntityReference alloc] initWithLogicalName:logicalName id:id];
    entityReference.name = (NSString *)[SOAPMapper oneForKey:@"Name" inArray:objArray];
    
    return entityReference;
}

@end
