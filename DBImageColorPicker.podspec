Pod::Spec.new do |s|
  s.name         = 'DBImageColorPicker'
  s.version      = '1.0.6'
  s.authors = { 'Denis Bogatyrev' => 'denis.bogatyrev@gmail.com' }
  s.summary      = 'Very useful component for determine different colors from your image'
  s.homepage     = 'https://github.com/d0ping/DBImageColorPicker'
  s.license      = { :type => 'MIT' }
  s.requires_arc = true
  s.platform     = :ios, '7.0'
  s.source       = { :git => 'https://github.com/d0ping/DBImageColorPicker.git', :tag => "#{s.version}" }
  s.source_files = 'Source/**/*.{h,m}'
  s.public_header_files = 'Source/**/*.h'
end
