//  NSString+XMLEncode.m

#import "NSString+XMLEncode.h"

@implementation NSString (XMLEncode)

// This method encodes FetchXML for inclusion in a retrieve multiple call
- (NSString *)xmlEncode
{
    NSMutableString *retVal = [self mutableCopy];
    
    [retVal replaceOccurrencesOfString:@"&"  withString:@"&amp;"  options:NSLiteralSearch range:NSMakeRange(0, [retVal length])];
    [retVal replaceOccurrencesOfString:@"\"" withString:@"&quot;" options:NSLiteralSearch range:NSMakeRange(0, [retVal length])];
    [retVal replaceOccurrencesOfString:@"'"  withString:@"&apos;" options:NSLiteralSearch range:NSMakeRange(0, [retVal length])];
    [retVal replaceOccurrencesOfString:@">"  withString:@"&gt;"   options:NSLiteralSearch range:NSMakeRange(0, [retVal length])];
    [retVal replaceOccurrencesOfString:@"<"  withString:@"&lt;"   options:NSLiteralSearch range:NSMakeRange(0, [retVal length])];
    
    return retVal;
}

- (NSString *)xmlDecode
{
    NSMutableString *retVal = [self mutableCopy];
    
    [retVal replaceOccurrencesOfString:@"&amp;"  withString:@"&"  options:NSLiteralSearch range:NSMakeRange(0, [retVal length])];
    [retVal replaceOccurrencesOfString:@"&quot;" withString:@"\"" options:NSLiteralSearch range:NSMakeRange(0, [retVal length])];
    [retVal replaceOccurrencesOfString:@"&apos;"  withString:@"'" options:NSLiteralSearch range:NSMakeRange(0, [retVal length])];
    [retVal replaceOccurrencesOfString:@"&gt;"  withString:@">"   options:NSLiteralSearch range:NSMakeRange(0, [retVal length])];
    [retVal replaceOccurrencesOfString:@"&lt;"  withString:@"<"   options:NSLiteralSearch range:NSMakeRange(0, [retVal length])];
    
    return retVal;
}

@end
