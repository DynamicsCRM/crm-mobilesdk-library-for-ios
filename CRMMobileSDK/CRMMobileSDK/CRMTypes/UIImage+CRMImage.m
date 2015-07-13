//  UIImage+CRMImage.m

#import "UIImage+CRMImage.h"

@implementation UIImage (CRMImage)

- (NSObject *)generateJSON
{
    NSData *imageData = UIImagePNGRepresentation(self);
    return [imageData base64EncodedStringWithOptions:0];
}

- (NSString *)generateSOAP
{
    NSData *imageData = UIImagePNGRepresentation(self);
    
    return [NSString stringWithFormat:
            @"<b:value i:type=\"d:base64Binary\" xmlns:d=\"http://www.w3.org/2001/XMLSchema\">"
                "%@"
            "</b:value>",
            [imageData base64EncodedStringWithOptions:0]];
}

+ (instancetype)instanceWithJSONObject:(NSObject *)obj
{
    if (![obj isKindOfClass:[NSString class]]) {
        return nil;
    }
    
    NSData *imageData = [[NSData alloc] initWithBase64EncodedString:(NSString *)obj options:0];
    return [UIImage imageWithData:imageData];
}

+ (instancetype)instanceWithObject:(NSObject *)obj
{
    if (![obj isKindOfClass:[NSString class]]) {
        return nil;
    }
    
    NSData *imageData = [[NSData alloc] initWithBase64EncodedString:(NSString *)obj options:0];
    return [UIImage imageWithData:imageData];
}

@end
