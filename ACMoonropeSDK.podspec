Pod::Spec.new do |s|
  s.name         = "ACMoonropeSDK"
  s.version      = "1.0.0"
  s.summary      = "An Objective-C client library for Moonrope APIs"
  s.description  = s.summary
  s.homepage     = "http://github.com/adamcooke/moonrope-oc-sdk"
  s.license      = { :type => "MIT", :file => "MIT-LICENSE" }
  s.author       = { "Adam Cooke" => "adam@atechmedia.com" }
  s.social_media_url   = "http://twitter.com/adamcooke"
  s.platform     = :ios, "8.0"
  s.source       = {:git => "https://github.com/adamcooke/moonrope-oc-sdk.git", :tag => '1.0.0'}
  s.source_files  = "Classes", "Classes/**/*.{h,m}"
  s.requires_arc = true
end
