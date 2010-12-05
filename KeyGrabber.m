//
//  KeyGrabber.m
//  keyboardviz
//
//  Created by Patrick on 11/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "KeyGrabber.h"


@implementation KeyGrabber

- (id)initWithFrame: (NSRect) frame {
	self = [super initWithFrame: frame];
	[NSEvent addGlobalMonitorForEventsMatchingMask:(NSKeyDownMask) handler:^(NSEvent *event) {
		[self trigger: event];
	}];
	return self;
}



- (void) trigger: (NSEvent *) event {
	NSString *chars = @"";
	if ([event type] == NSKeyDown) {
		chars = [event charactersIgnoringModifiers];
	}
	KeyRenderer *renderer = [myView lookupRenderer: [chars lowercaseString]];
	[renderer incPresses];
}


@end
