Pod::Spec.new do |s|
  # ─── metadata ────────────────────────────────────────────────────────
  s.name          = 'KeyWordDetection'
  s.version       = '1.0.45'
  s.cocoapods_version = '>= 1.10.0'
  s.summary       = 'Wake-word detection for React-Native'
  s.description   = 'A React-Native module providing on-device wake-word detection.'
  s.homepage      = 'https://github.com/frymanofer/WakeWords-Voice-Commands-iOS-Cocoa-Pods-Sources'
  s.license       = { :type => 'MIT' }
  s.author        = { 'Ofer Fryman' => 'ofer@davoice.io' }

  s.platform      = :ios, '13.5'
  s.swift_version = '5.0'

  #  ←–––––––––  put it **here** so it applies to every subspec
  s.static_framework = true

  s.source = {
    :git => 'https://github.com/frymanofer/WakeWords-Voice-Commands-iOS-Cocoa-Pods-Sources.git',
    :tag => s.version.to_s
  }

  # deliver the bridge by default
  s.default_subspecs = 'ReactBridge'

  # ─────────── Subspecs ────────────────────────────────────────────────
  s.subspec 'Core' do |core|
    core.vendored_frameworks = 'KeyWordDetection.xcframework'
    core.resource_bundles = {
      'KeyWordDetectionPrivacy' => ['ios/Resources/PrivacyInfo.xcprivacy']
    }
    core.resources = 'ios/models/*'
    core.dependency 'onnxruntime-objc', '~> 1.20.0'
  end

  s.subspec 'ReactBridge' do |rb|
    rb.source_files  = 'ios/*.{h,m,mm,swift}'

    rb.dependency 'KeyWordDetection/Core'
    rb.dependency 'React-Core'
    rb.dependency 'React-RCTEventEmitter'     # RN ≥ 0.72 header split
  end
end
