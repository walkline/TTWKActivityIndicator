# TTWKActivityIndicator

[![Build Status](https://travis-ci.org/TouchTribe/TTWKActivityIndicator.svg?branch=master)](https://travis-ci.org/TouchTribe/TTWKActivityIndicator)

A drop-in component helps creating activity animations similar to the system ones and it can be used both in WatchKit extensions and regular iOS apps.

<img src="screenshot.gif" style="width: 155px" />

You can customize the color and the size of the bubbles. Both the current and the old animation styles are supported (the 'old' as seen in the betas of the Apple Watch simulator, the rotating one).

## Quick Start

To use with your WatchKit extension:

 - add a `WKInterfaceImage` into your storyboard exactly where you want the activity indicator to appear (an instance of `WKInterfaceGroup` can be used as well);

 - make sure its Mode is set to `Center` and Width and Height to `Size To Fit Content`;

 - connect the image with a corresponding property of your subclass of `WKInterfaceController`;

 - import `TTWKActivityIndicator.h`;

 - create an instance of `TTWKActivityIndicator` within your `awakeWithContext:` method, for example:

    ```objective-c
    // This will create it with the default style and size
    TTWKActivityIndicator *indicator = [[TTWKActivityIndicator alloc]
        initWithColor:[UIColor colorWithRed:0.9922 green:0.4549 blue:0.0000 alpha:1.0]
    ];
    ```

 - then transfer it into your image using `setToGroupOrImage:` method:

    ```objective-c
    // Assuming self.activityIndicator is an instance of WKInterfaceImage or WKInterfaceGroup
    [indicator setToGroupOrImage:self.activityIndicator];
    ```

 - done!
 
In order to stop/hide the indicator you can hide the containing image or group, or you can reset its `image` (or `backgroundImage`) property to `nil`.

You can also check out the example project in `./Example/ActivityIndicator.xcodeproj`, header files have plenty of comments as well.

## Performance

Note that since the animated image of the indicator is created on the phone at run time it needs to be transferred into the watch and this is where you can expect a delay the very first time the indicator is used. It will be cached in the image cache of the watch however (provided you use `setToGroupOrImage:`), so subsequent setting of indicators of the same size and color will be as quick as if the image was prerendered and stored on the device.

## Installation

TTWKActivityIndicator is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod 'TTWKActivityIndicator'

You can also just drop in `/Pod/Classes/TTWKActivityIndicator.*` into your project (along with `/Pod/Classes/TTWKActivityIndicatorView.*` in case you need it a normal iOS app as well).

## Author & License

TTWKActivityIndicator is created by [TouchTribe B.V.](http://www.touchtribe.nl) and is available under the MIT license. See the LICENSE file for more info.
