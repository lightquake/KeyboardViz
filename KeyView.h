//
//  KeyView.h
//  keyboardviz
//
//  Created by Patrick on 12/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface KeyView : NSView	{
	float presses;
	NSTextView *textView;
}

- (void) setLabel: (NSString*) l;
- (void) decay;
@property (readwrite,assign) float presses;

@end