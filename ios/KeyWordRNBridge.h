#import <Foundation/Foundation.h>
#if __has_include(<React/RCTEventEmitter.h>)
  #import <React/RCTEventEmitter.h>
  #import <React/RCTBridge.h>
#else
  /* React-Core was built as a framework → module name is React_Core */
  #import <React_Core/RCTEventEmitter.h>
  #import <React_Core/RCTBridge.h>
#endif

@interface KeyWordRNBridge : RCTEventEmitter <KeywordDetectionRNDelegate>
+ (void)sendEventWithName:(NSString *)name body:(id)body;
@end
