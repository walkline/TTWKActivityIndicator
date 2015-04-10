//
//  TTWKActivityIndicator example
//  Copyright (c) 2015 TouchTribe B.V. All rights reserved.
//

#import "ViewController.h"

#import <TTWKActivityIndicator/TTWKActivityIndicator.h>
#import <TTWKActivityIndicator/TTWKActivityIndicatorView.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet TTWKActivityIndicatorView *activityIndicatorView;

@end

@implementation ViewController

- (void)viewDidLoad {

	[super viewDidLoad];

	// This is for comparison with a prerendered 30fps animation (similar to what would be used with WatchKit)
	TTWKActivityIndicator *indicator = [[TTWKActivityIndicator alloc] initWithColor:self.activityIndicatorView.color bubbleRadius:self.activityIndicatorView.bubbleRadius];
	self.imageView.image = [indicator animatedImage];
}

- (IBAction)restartAnimation:(id)sender {
	[self.activityIndicatorView stopAnimating];
	[self.activityIndicatorView startAnimating];
}

@end
