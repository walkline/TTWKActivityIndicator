Pod::Spec.new do |s|
  s.name             = "TTWKActivityIndicator"
  s.version          = "0.1.0"
  s.summary          = "AppleWatch-style activity indicator."
  s.description      = <<-DESC
                       Recreates AppleWatch activity indicator animation at runtime and allows to customize its color and size.
					   Can be used both in WatchKit extensions and in regular apps.
                       DESC
  s.homepage         = "https://github.com/touchtribe/TTWKActivityIndicator"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "TouchTribe B.V." => "info@touchtribe.nl" }
  s.source           = { :git => "https://github.com/touchtribe/TTWKActivityIndicator.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '5.1.1'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
end
