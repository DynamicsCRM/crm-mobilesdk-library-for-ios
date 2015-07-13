//  FetchExpression.m

#import "FetchExpression.h"
#import "NSString+XMLEncode.h"
#import "SOAPMapper.h"
#import "NSString+CRMString.h"

@implementation FetchExpression

- (NSString *)generateSOAP
{
    NSString *querySOAP = (self.query == nil) ?
        @"<a:Query i:nil=\"true\" />" :
        [NSString stringWithFormat:@"<a:Query>%@</a:Query>", [self.query xmlEncode]];
    
    return [NSString stringWithFormat:
            @"<b:value i:type=\"a:FetchExpression\">"
                "%@"
            "</b:value>",
            querySOAP];
}

+ (instancetype)instanceWithObject:(NSObject *)obj
{
    if (![obj isKindOfClass:[NSArray class]]) {
        return nil;
    }
    
    FetchExpression *fetch = [[FetchExpression alloc] init];
    fetch.query = [NSString instanceWithObject:[SOAPMapper oneForKey:@"Query" inArray:(NSArray *)obj]];
    
    return fetch;
}
@end
