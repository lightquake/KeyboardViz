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
	
	float hspace = 5.0;
	float vspace = 5.0;
	float key_size = 25.0;
	
	NSString *topRow = @"qwertyuiop[]\\";
	for (int i = 0; i < [topRow length]; i++) {
		NSString *label = [topRow substringWithRange: NSMakeRange(i, 1)];
		KeyRenderer *renderer = [[KeyRenderer alloc] initWithLabel: label];
		NSRect r = NSMakeRect(1 * hspace + (key_size + hspace) * i, 2 * vspace, key_size, key_size);
		[renderer initWithFrame: r];
		[self addSubview: renderer];
		char c = [topRow characterAtIndex: i];
		[keyMap setObject:renderer forKey: [NSNumber numberWithChar: c]];
	}
	
	NSString *middleRow = @"asdfghjkl;'";
	for (int i = 0; i < [middleRow length]; i++) {
		NSString *label = [middleRow substringWithRange: NSMakeRange(i, 1)];
		KeyRenderer *renderer = [[KeyRenderer alloc] initWithLabel: label];
		NSRect r = NSMakeRect(2 * hspace + (key_size + hspace) * i, 3 * vspace + key_size, key_size, key_size);
		[renderer initWithFrame: r];
		[self addSubview: renderer];
		char c = [middleRow characterAtIndex: i];
		[keyMap setObject:renderer forKey: [NSNumber numberWithChar: c]];
	}
	
	NSString *bottomRow = @"zxcvbnm,./";
	for (int i = 0; i < [bottomRow length]; i++) {
		NSString *label = [bottomRow substringWithRange: NSMakeRange(i, 1)];
		KeyRenderer *renderer = [[KeyRenderer alloc] initWithLabel: label];
		NSRect r = NSMakeRect(5 * hspace + (key_size + hspace) * i, 4 * vspace + 2 * key_size, key_size, key_size);
		[renderer initWithFrame: r];
		[self addSubview: renderer];
		char c = [bottomRow characterAtIndex: i];
		[keyMap setObject:renderer forKey: [NSNumber numberWithChar: c]];
	}
	return self;
	
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
