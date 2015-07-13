//  Relationship.h

#import <Foundation/Foundation.h>
#import "SOAPGenerator.h"
#import "SOAPParser.h"

typedef enum {
    EntityRoleNull = -1,
    EntityRoleReferencing = 0,
    EntityRoleReferenced = 1
} EntityRole;

@interface Relationship : NSObject <NSCopying, SOAPGenerator, SOAPParser>

@property EntityRole primaryEntityRole;
@property (nonatomic, strong) NSString *schemaName;

- (instancetype)initWithSchemaName:(NSString *)schemaName;

@end
