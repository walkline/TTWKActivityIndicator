Pod::Spec.new do |s|
  s.name             = "TTWKActivityIndicator"
  s.version          = "0.3.2"
  s.summary          = "The missing activity indicator for Apple Watch."
  s.description      = <<-DESC
                       A drop-in component that helps creating activity animations similar to the system ones 
                       and that can be used both in WatchKit extensions and regular iOS apps.
                       
                       You can customize the color and the size of the bubbles. Both the current and the old 
                       animation styles are supported (the 'old' as seen in the betas of the Apple Watch simulator, 
                       the rotating one).
                       DESC
  s.homepage         = 'https://github.com/touchtribe/TTWKActivityIndicator'
  s.screenshots      = 'https://raw.githubusercontent.com/TouchTribe/TTWKActivityIndicator/master/screenshot.gif'
  s.license          = 'MIT'
  s.author           = { "TouchTribe B.V." => "info@touchtribe.nl" }
  s.source           = { :git => "https://github.com/touchtribe/TTWKActivityIndicator.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/touchtribe_info'
  
  s.platform     = :ios, '5.1'
  s.requires_arc = true
  
  s.frameworks = 'WatchKit'

  s.source_files = 'Pod/Classes/**/*'
end
