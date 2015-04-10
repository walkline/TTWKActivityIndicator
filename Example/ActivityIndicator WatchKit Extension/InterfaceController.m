//
//  TTWKActivityIndicator example
//  Copyright (c) 2015 TouchTribe B.V. All rights reserved.
//

#import "InterfaceController.h"

#import "TTWKActivityIndicator.h"

@interface InterfaceController()

@property (weak, nonatomic) IBOutlet WKInterfaceImage *activityIndicator;
@property (weak, nonatomic) IBOutlet WKInterfaceImage *smallerActivityIndicator;

@property (weak, nonatomic) IBOutlet WKInterfaceImage *activityIndicatorBeta;
@property (weak, nonatomic) IBOutlet WKInterfaceImage *smallerActivityIndicatorBeta;

@end

@implementation InterfaceController

- (void)awakeWithContext:(id)context {

    [super awakeWithContext:context];

	TTWKActivityIndicator *normalIndicator = [[TTWKActivityIndicator alloc]
		initWithColor:[UIColor colorWithRed:0.9922 green:0.4549 blue:0.0000 alpha:1.0]
	];
	[normalIndicator setToGroupOrImage:self.activityIndicator];

	TTWKActivityIndicator *smallerIndicator = [[TTWKActivityIndicator alloc]
		initWithColor:[UIColor colorWithRed:1.0000 green:0.8824 blue:0.1020 alpha:1.0]
		bubbleRadius:2
	];
	[smallerIndicator setToGroupOrImage:self.smallerActivityIndicator];

	//
	// Well, let's show the 'beta' style as well that was default before and that we still support
	//
	TTWKActivityIndicator *normalIndicatorBeta = [[TTWKActivityIndicator alloc]
		initWithStyle:TTWKActivityIndicatorStyleBeta
		color:[UIColor colorWithRed:0.7490 green:0.8510 blue:0.2824 alpha:1.0]
		bubbleRadius:0
	];
	[normalIndicatorBeta setToGroupOrImage:self.activityIndicatorBeta];

	TTWKActivityIndicator *smallerIndicatorBeta = [[TTWKActivityIndicator alloc]
		initWithStyle:TTWKActivityIndicatorStyleBeta
		color:[UIColor colorWithRed:0.1216 green:0.5412 blue:0.4392 alpha:1.0]
		bubbleRadius:2
	];
	[smallerIndicatorBeta setToGroupOrImage:self.smallerActivityIndicatorBeta];
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



