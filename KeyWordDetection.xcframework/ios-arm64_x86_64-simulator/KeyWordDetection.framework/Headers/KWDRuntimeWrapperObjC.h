#import <Foundation/Foundation.h>

@protocol KeywordDetectionRNDelegate;
@interface KWDRuntimeWrapper : NSObject
+ (instancetype)shared;
- (void)setDelegate:(id<KeywordDetectionRNDelegate>)delegate;
@end
