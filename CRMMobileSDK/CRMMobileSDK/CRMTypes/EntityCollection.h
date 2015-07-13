//  EntityCollection.h

#import "SOAPGenerator.h"
#import "SOAPParser.h"

@interface EntityCollection : NSObject <SOAPGenerator, SOAPParser>

@property (nonatomic, strong) NSArray *entities;
@property (nonatomic, strong) NSString *entityName;
@property (nonatomic, strong) NSString *minActiveRowVersion;
@property (nonatomic, strong) NSString *pagingCookie;

@property BOOL moreRecords;
@property int totalRecordCount;
@property BOOL totalRecordCountLimitExceeded;

- (instancetype)initWithEntityName:(NSString *)entityName;
- (instancetype)initWithEntityName:(NSString *)entityName schemaName:(NSString *)schemaName dictionary:(NSDictionary *)dict;

@end
