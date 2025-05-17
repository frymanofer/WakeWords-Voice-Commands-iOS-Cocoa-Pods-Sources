#import <Foundation/Foundation.h>
#import <KeyWordDetection/KeyWordDetection-Swift.h>
#import <React/RCTEventEmitter.h>
#import <React/RCTBridge.h>

@interface KeyWordRNBridge : RCTEventEmitter <KeywordDetectionRNDelegate>
+ (void)sendEventWithName:(NSString *)name body:(id)body;
@end
