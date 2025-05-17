Pod::Spec.new do |s|
  # ───── high-level metadata ──────────────────────────────────────────
  s.cocoapods_version    = '>= 1.10.0'
  s.name                 = 'KeyWordDetection'
  s.version              = '1.0.44'
  s.summary              = 'Wake-word detection for React-Native'
  s.description          = 'A React Native module for on-device wake-word detection.'
  s.homepage             = 'https://github.com/frymanofer/WakeWords-Voice-Commands-iOS-Cocoa-Pods-Sources'
  s.license              = { :type => 'MIT' }
  s.author               = { 'Ofer Fryman' => 'ofer@davoice.io' }

  s.platform             = :ios, '13.5'
  s.swift_version        = '5.0'

  # where the spec itself is fetched from
  s.source               = {
    :git => 'https://github.com/frymanofer/WakeWords-Voice-Commands-iOS-Cocoa-Pods-Sources.git',
    :tag => s.version.to_s
  }

  # make the *bridge* the default that users get when they write
  #   pod 'KeyWordDetection'
  s.default_subspecs     = 'ReactBridge'

  # ───── Sub-spec ① – the pure binary core ────────────────────────────
  s.subspec 'Core' do |core|
    core.static_framework   = true              # static XCFramework
    core.vendored_frameworks = 'KeyWordDetection.xcframework'

    core.resource_bundles  = {
      'KeyWordDetectionPrivacy' => ['ios/Resources/PrivacyInfo.xcprivacy']
    }
    core.resources         = 'ios/models/*'

    core.dependency 'onnxruntime-objc', '~> 1.20.0'
  end

  # ───── Sub-spec ② – the React-Native bridge layer ───────────────────
  s.subspec 'ReactBridge' do |rb|
    # Obj-C / Obj-C++ / Swift files that talk to React-Native
    rb.source_files        = 'ios/*.{h,m,mm,swift}'

    # depend on the binary *and* on React headers
    rb.dependency 'KeyWordDetection/Core'
    rb.dependency 'React-Core'
    rb.dependency 'React-RCTEventEmitter'       # RN ≥ 0.72 header split
  end
end
