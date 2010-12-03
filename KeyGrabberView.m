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
	NSLog(@"%@", frameRect);
	keyMap = [[NSMutableDictionary alloc] init];
	NSString *topRow = @"qwertyuiop";
	for (int i = 0; i < 10; i++) {
		NSString *label = [topRow substringWithRange: NSMakeRange(i, 1)];
		KeyRenderer *renderer = [[KeyRenderer alloc] initWithLabel: label];
		NSRect r = NSMakeRect(20 + 60 * i, 20, 50, 50);
		[renderer initWithFrame: r];
		[self addSubview: renderer];
		char c = [topRow characterAtIndex: i];
		[keyMap setObject:renderer forKey: [NSNumber numberWithChar: c]];
	}
	return self;
	
}
- (void)drawRect:(NSRect) rect
{
	// fill background
	[[NSColor grayColor] set];
	NSRectFill([self bounds]);
	
}

- (KeyRenderer *) lookupRenderer: (int) idx {
	return [keyMap objectForKey:[NSNumber numberWithInt: idx]];
}
- (NSMutableDictionary *) getMap {
	return keyMap;
}

- (BOOL) isFlipped {
	return YES;
}
	
@end
