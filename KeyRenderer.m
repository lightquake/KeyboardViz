//
//  KeyRenderer.m
//  keyboardviz
//
//  Created by Patrick on 12/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "KeyRenderer.h"


@implementation KeyRenderer

- (KeyRenderer*) initWithFrame:(NSRect)frameRect {
	self = [super initWithFrame: frameRect];
	textView = [[NSTextView alloc] initWithFrame: [self bounds]];
	[textView setString: @""];
	[textView setDrawsBackground: false];
	[textView alignCenter: textView];
	[textView setFont: [NSFont systemFontOfSize: 25.0]];
	[textView setTextColor: [NSColor whiteColor]];
	[textView setEditable: NO];
	[textView setSelectable: NO];
	[self addSubview: textView];
	return self;
}



- (void) setLabel: (NSString*) l {
	[textView setString: l];
	[textView sizeToFit];
	NSLayoutManager* layoutManager = [[textView textContainer] layoutManager];
	float boundHeight = [self bounds].size.height;
	float glyphHeight = [layoutManager usedRectForTextContainer: [textView textContainer]].size.height;
	NSSize inset = NSMakeSize(0, (boundHeight - glyphHeight) / 2);
	[textView setTextContainerInset: inset];
	[textView setNeedsDisplay: true];
}


- (void) resetPresses {
	presses = 0;
}

- (void) incPresses {
	presses++;
	[self setNeedsDisplay: YES];
}

- (void) decay {
	presses /= pow(2.0, 1/6000.0);
	[self setNeedsDisplay: YES];
}

- (int) presses {
	return presses;
}

- (void) drawRect:(NSRect)dirtyRect {
	NSColor *color = [NSColor colorWithCalibratedHue: .7-(presses * .002) saturation: 1 brightness: .2+(presses * .01) alpha: 1];
	[color set];
	NSRectFill([self bounds]);
}
@end
