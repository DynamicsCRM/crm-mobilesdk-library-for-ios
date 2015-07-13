//  RelationshipQueryCollection.h

#import <Foundation/Foundation.h>
#import "SOAPGenerator.h"

@interface RelationshipQueryCollection : NSObject <SOAPGenerator>

@property (nonatomic, strong) NSDictionary *items;

@end
