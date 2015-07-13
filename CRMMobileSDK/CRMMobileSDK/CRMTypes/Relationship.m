//  Relationship.m

#import "Relationship.h"
#import "SOAPMapper.h"
#import "NSString+XMLEncode.h"

@implementation Relationship

- (instancetype)init
{
    return [self initWithSchemaName:nil];
}

- (instancetype)initWithSchemaName:(NSString *)schemaName
{
    self = [super init];
    if (self) {
        self.primaryEntityRole = EntityRoleNull;
        self.schemaName = schemaName;
    }
    
    return self;
}

- (NSString *)generateSOAP
{
    NSString *entityRole = nil;
    switch (self.primaryEntityRole) {
        case EntityRoleReferenced:
            entityRole = @"<a:PrimaryEntityRole>Referenced</a:PrimaryEntityRole>";
            break;
        case EntityRoleReferencing:
            entityRole = @"<a:PrimaryEntityRole>Referencing</a:PrimaryEntityRole>";
            break;
        case EntityRoleNull:
        default:
            entityRole = @"<a:PrimaryEntityRole i:nil=\"true\" />";
            break;
    }
    
    NSString *schemaName = self.schemaName ?
        [NSString stringWithFormat:@"<a:SchemaName>%@</a:SchemaName>", [self.schemaName xmlEncode]] :
        @"<a:SchemaName i:nil=\"true\" />";
    
    return [NSString stringWithFormat:@"%@%@", entityRole, schemaName];
}

- (id)copyWithZone:(NSZone *)zone
{
    Relationship *copy = [[Relationship alloc] initWithSchemaName:[self.schemaName copy]];
    copy.primaryEntityRole = self.primaryEntityRole;
    
    return copy;
}

- (BOOL)isEqual:(id)object
{
    if (self == object) return YES;
    if (![object isKindOfClass:[Relationship class]]) return NO;
    
    Relationship *other = (Relationship *)object;
    return (self.primaryEntityRole == other.primaryEntityRole) && ([self.schemaName isEqualToString:other.schemaName]);
}

- (NSUInteger)hash
{
    return [self.schemaName hash] ^ (self.primaryEntityRole + 1);
}

+ (instancetype)instanceWithObject:(NSObject *)obj
{
    if (![obj isKindOfClass:[NSArray class]]) {
        return nil;
    }
    
    NSString *schemaName = (NSString *)[SOAPMapper oneForKey:@"SchemaName" inArray:(NSArray *)obj];
    NSString *entityRole = (NSString *)[SOAPMapper oneForKey:@"PrimaryEntityRole" inArray:(NSArray *)obj];
    
    Relationship *relationship = [[Relationship alloc] initWithSchemaName:schemaName];
    
    if ([entityRole isEqualToString:@"Referenced"]) {
        relationship.primaryEntityRole = EntityRoleReferenced;
    }
    else if ([entityRole isEqualToString:@"Referencing"]) {
        relationship.primaryEntityRole = EntityRoleReferencing;
    }
    
    return relationship;
}

@end
