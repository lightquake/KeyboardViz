//
//  KeyRenderer.h
//  keyboardviz
//
//  Created by Patrick on 12/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface KeyRendererView : NSView	{
	float presses;
	NSTextView *textView;
}

- (void) setLabel: (NSString*) l;

- (void) resetPresses;
- (void) incPresses;
- (void) decay;
- (int) presses;
@end
