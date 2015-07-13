//  EntityReferenceCollection.h

#import "SOAPParser.h"

@interface EntityReferenceCollection : NSObject <SOAPParser>

@property (nonatomic, strong) NSArray *items;

@end
