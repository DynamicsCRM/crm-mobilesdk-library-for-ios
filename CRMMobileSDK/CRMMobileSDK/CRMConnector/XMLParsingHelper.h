//  XMLParsingHelper.h

#import <Foundation/Foundation.h>

@interface XMLParsingHelper : NSObject

+ (XMLParsingHelper*)parsingHelperWithXML:(NSString *)xmlDocString;
- (NSArray *)xPathSearchFor:(NSString *)xPathQuery;

@end
