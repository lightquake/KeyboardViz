//
//  KeyView.h
//  keyboardviz
//
//  Created by Patrick on 12/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class KeyAnimation;

@interface KeyView : NSTextField	{
	float presses;
    float whiteout;
    KeyAnimation *anim;
}
- (void) keypress;
- (void) decay;

@property (readwrite,assign) float presses;
@property (readwrite,assign) float whiteout;

- (void)computeAndSetBackgroundColor;

@end
