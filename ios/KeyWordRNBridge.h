#import <React/RCTEventEmitter.h>
#import <KeyWordDetection/KeyWordDetection-Swift.h>

@interface KeyWordRNBridge : RCTEventEmitter <KeywordDetectionRNDelegate>
+ (void)sendEventWithName:(NSString *)name body:(id)body;
@end
