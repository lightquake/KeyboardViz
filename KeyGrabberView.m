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
	
	NSString *numbers = @"`1234567890-=";
	[self makeRenderers:numbers x:hspace y:vspace];
	NSString *topRow = @"qwertyuiop[]\\";
	[self makeRenderers:topRow x:6*hspace + key_size y:2*vspace + key_size];
	NSString *middleRow = @"asdfghjkl;'";
	[self makeRenderers:middleRow x:7*hspace + key_size y:3*vspace + 2*key_size];
	NSString *bottomRow = @"zxcvbnm,./";
	[self makeRenderers:bottomRow x:10*hspace + key_size y:4*vspace + 3*key_size];

	
	// I want to handle $ as the same as 4, and there's no function as far as I know that de-shifts
	NSString *upperSymbols = @"~!@#$%^&*()_+{}|:\"<>?";
	NSString *lowerSymbols = @"`1234567890-=[]\\;',./";
	for (int i = 0; i < [upperSymbols length]; i++) {
		NSRange range = NSMakeRange(i, 1);
		NSString *upper = [upperSymbols substringWithRange: range];
		NSString *lower = [lowerSymbols substringWithRange: range];
		[keyMap setObject: [keyMap objectForKey: lower] forKey: upper];
	}
	[NSTimer scheduledTimerWithTimeInterval:0.1
									 target:self
								   selector:@selector(decay:)
								   userInfo:nil
									repeats:YES];
	return self;
	
}

- (void) makeRenderers: (NSString *) chars x: (int) xCoord y: (int) yCoord {
	for (int i = 0; i < [chars length]; i++) {
		NSString *label = [chars substringWithRange: NSMakeRange(i, 1)];
		NSRect r = NSMakeRect(xCoord + i * 60, yCoord, 50, 50);
		KeyRenderer *renderer = [[KeyRenderer alloc] init];
		[renderer initWithFrame: r];
		[renderer setLabel: [label uppercaseString]];
		[self addSubview: renderer];
		[keyMap setObject: renderer forKey: label];
	}
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

- (void) decay:(NSTimer*)timer {
	NSArray *renderers = [keyMap allValues];
	[renderers makeObjectsPerformSelector:@selector(decay)];
}

	
@end
