//  UIImage+CRMImage.h

#import <UIKit/UIKit.h>
#import "JSONGenerator.h"
#import "JSONParser.h"
#import "SOAPGenerator.h"
#import "SOAPParser.h"

@interface UIImage (CRMImage) <JSONGenerator, JSONParser, SOAPGenerator, SOAPParser>

@end
