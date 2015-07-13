//  ColumnSet.h

#import "SOAPGenerator.h"

@interface ColumnSet : NSObject <SOAPGenerator>

@property BOOL allColumns;
@property (nonatomic, strong) NSArray *columns;

- (instancetype)initWithAllColumns:(BOOL)allColumns;
- (instancetype)initWithColumns:(NSArray *)columns;

@end
