Pod::Spec.new do |s|
  s.name         = "CRMMobileSDK"
  s.version      = "1.0.0"
  s.summary      = "Microsoft Dynamics CRM Mobile SDK Library for iOS"
  s.description  = <<-DESC
		   Microsoft Dynamics CRM authentication and data connectivity libraries for iOS apps.
                   DESC
  s.homepage     = "https://github.com/DynamicsCRM/crm-mobilesdk-library-for-ios"
  s.license      = "MIT"
  s.author             = { "carmend" => "carmend@microsoft.com" }

  s.platform     = :ios
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/DynamicsCRM/crm-mobilesdk-library-for-ios.git" ,
                     :tag => "v#{s.version}"}
  s.exclude_files = "**/Build/**/*"
  s.requires_arc = true

  s.source_files  = "CRMMobileSDK/**/*.{h,m}"
  s.exclude_files = "CRMMobileSDK/CRMMobileSDKTests/**/*"
  s.public_header_files = "CRMMobileSDK/**/*.h"
  s.header_dir = "CRMMobileSDK"

  s.library = 'xml2'
  s.xcconfig = { 'HEADER_SEARCH_PATHS' => '/usr/include/libxml2' }

  s.dependency 'ADALiOS', '=1.2.4'
end
