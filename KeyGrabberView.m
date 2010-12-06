//
//  KeyGrabberView.m
//  keyboardviz
//
//  Created by Patrick on 11/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "KeyGrabberView.h"
#import "KeyRendererView.h"
#define PADDED_KEY_SIZE 55.0
#define KEY_SIZE 50

@implementation KeyGrabberView
- (id) initWithFrame:(NSRect)frameRect {
	self = [super initWithFrame: frameRect];
	keyMap = [[NSMutableDictionary alloc] init];

	// construct the key renderers
	
	// numbers and delete
	NSString *numbers = @"`1234567890-=";
	[self makeRenderers:numbers x:0 y:0];
	NSLog(@"%f", 1.6*PADDED_KEY_SIZE);
	[self makeRenderer:@"del" x:13 * PADDED_KEY_SIZE y:0 width:1.5*PADDED_KEY_SIZE + 1];
	
	NSString *topRow = @"qwertyuiop[]\\";
	[self makeRenderers:topRow x:1.6 * PADDED_KEY_SIZE y:PADDED_KEY_SIZE];
	NSString *middleRow = @"asdfghjkl;'";
	[self makeRenderers:middleRow x:1.9*PADDED_KEY_SIZE y:2*PADDED_KEY_SIZE];
	NSString *bottomRow = @"zxcvbnm,./";
	[self makeRenderers:bottomRow x:2.5*PADDED_KEY_SIZE y:3*PADDED_KEY_SIZE];
	
	// I want to handle $ as the same as 4, and there's no function as far as I know that 'de-shifts'
	NSString *upperSymbols = @"~!@#$%^&*()_+{}|:\"<>?";
	NSString *lowerSymbols = @"`1234567890-=[]\\;',./";
	for (int i = 0; i < [upperSymbols length]; i++) {
		NSRange range = NSMakeRange(i, 1);
		NSString *upper = [upperSymbols substringWithRange: range];
		NSString *lower = [lowerSymbols substringWithRange: range];
		[keyMap setObject: [keyMap objectForKey: lower] forKey: upper];
	}
	
	// start off the decay update timer
	[NSTimer scheduledTimerWithTimeInterval:1.0
									 target:self
								   selector:@selector(decay:)
								   userInfo:nil
									repeats:YES];
	return self;
	
}

- (void) makeRenderers: (NSString *) chars x: (int) xCoord y: (int) yCoord {
	for (int i = 0; i < [chars length]; i++) {
		NSString *label = [chars substringWithRange: NSMakeRange(i, 1)];
		NSRect r = NSMakeRect(xCoord + i * PADDED_KEY_SIZE, yCoord, KEY_SIZE, KEY_SIZE);
		KeyRendererView *renderer = [[KeyRendererView alloc] initWithFrame: r];
		[renderer setLabel: [label uppercaseString]];
		[self addSubview: renderer];
		[keyMap setObject: renderer forKey: label];
	}
}

- (void) makeRenderer:(NSString *)label x:(int)xCoord y:(int)yCoord width:(int)width {
	NSRect r = NSMakeRect(xCoord, yCoord, width, KEY_SIZE);
	KeyRendererView *renderer = [[KeyRendererView alloc] initWithFrame: r];
	[renderer setLabel: label];
	[self addSubview: renderer];
	[keyMap setObject: renderer forKey: label];
}


- (KeyRendererView *) lookupRenderer: (NSString*) idx {
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

	
@synthesize keyMap;
@end
