//
//  TTWKActivityIndicator example
//  Copyright (c) 2015 TouchTribe B.V. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <FBSnapshotTestCase/FBSnapshotTestCase.h>
#import <TTWKActivityIndicator/TTWKActivityIndicator.h>

@interface ActivityIndicatorTests : FBSnapshotTestCase
@end

@implementation ActivityIndicatorTests

- (void)setUp {

    [super setUp];

	self.recordMode = NO;
}

- (void)tearDown {
    [super tearDown];
}

- (UIView *)testViewForImage:(UIImage *)image {
	UIImageView *v = [[UIImageView alloc] initWithImage:image];
	v.contentMode = UIViewContentModeCenter;
	[v sizeToFit];
	return v;
}

- (void)checkImage:(UIImage *)image prefix:(NSString *)prefix {
	NSError *error = nil;
	BOOL ok = [self
		compareSnapshotOfView:[self testViewForImage:image]
		referenceImagesDirectory:[NSString stringWithFormat:@"%s", FB_REFERENCE_IMAGE_DIR]
		identifier:prefix
		error:&error
	];
	XCTAssertTrue(ok, @"Snapshot comparison failed: %@", error); \
}

- (void)checkIndicator:(TTWKActivityIndicator *)indicator prefix:(NSString *)prefix {

	NSArray *images = [[indicator animatedImage] images];

	[self checkImage:[images firstObject] prefix:[NSString stringWithFormat:@"%@-first", prefix]];
	[self checkImage:[images objectAtIndex:images.count / 4] prefix:[NSString stringWithFormat:@"%@-middle", prefix]];
	[self checkImage:[images lastObject] prefix:[NSString stringWithFormat:@"%@-last", prefix]];
}

- (void)testModernDefault {
	TTWKActivityIndicator *indicator = [[TTWKActivityIndicator alloc] initWithColor:[UIColor colorWithRed:0.1216 green:0.5412 blue:0.4392 alpha:1.0]];
	[self checkIndicator:indicator prefix:@"modern-default"];
}

- (void)testModernSmall {
	TTWKActivityIndicator *indicator = [[TTWKActivityIndicator alloc] initWithColor:[UIColor colorWithRed:0.7490 green:0.8510 blue:0.2824 alpha:1.0]];
	[self checkIndicator:indicator prefix:@"modern-small"];
}

- (void)testBetaDefault {
	TTWKActivityIndicator *indicator = [[TTWKActivityIndicator alloc]
		initWithStyle:TTWKActivityIndicatorStyleBeta
		color:[UIColor colorWithRed:0.9922 green:0.4549 blue:0.0000 alpha:1.0]
		bubbleRadius:0
	];
	[self checkIndicator:indicator prefix:@"beta-default"];
}

- (void)testBetaSmall {
	TTWKActivityIndicator *indicator = [[TTWKActivityIndicator alloc]
		initWithStyle:TTWKActivityIndicatorStyleBeta
		color:[UIColor colorWithRed:1.0000 green:0.8824 blue:0.1020 alpha:1.0]
		bubbleRadius:4
	];
	[self checkIndicator:indicator prefix:@"beta-small"];
}

@end
