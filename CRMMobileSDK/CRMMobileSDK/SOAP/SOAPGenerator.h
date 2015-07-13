//  SOAPGenerator.h

#import <Foundation/Foundation.h>

@protocol SOAPGenerator <NSObject>

- (NSString *)generateSOAP;

@optional

- (NSString *)generateSOAPForArray;

@end
