#import <Foundation/Foundation.h>
#import <KeyWordDetection/KeyWordDetection.h>
#import <React/RCTEventEmitter.h>
#import <React/RCTBridge.h>

@interface KeyWordRNBridge : RCTEventEmitter <KeywordDetectionRNDelegate>
+ (void)sendEventWithName:(NSString *)name body:(id)body;
@end
