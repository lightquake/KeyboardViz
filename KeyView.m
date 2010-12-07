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
	self = [super initWithFrame: frameRect];
    anim = [[KeyAnimation alloc] initWithView:self];
    [anim setAnimationBlockingMode:NSAnimationNonblocking];
	textView = [[NSTextView alloc] initWithFrame: [self bounds]];
	[textView setString: @""];
	[textView setDrawsBackground: false];
	[textView alignCenter: textView];
	[textView setFont: [NSFont systemFontOfSize: 18]];
	[textView setTextColor: [NSColor whiteColor]];
	[textView setEditable: NO];
	[textView setSelectable: NO];
	[self addSubview: textView];
	return self;
}

-(void)setTextSize:(float)size {
    [textView setFont: [NSFont systemFontOfSize: size]];
}

- (void) setLabel: (NSString*) l {
	[textView setString: l];
	[textView sizeToFit];
	NSLayoutManager* layoutManager = [[textView textContainer] layoutManager];
	float boundHeight = [self bounds].size.height;
	float glyphHeight = [layoutManager usedRectForTextContainer: [textView textContainer]].size.height;
	NSSize inset = NSMakeSize(0, (boundHeight - glyphHeight) / 2);
	[textView setTextContainerInset: inset];
	[textView setNeedsDisplay: true];
}

-(void)drawRect:(NSRect)dirtyRect {
	NSColor *color = [NSColor colorWithCalibratedHue: .7-presses * .004 saturation: 1 brightness: .2+(presses * .004) alpha:1-whiteout];
	[color set];
	NSRectFill([self bounds]);
	[[NSColor blackColor] set];
	NSFrameRectWithWidth(self.bounds, 1);
}

-(void)keypress {
    presses++;
    [anim setCurrentProgress:0.0];
    [anim startAnimation];
    [self setNeedsDisplay:YES];
}

- (void) decay {
	presses /= pow(2.0, 1/1200.0);
	[self setNeedsDisplay: YES];
}

@end
