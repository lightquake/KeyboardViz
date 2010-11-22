//
//  KeyGrabber.m
//  keyboardviz
//
//  Created by Patrick on 11/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "KeyGrabber.h"


@implementation KeyGrabber
- (id)initWithFrame: (NSRect) frame{
	self = [super initWithFrame:frame];
	[NSEvent addGlobalMonitorForEventsMatchingMask:(NSKeyDownMask | NSFlagsChangedMask) handler:^(NSEvent *event) {
		NSLog(@"modifiers%u", [event modifierFlags]);
		NSLog(@"foo%d", [myView tag]);
		[myView incPresses];
	}];
	return self;
}





@end
