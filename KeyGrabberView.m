//
//  KeyGrabberView.m
//  keyboardviz
//
//  Created by Patrick on 11/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "KeyGrabberView.h"


@implementation KeyGrabberView
- (id)initWithFrame:(NSRect)frame {
	presses = 0;
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    return self;
}
- (void)drawRect:(NSRect) rect
{
	NSColor* color = [NSColor colorWithCalibratedHue: ((presses % 100) * 0.01)
										 saturation: 1
										 brightness: 0.9
											  alpha: 1];
	[color set];
	NSRectFill([self bounds]);
}

- (void)incPresses {
	presses++;
}

	
@end
