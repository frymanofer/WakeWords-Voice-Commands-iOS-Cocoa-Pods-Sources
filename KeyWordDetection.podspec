Pod::Spec.new do |s|
  s.cocoapods_version   = '>= 1.10.0'
  s.name            = 'KeyWordDetection'
  # s.module_name     = 'KeyWordDetection'
  s.version         = '1.0.34'
  s.summary         = 'Wake-word detection for React Native'
  s.description  = <<-DESC
                    A React Native module for wake word detection .
                    DESC
  s.homepage     = "https://github.com/frymanofer/KeywordsDetectionAndroidLibrary.git" # Update with your repo URL
  s.license      = { :type => "MIT" } # Update if different
  s.author       = { "Your Name" => "ofer@davoice.io" } # Update with 

  s.requires_arc        = true
  s.platform        = :ios, '13.5'

#  s.preserve_paths      = 'docs', 'CHANGELOG.md', 'LICENSE', 'package.json', 'KeyWordDetection.ios.js'
  s.source_files = [
    'ios/*.{h,m,mm,swift}'
  ]
  s.vendored_frameworks = 'KeyWordDetection.xcframework'
  s.resource_bundles = {'KeyWordDetectionPrivacy' => ['ios/Resources/PrivacyInfo.xcprivacy']}

  s.source       = 
    { :git => 'https://github.com/frymanofer/WakeWords-Voice-Commands-iOS-Cocoa-Pods-Sources.git', 
    :tag => s.version.to_s }


  # ① - Treat the binary as a *static* framework when the integrator
  #    asks for static linkage.
  s.static_framework = true          # ← add this

  # ② - Tell CocoaPods the binary is static so it keeps the headers
  #     when it re-packages the pod.

  s.swift_version       = '5.0'

  s.resources = 'ios/models/*'

  s.dependency 'onnxruntime-objc', '~> 1.20.0'
  s.dependency 'React-Core'
  # 👇 Add these for React Native headers
  s.dependency 'React-Core'
  s.dependency 'React-Core/Bridge'
  s.dependency 'React-Core/DevSupport' # if needed


  s.pod_target_xcconfig = {
    'HEADER_SEARCH_PATHS' => '"${PODS_ROOT}/Headers/Public/React-Core"'
  }

  # flags
  # s.pod_target_xcconfig = {
  #   'BUILD_LIBRARY_FOR_DISTRIBUTION' => 'YES'
  # }  
  #s.public_header_files = 'ios/KeyWordDetection/KeyWordDetection.xcframework/**/Headers/*.h'  
end
