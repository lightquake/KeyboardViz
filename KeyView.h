//
//  KeyView.h
//  keyboardviz
//
//  Created by Patrick on 12/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class KeyAnimation;

@interface KeyView : NSView	{
	float presses;
    float whiteout;
    KeyAnimation *anim;
	NSTextView *textView;
}
- (void) setTextSize:(float)size;
- (void) setLabel:(NSString*)l;
- (void) keypress;
- (void) decay;

@property (readwrite,assign) float presses;
@property (readwrite,assign) float whiteout;

@end
