Pod::Spec.new do |s|
  # ─── metadata ───────────────────────────────────────────────────────
  s.name            = 'KeyWordDetection'
  s.version         = '1.0.57'
  s.summary         = 'Wake-word detection for iOS / React-Native'
  s.description     = 'Static XCFramework + optional React-Native bridge.'
  s.homepage        = 'https://github.com/frymanofer/WakeWords-Voice-Commands-iOS-Cocoa-Pods-Sources'
  s.license         = { :type => 'MIT' }
  s.author          = { 'Ofer Fryman' => 'ofer@davoice.io' }

  s.cocoapods_version = '>= 1.10.0'
  s.platform       = :ios, '13.5'
  s.swift_version  = '5.0'
  s.static_framework = true     # applies to every subspec
  s.source = {
    :git => 'https://github.com/frymanofer/WakeWords-Voice-Commands-iOS-Cocoa-Pods-Sources.git',
    :tag => s.version.to_s
  }

  # ⚠️  Default to *Core only* so `pod spec lint` succeeds.
  s.default_subspecs = 'Core'

  # ─── Core (no React) ────────────────────────────────────────────────
  s.subspec 'Core' do |core|
    core.vendored_frameworks = 'KeyWordDetection.xcframework'

    core.resource_bundles = {
      'KeyWordDetectionPrivacy' => ['ios/Resources/PrivacyInfo.xcprivacy']
    }
    core.resources = 'ios/models/*'

    core.dependency 'onnxruntime-objc', '~> 1.20.0'
    # ← NO React deps here
  end

  # ─── ReactBridge (optional) ─────────────────────────────────────────
  s.subspec 'ReactBridge' do |rb|
    # Obj-C / Obj-C++ bridge files
    rb.source_files = 'ios/*.{h,m,mm}'

    # Link the Swift part of the binary
    rb.dependency 'KeyWordDetection/Core'

    # Bring in the RN headers & libs
    rb.dependency 'React-Core'

    # That’s enough;   RCTEventEmitter.h lives **inside** React-Core
    # include path will be <React/RCTEventEmitter.h>

    # Allow Swift generated headers to be found by Obj-C
    rb.pod_target_xcconfig = {
      'HEADER_SEARCH_PATHS' =>
        '$(inherited) ' \
        '"$(PODS_CONFIGURATION_BUILD_DIR)/React-Core/React_Core.framework/Headers" ' \
        '"$(PODS_ROOT)/Headers/Private/React-Core" ' \
        '"$(PODS_ROOT)/Headers/Public/React-Core"',   # ← add comma here
      'DEFINES_MODULE'       => 'YES',
      'CLANG_ENABLE_MODULES' => 'YES'
    }
  end
end
