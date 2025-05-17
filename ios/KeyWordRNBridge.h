#import <Foundation/Foundation.h>
#import <React/RCTEventEmitter.h>
#import <React/RCTBridge.h>
#import <KeyWordDetection/KeyWordDetection-Swift.h>

@interface KeyWordRNBridge : RCTEventEmitter <KeywordDetectionRNDelegate>
+ (void)sendEventWithName:(NSString *)name body:(id)body;
@end
