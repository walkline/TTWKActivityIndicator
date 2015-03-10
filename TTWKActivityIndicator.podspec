Pod::Spec.new do |s|
  s.name             = "TTWKActivityIndicator"
  s.version          = "0.1.0"
  s.summary          = "AppleWatch-style activity indicator."
  s.description      = <<-DESC
                       A drop-in component that simplifies creating of AppleWatch-style activity animations at run time in both 
                       regular iOS apps and WatchKit extensions. You can customize the color and the size of the bubbles.
                       DESC
  s.homepage         = "https://github.com/touchtribe/TTWKActivityIndicator"
  s.screenshots      = 'http://github.com/touchtribe/TTWKActivityIndicator/screenshot.gif'
  s.license          = 'MIT'
  s.author           = { "TouchTribe B.V." => "info@touchtribe.nl" }
  s.source           = { :git => "https://github.com/touchtribe/TTWKActivityIndicator.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  
  s.platform     = :ios, '5.1.1'
  s.requires_arc = true
  
  s.frameworks = 'WatchKit'

  s.source_files = 'Pod/Classes/**/*'
end
