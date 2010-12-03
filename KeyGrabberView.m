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
	
	float hspace = 10.0;
	float vspace = 10.0;
	float key_size = 50.0;
	
	NSString *topRow = @"qwertyuiop[]\\";
	for (int i = 0; i < [topRow length]; i++) {
		NSString *label = [topRow substringWithRange: NSMakeRange(i, 1)];
		[self makeRenderer:label x:2 * hspace + (key_size + hspace) * i y: 2 * vspace];
	}
	
	NSString *middleRow = @"asdfghjkl;'";
	for (int i = 0; i < [middleRow length]; i++) {
		NSString *label = [middleRow substringWithRange: NSMakeRange(i, 1)];
		[self makeRenderer:label x:3 * hspace + (key_size + hspace) * i y: 3 * vspace + key_size];

	}
	
	NSString *bottomRow = @"zxcvbnm,./";
	for (int i = 0; i < [bottomRow length]; i++) {
		NSString *label = [bottomRow substringWithRange: NSMakeRange(i, 1)];
		[self makeRenderer:label x:6 * hspace + (key_size + hspace) * i y: 4 * vspace + 2 * key_size];
	}
	return self;
	
}

- (void) makeRenderer: (NSString *) label x: (int) xCoord y: (int) yCoord {
	NSRect r = NSMakeRect(xCoord, yCoord, 50, 50);
	KeyRenderer *renderer = [[KeyRenderer alloc] init];
	[renderer initWithFrame: r];
	[renderer setLabel: [label uppercaseString]];
	[self addSubview: renderer];
	[keyMap setObject: renderer forKey: label];
}


- (KeyRenderer *) lookupRenderer: (NSString*) idx {
	return [keyMap objectForKey:idx];
}
- (NSMutableDictionary *) getMap {
	return keyMap;
}

- (BOOL) isFlipped {
	return YES;
}

	
@end
