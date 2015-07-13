//  SOAPMapper.h

#import <Foundation/Foundation.h>

@interface SOAPMapper : NSObject

+ (Class)classForType:(NSString *)type;

+ (NSArray *)attributesForKey:(NSString *)key inArray:(NSArray *)array;
+ (NSObject *)oneForKey:(NSString *)key inArray:(NSArray *)array;
+ (void)forKey:(NSString *)key inArray:(NSArray *)array with:(void(^)(NSObject *value))handler;

@end
