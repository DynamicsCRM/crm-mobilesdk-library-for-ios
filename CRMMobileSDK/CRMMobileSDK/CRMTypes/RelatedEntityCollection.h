//  RelatedEntityCollection.h

#import <Foundation/Foundation.h>
#import "SOAPGenerator.h"
#import "SOAPParser.h"

@interface RelatedEntityCollection : NSObject <SOAPGenerator, SOAPParser>

@property (nonatomic, strong) NSDictionary *items;

@end
