//
//  KeyView.m
//  keyboardviz
//
//  Created by Patrick on 12/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "KeyView.h"


@implementation KeyView

@synthesize presses;

- (KeyView*) initWithFrame:(NSRect)frameRect {
	self = [super initWithFrame: frameRect];
	textView = [[NSTextView alloc] initWithFrame: [self bounds]];
	[textView setString: @""];
	[textView setDrawsBackground: false];
	[textView alignCenter: textView];
	[textView setFont: [NSFont systemFontOfSize: 20.0]];
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

- (void) drawRect:(NSRect)dirtyRect {
	NSColor *color = [NSColor colorWithCalibratedHue: .7-presses * .008 saturation: 1 brightness: .2+(presses * .01) alpha: 1];
	[color set];
	NSRectFill([self bounds]);
	[[NSColor blackColor] set];
	NSFrameRectWithWidth([self bounds], 1);
}

- (void) decay {
	presses /= pow(2.0, 1/600.0);
	[self setNeedsDisplay: YES];
}

@end
