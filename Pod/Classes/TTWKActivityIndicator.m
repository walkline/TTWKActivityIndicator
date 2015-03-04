//
// TTWKActivityIndicator
// Copyright (c) 2015, TouchTribe B.V. All rights reserved.
//
// This source code is available under the MIT license. See the LICENSE file for more info.
//

#import "TTWKActivityIndicator.h"

#import <UIKit/UIKit.h>
#import <WatchKit/WatchKit.h>

//
//
//
@implementation WKInterfaceImage (TTWKActivityIndicator)

- (void)setActivityIndicatorImageWithColor:(UIColor *)color {
	[self setActivityIndicatorImageWithColor:color bubbleRadius:0];
}

- (void)setActivityIndicatorImageWithColor:(UIColor *)color bubbleRadius:(CGFloat)bubbleRadius
{
	NSString *cacheKey = [TTWKActivityIndicator cacheKeyForColor:color bubbleRadius:bubbleRadius];

	if ([[WKInterfaceDevice currentDevice].cachedImages objectForKey:cacheKey]) {

		// The image is in the cache already, let's just use it
		[self setImageNamed:cacheKey];

	} else {

		// Not cached yet, let's build the image, cache and upload

		TTWKActivityIndicator *indicator = [[TTWKActivityIndicator alloc]
			initWithColor:color
			bubbleRadius:bubbleRadius
		];

		UIImage *image = [indicator animatedImage];

		if ([[WKInterfaceDevice currentDevice] addCachedImage:image name:cacheKey]) {
			// Was able to add it into the cache, let's use it
			[self setImageNamed:cacheKey];
		} else {
			// Could not add it into the cache, perhaps it's full, let's upload directly
			[self setImage:image];
		}
	}

	// We also need to ensure here that the animation has started, so no extra lines are required by the user
	[self startAnimating];
}

@end

@implementation TTWKActivityIndicator {

	// Radius of a single bubble
	CGFloat _bubbleRadius;

	// Color of the bubbles
	UIColor *_color;

	// Speed of rotation of the bubbles, full revolutions per second
	CGFloat _rotationSpeed;

	// Time it takes for a single bubble to completely light up
	CGFloat _risingTime;

	// How much rising of a single bubble is delayed depending on its index
	CGFloat _risingDelay;
}

+ (NSString *)cacheKeyForColor:(UIColor *)color bubbleRadius:(CGFloat)bubbleRadius {

	NSMutableString *key = [[NSMutableString alloc] init];
	[key appendFormat:@"%@-%.1f", self, bubbleRadius];

	const CGFloat *c = CGColorGetComponents(color.CGColor);
	for (NSInteger i = 0; i < CGColorGetNumberOfComponents(color.CGColor); i++) {
		[key appendFormat:@"-%.2f", c[i]];
	}

	return key;
}

+ (UIImage *)animatedImageWithColor:(UIColor *)color bubbleRadius:(CGFloat)bubbleRadius {
	TTWKActivityIndicator *a = [[self alloc] initWithColor:color bubbleRadius:bubbleRadius];
	return [a animatedImage];
}

+ (UIImage *)animatedImageWithColor:(UIColor *)color {
	return [self animatedImageWithColor:color bubbleRadius:0];
}

- (id)initWithColor:(UIColor *)color bubbleRadius:(CGFloat)bubbleRadius {

	if (self = [super init]) {

		_bubbleRadius = bubbleRadius > 0 ? bubbleRadius : 4;

		_color = color;

		_rotationSpeed = 2.0 / 3;

		_risingTime = (1.0 / 6) / _rotationSpeed;

		_risingDelay = 1.0 / 30;
	}

	return self;
}

- (CGSize)size {
	CGFloat radius = 3 * 2 * (_bubbleRadius + 1);
	return CGSizeMake(radius, radius);
}

- (NSTimeInterval)loopStartTime {
	// Let's start it from the second revolution to ensure no fading in animation is captured
	return 2 / _rotationSpeed;
}

- (NSTimeInterval)loopDuration {
	// In theory we can just divide it by 6 — the image is symmetrical, but in practice
	// it's better to have the full cycle, it's just smoother
	return 1 / _rotationSpeed;
}

- (void)drawForTime:(NSTimeInterval)time {

	CGSize size = [self size];
	CGRect b = CGRectMake(0, 0, size.width, size.height);
	CGPoint center = CGPointMake(b.origin.x + b.size.width * 0.5, b.origin.y + b.size.height * 0.5);

	CGContextRef c = UIGraphicsGetCurrentContext();

	for (NSInteger i = 0; i < 6; i++) {

		// How big and light the current bubble is
		CGFloat brightness = MAX(0, MIN((time - _risingDelay * i) / _risingTime, 1));

		// Current angle of the bubble
		CGFloat angle = time * _rotationSpeed * 2 * M_PI + i * 2 * M_PI / 6 - M_PI / 2;

		// Current radius of the bubble (sqrt ensures the square of the bubble grows linearly)
		CGFloat r = _bubbleRadius * sqrt(brightness);

		// Distance to the bubble's center from our center, +1 allows some distance between bubbles, so they don't stick
		CGFloat distanceToBubbleCenter = 2 * r + 1;
		CGPoint bubbleCenter = CGPointMake(
			center.x + distanceToBubbleCenter * cos(angle),
			center.y + distanceToBubbleCenter * sin(angle)
		);

		// OK, let's draw the bubble
		[_color setFill];
		CGContextSetAlpha(c, brightness);
		CGContextFillEllipseInRect(c, CGRectMake(bubbleCenter.x - r, bubbleCenter.y - r, 2 * r, 2 * r));
	}
}

- (UIImage *)animatedImage {

	// 30 frames per second seems practical enough, it does not seem to be 60 on AppleWatch either
	CGFloat framesPerSecond = 30;

	NSInteger totalFrames = roundf([self loopDuration] * framesPerSecond);

	NSMutableArray *images = [[NSMutableArray alloc] init];
	for (NSInteger frame = 0; frame < totalFrames; frame++) {

		NSTimeInterval time = [self loopStartTime] + frame * [self loopDuration] / totalFrames;

		UIGraphicsBeginImageContextWithOptions([self size], NO, 2);

		[self drawForTime:time];

		UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
		UIGraphicsEndImageContext();

		[images addObject:image];
	}

	return [UIImage animatedImageWithImages:images duration:[self loopDuration]];
}

@end
