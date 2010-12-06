//
//  Keyboard.m
//  keyboardviz
//
//  Created by Patrick on 11/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Keyboard.h"


@implementation Keyboard

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
    NSLog(@"%d", c);
	switch (c) {
		case 127:
			descriptor = @"del";
			break;
        case '\t':
            descriptor = @"tab";
            break;
        case '\r':
            descriptor = @"return";
            break;
		default:
			descriptor = chars;
			break;
	}
    
    [kbView keyPressed:descriptor];
}

@end
