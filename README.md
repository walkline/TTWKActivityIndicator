# TTWKActivityIndicator

A drop-in component that simplifies creating of AppleWatch-style activity animations at run time in both 
regular iOS apps and WatchKit extensions. You can customize the color and the size of the bubbles.

![](screenshot.gif)

## Quick Start

To use with your WatchKit extension:

 - add a WKInterfaceImage into your storyboard exactly where you want the activity indicator;
 
 - make sure its Mode is set to 'Center' and Width and Height to 'Size To Fit Content';
 
 - connect the image with a corresponding property in your subclass of WKInterfaceController;
 
 - import TTWKActivityIndicator.h;
 
 - add a call to setActivityIndicatorImageWithColor within your awakeWithContext: method, for example:

        @property (nonatomic, weak) IBOutlet WKInterfaceImage *activityIndicator;
        // ...	
        - (void)awakeWithContext:(id)context {
        	// ...
            // Let's have a red activity animation
        	[self.activityIndicatorImage 
        		setActivityIndicatorImageWithColor:[UIColor colorWithRed:0.8588 green:0.0196 blue:0.0706 alpha:1.0]
        	];
        	// ...
        }

 - that's it.

You can also check out the example project in `./Example/ActivityIndicator.xcodeproj`, header files have plenty of comments as well.

## Installation

TTWKActivityIndicator is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "TTWKActivityIndicator"

You can also just drop in `/Pod/Classes/TTWKActivityIndicator.*` into your project (along with `/Pod/Classes/TTWKActivityIndicatorView.*` in case you need it a normal iOS app as well).

## Author & License

TTWKActivityIndicator is created by [TouchTribe B.V.](http://www.touchtribe.nl) and is available under the MIT license. See the LICENSE file for more info.
