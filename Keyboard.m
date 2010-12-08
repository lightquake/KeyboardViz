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
    __block NSUInteger lastFlags = 0;
    void (^flagTrigger)(NSEvent*) = ^ (NSEvent *event) {
        NSUInteger flags = [event modifierFlags];
        NSUInteger masked = flags & ~lastFlags;
        lastFlags = flags;
        if (masked & NSFunctionKeyMask) [kbView keyPressed:@"fn"];
        if (masked & NSControlKeyMask) [kbView keyPressed:@"control"];
        if (masked & NSAlphaShiftKeyMask) [kbView keyPressed:@"caps lock"];
        if (masked & NSShiftKeyMask) [kbView keyPressed:@"shift"];
        if (masked & NSAlternateKeyMask) [kbView keyPressed:@"option"];
        if (masked & NSCommandKeyMask) [kbView keyPressed:@"command"];
    };
    [NSEvent addGlobalMonitorForEventsMatchingMask:(NSFlagsChangedMask) handler:flagTrigger];
	[NSEvent addGlobalMonitorForEventsMatchingMask:(NSKeyDownMask) handler:^(NSEvent *event) {
		[self keyTrigger: event];
	}];

}

-(void)keyTrigger:(NSEvent*)event {
    if ([event isARepeat]) return;
    NSString *chars = [[event charactersIgnoringModifiers] lowercaseString];
	NSString *descriptor;
	if ([chars length] == 0) return; // dead key
	unichar c = [chars characterAtIndex: 0];

	switch (c) {
		case 127:
			descriptor = @"delete";
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
