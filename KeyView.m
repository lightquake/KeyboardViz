//
//  KeyView.m
//  keyboardviz
//
//  Created by Patrick on 12/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "KeyView.h"
#import "KeyAnimation.h"


@implementation KeyView

@synthesize presses;
@synthesize whiteout;

- (KeyView*) initWithFrame:(NSRect)frameRect {
    if ((self = [super initWithFrame: frameRect])) {
        anim = [[KeyAnimation alloc] initWithView:self];
        [anim setAnimationBlockingMode:NSAnimationNonblocking];
        [self setStringValue: @""];
        [self setDrawsBackground:YES];
        [self setAlignment: NSCenterTextAlignment];
        [self setFont: [NSFont systemFontOfSize: 18]];
        [self setTextColor: [NSColor whiteColor]];
        [self setEditable: NO];
        [self setSelectable: NO];
        [self setBordered:YES];
	}
	return self;
}

- (void)computeAndSetBackgroundColor {
    [self setBackgroundColor:[NSColor colorWithCalibratedHue: .7-presses * .004 saturation: 1-whiteout brightness: whiteout+.2+(presses * .004) alpha:1]];
}

-(void)keypress {
    presses++;
    [anim setCurrentProgress:0.0];
    [anim startAnimation];
}

- (void) decay {
    if (presses == 0.0) return;
    presses /= pow(2.0, 1/1200.0);
    [self computeAndSetBackgroundColor];
}

@end
