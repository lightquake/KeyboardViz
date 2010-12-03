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
	[self addSubview: textView];
	return self;
}



- (void) setLabel: (NSString*) l {
	[textView setString: l];
	[textView setNeedsDisplay: true];
}


- (void) resetPresses {
	presses = 0;
}

- (void) incPresses {
	presses++;
	[self setNeedsDisplay: true];
}

- (int) presses {
	return presses;
}

- (void) drawRect:(NSRect)dirtyRect {
	NSColor *color = [NSColor colorWithCalibratedHue: .7-(presses * .02) saturation: 1 brightness: .2+(presses * .1) alpha: 1];
	[color set];
	NSRectFill([self bounds]);
}
@end
