//
//  TTWKActivityIndicator example
//  Copyright (c) 2015 TouchTribe B.V. All rights reserved.
//

#import "InterfaceController.h"

#import "TTWKActivityIndicator.h"

@interface InterfaceController()
@property (weak, nonatomic) IBOutlet WKInterfaceImage *activityIndicator;
@property (weak, nonatomic) IBOutlet WKInterfaceImage *smallerActivityIndicator;
@end

@implementation InterfaceController

- (void)awakeWithContext:(id)context {

    [super awakeWithContext:context];

	[self.activityIndicator setActivityIndicatorImageWithColor:[UIColor colorWithRed:0.9922 green:0.4549 blue:0.0000 alpha:1.0]];

	[self.smallerActivityIndicator setActivityIndicatorImageWithColor:[UIColor colorWithRed:1.0000 green:0.8824 blue:0.1020 alpha:1.0] bubbleRadius:2];
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



