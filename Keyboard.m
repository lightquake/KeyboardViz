//
//  Keyboard.m
//  keyboardviz
//
//  Created by Patrick on 11/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Keyboard.h"


@implementation Keyboard

@synthesize view;

- (void)awakeFromNib {
	[NSEvent addGlobalMonitorForEventsMatchingMask:(NSKeyDownMask) handler:^(NSEvent *event) {
		[self trigger: event];
	}];
}

- (void) trigger: (NSEvent *) event {
    if ([event isARepeat]) return;
    NSString *chars = [[event charactersIgnoringModifiers] lowercaseString];
	NSString *descriptor;
	if ([chars length] == 0) return; // dead key
	unichar c = [chars characterAtIndex: 0];
	switch (c) {
		case 127:
			descriptor = @"del";
			break;
		default:
			descriptor = chars;
			break;
	}
	KeyView *renderer = [view lookupRenderer: descriptor];
    renderer.presses++;
}

@end
