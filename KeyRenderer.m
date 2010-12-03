//
//  KeyRenderer.m
//  keyboardviz
//
//  Created by Patrick on 12/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "KeyRenderer.h"


@implementation KeyRenderer


- (KeyRenderer*) initWithLabel: (NSString*) l {
	self = [super init];
	label = l;
	return self;
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
	NSColor *color = [NSColor colorWithCalibratedHue: (presses * .02) saturation: 1 brightness: 1 alpha: 1];
	[color set];
	NSRectFill([self bounds]);
}
@end
