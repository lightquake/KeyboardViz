//
//  KeyGrabberView.m
//  keyboardviz
//
//  Created by Patrick on 11/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "KeyGrabberView.h"
#import "KeyRenderer.h"
#define NUM_KEYS 26

@implementation KeyGrabberView
- (id) initWithFrame:(NSRect)frameRect {
	self = [super initWithFrame: frameRect];
	keyMap = [[NSMutableDictionary alloc] init];
	for (int i = 'a'; i <= 'z'; i++) {
		KeyRenderer *renderer = [KeyRenderer initWithLabel: @"a"];
		[keyMap setObject:renderer forKey: [NSNumber numberWithInt: i]];
	}
	return self;
	
}
- (void)drawRect:(NSRect) rect
{
	// fill background
	[[NSColor grayColor] set];
	NSRectFill([self bounds]);
	int order[] = {113, 119};
	for (int i = 0; i < 2; i++) {
		KeyRenderer *renderer = [self lookupRenderer: order[i]];
		NSRect r = NSMakeRect(50 + i * 50, 50, 40, 40);
		int presses = [renderer presses];
		NSColor *color = [NSColor colorWithCalibratedHue: (presses * .02) saturation: 1 brightness: 1 alpha: 1];
		[color set];
		NSRectFill(r);
	}
	
}

- (KeyRenderer *) lookupRenderer: (int) idx {
	return [keyMap objectForKey:[NSNumber numberWithInt: idx]];
}
- (NSMutableDictionary *) getMap {
	return keyMap;
}
	
@end
