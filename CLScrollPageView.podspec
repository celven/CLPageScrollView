
Pod::Spec.new do |s|
  s.name         = "CLScrollPageView"
  s.version      = "1.0.1"
  s.summary      = "Use CLScrollPageView as if it supports swift3.0."

  s.description  = <<-DESC
                   # Problem


  s.homepage     = "https://github.com/celven/CLPageScrollView.git"
  
  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.license = { :type => "MIT", :file => "LICENSE" }
  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.author = { "cleven" => "543069316@qq.com" }
  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.platform = :ios, "6.0"
  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.source = { :git => "https://github.com/celven/CLPageScrollView.git", :tag => "1.0.1" }
  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.source_files  = "CLScrollPageView/*.{h,m}"
  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.requires_arc = true
  s.frameworks = 'Foundation', 'UIKit' 
end
