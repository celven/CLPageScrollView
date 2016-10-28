
Pod::Spec.new do |s|


  s.name         = "CLScrollPageView"
  s.version      = "1.0.3"
  s.summary      = "A short description of CLScrollPageView."

  #s.description  = <<-DESC
                   DESC

  s.homepage     = "https://github.com/cleven1/CLScrollPageView"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  s.license      = "MIT"

  s.author             = { "cleven" => "cleven_zhao@foxmail.com" }


  # s.platform     = :ios
  # s.platform     = :ios, "5.0"

  s.source       = { :git => "https://github.com/cleven1/CLScrollPageView.git", :tag => "1.0.3" }

  s.source_files  = "ScrollPageView", "*.{swift}"
  #s.exclude_files = "Classes/Exclude"

  # s.public_header_files = "Classes/**/*.h"

  # s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
