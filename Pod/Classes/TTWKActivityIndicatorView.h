//
// TTWKActivityIndicator
// Copyright (c) 2015, TouchTribe B.V. All rights reserved.
//
// This source code is available under the MIT license. See the LICENSE file for more info.
//

#import <UIKit/UIKit.h>

/**
 * AppleWatch-style activity indicator that can be used with regular iOS apps.
 * (See TTWKActivityIndicator.h on how to use it in WatchKit extensions.)
 *
 * Alternatively you can use regular UIImageView with an animated image received from one 
 * of the TTWKActivityIndicator's animatedImage* methods.
 */
IB_DESIGNABLE
@interface TTWKActivityIndicatorView : UIView

/** Color of the indicator's bubbles. (Note that we always assume alpha to be 1 here.) */
@property (nonatomic) IBInspectable UIColor *color;

/** Radius of a single bubble. (AppleWatch seems to be using 4.) */
@property (nonatomic) IBInspectable CGFloat bubbleRadius;

/** Starts the animation. (Note that the animation is turned on by default.) */
- (void)startAnimating;

/** Stops the animation, which causes the view to display nothing. */
- (void)stopAnimating;

@end
