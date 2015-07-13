//  ColumnSet.m

#import "ColumnSet.h"
#import "NSString+XMLEncode.h"

@implementation ColumnSet

- (instancetype)initWithAllColumns:(BOOL)allColumns
{
    return [self initWithColumns:nil allColumns:allColumns];
}

- (instancetype)initWithColumns:(NSArray *)columns
{
    return [self initWithColumns:columns allColumns:NO];
}

- (instancetype)initWithColumns:(NSArray *)columns allColumns:(BOOL)allColumns
{
    self = [super init];
    if (self) {
        self.allColumns = allColumns;
        self.columns = columns;
    }
    
    return self;
}

- (NSString *)generateSOAP
{
    NSString *attributes = @"";
    for (id attribute in self.columns) {
        if (![attribute isKindOfClass:[NSString class]]) {
            [NSException raise:@"Invalid Attribute Name"
                        format:@"Attribute \"%@\" is not of type NSString.", attribute];
        }
        
        NSString *attrSOAP = [NSString stringWithFormat:@"<d:string>%@</d:string>", [attribute xmlEncode]];
        attributes = [attributes stringByAppendingString:attrSOAP];
    }
    
    return [NSString stringWithFormat:
            @"<b:value i:type=\"a:ColumnSet\">"
                "<a:AllColumns>%@</a:AllColumns>"
                "<a:Columns xmlns:d=\"http://schemas.microsoft.com/2003/10/Serialization/Arrays\">"
                    "%@"
                "</a:Columns>"
            "</b:value>",
            (self.allColumns ? @"true" : @"false"), attributes];
}

@end
