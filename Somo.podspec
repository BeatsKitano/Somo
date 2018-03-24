
Pod::Spec.new do |s|

  s.name         = "Somo"
  s.version      = "0.8.0"
  s.summary      = "Somo is a Skeleton-style animation library that's simple enough."

  s.homepage     = "https://github.com/xorshine/Somo"

  s.license      = "MIT"

  s.author       = { "xorshine" => "xorshine@icloud.com" }

  s.platform     = :ios

  s.source       = { :git => "https://github.com/xorshine/Somo.git", :tag => "#{s.version}" }

  s.source_files  = "SomoDemo/SomoDemo/Somo/*.{h,m}"


  # s.public_header_files = "Classes/**/*.h"

   s.requires_arc = true


end
