//
//  KeyGrabber.m
//  keyboardviz
//
//  Created by Patrick on 11/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "KeyGrabber.h"


@implementation KeyGrabber
- (IBAction) addLetter: sender
{
	NSLog(@"thing");
	[textView setString: @"mmm"];
}
- (id)initWithFrame: (NSRect) frame{
	self = [super initWithFrame:frame];
	[NSEvent addGlobalMonitorForEventsMatchingMask:(NSKeyDownMask | NSFlagsChangedMask) handler:^(NSEvent *event) {
		NSLog(@"modifiers%u", [event modifierFlags]);
		[textView insertText: [event characters]];
	}];
	return self;
}
- (void)keyDown:(NSEvent *)theEvent {
	
	[self interpretKeyEvents:[NSArray arrayWithObject:theEvent]];
}

// The following action methods are declared in NSResponder.h
- (void)insertTab:(id)sender {
    if ([[self window] firstResponder] == self) {
        [[self window] selectNextKeyView:self];
    }
}

- (void)insertBacktab:(id)sender {
    if ([[self window] firstResponder] == self) {
        [[self window] selectPreviousKeyView:self];
    }
}





@end
