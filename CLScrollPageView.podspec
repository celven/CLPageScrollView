
Pod::Spec.new do |s|


  s.name         = "CLScrollPageView"
  s.version      = "1.0.3"
  s.summary      = "A short description of CLScrollPageView."

  #s.description  = <<-DESC
                   DESC

  s.homepage     = "http://EXAMPLE/CLScrollPageView"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  s.license      = "MIT (example)"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }

  s.author             = { "cleven" => "cleven_zhao@foxmail.com" }
  # Or just: s.author    = "cleven"
  # s.authors            = { "cleven" => "cleven_zhao@foxmail.com" }
  # s.social_media_url   = "http://twitter.com/zhaoyongqiang"

  # s.platform     = :ios
  # s.platform     = :ios, "5.0"

  #  When using multiple platforms
  # s.ios.deployment_target = "5.0"
  # s.osx.deployment_target = "10.7"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"


  s.source       = { :git => "https://github.com/cleven1/CLScrollPageView.git", :tag => "#{1.0.3}" }

  s.source_files  = "Classes", "Classes/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"

  # s.public_header_files = "Classes/**/*.h"

  # s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
