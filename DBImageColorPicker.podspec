Pod::Spec.new do |s|
  s.name         = "DBImageColorPicker"
  s.version      = "1.0.1"
  s.summary      = "It's very useful component for determine different colors from your image."
  s.homepage     = "https://github.com/d0ping/DBImageColorPicker"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"
  s.license      = "MIT"
  s.author 	 = "Denis Bogatyrev"
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/d0ping/DBImageColorPicker.git", :tag => "1.0.1" }
  s.source_files = "Source", "Source/**/*.{h,m}"
  # s.exclude_files = "Classes/Exclude"
  s.public_header_files = "Source/**/*.h"
end
