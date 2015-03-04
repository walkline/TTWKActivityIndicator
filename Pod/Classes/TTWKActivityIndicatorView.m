//
// TTWKActivityIndicator
// Copyright (c) 2015, TouchTribe B.V. All rights reserved.
//
// This source code is available under the MIT license. See the LICENSE file for more info.
//

#import "TTWKActivityIndicatorView.h"

#import "TTWKActivityIndicator.h"

@implementation TTWKActivityIndicatorView {

	CADisplayLink *_displayLink;

	// Real time animation has started
	NSTimeInterval _startTime;

	// Thing that is doing actual drawing
	TTWKActivityIndicator *_renderer;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		[self _commonInit];
	}
	return self;
}

- (id)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		[self _commonInit];
	}
	return self;
}

- (void)_commonInit {

	self.backgroundColor = [UIColor clearColor];
	self.contentMode = UIViewContentModeRedraw;

	_color = [UIColor lightGrayColor];
	_bubbleRadius = 4;

	[self rebuildRenderer];

	[self startAnimating];
}

- (void)rebuildRenderer {
	_renderer = [[TTWKActivityIndicator alloc] initWithColor:_color bubbleRadius:_bubbleRadius];
	[self setNeedsDisplay];
}

- (void)startAnimating {
	#if !TARGET_INTERFACE_BUILDER
	if (!_displayLink) {
		_displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(displayLinkUpdate)];
		[_displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];

		_startTime = [NSDate timeIntervalSinceReferenceDate];
	}
	#endif
}

- (void)stopAnimating {
	if (_displayLink) {
		[_displayLink removeFromRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
		_displayLink = nil;
	}
}

- (void)dealloc {
	[self stopAnimating];
}

- (void)displayLinkUpdate {
	[self setNeedsDisplay];
}

- (CGSize)sizeThatFits:(CGSize)size {
	return [_renderer size];
}

- (void)drawRect:(CGRect)rect {

	#if !TARGET_INTERFACE_BUILDER
	if (!_displayLink)
		return;
	#endif

	NSTimeInterval time = [NSDate timeIntervalSinceReferenceDate] - _startTime;

	#if TARGET_INTERFACE_BUILDER
	time = [self loopStartTime];
	#endif

	// This is to test how well the looped part of the animation is calculated:
	// truncating time into the looped part should still give proper animation
	/*!
	NSTimeInterval loopDuration = [_renderer loopDuration];
	time = [_renderer loopStartTime] + time - floor(time / loopDuration) * loopDuration;
	*/

	CGRect b = self.bounds;
	CGContextRef c = UIGraphicsGetCurrentContext();
	CGContextTranslateCTM(
		c,
		(b.size.width - [_renderer size].width) * .5,
		(b.size.height - [_renderer size].height) * .5
	);
	[_renderer drawForTime:time];
}

@end
