//
//  KeyAnimation.m
//  keyboardviz
//
//  Created by Patrick on 12/7/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "KeyAnimation.h"
#import "KeyView.h"


@implementation KeyAnimation

-(KeyAnimation*)initWithView:(KeyView*)view {
    if (view.whiteout != 0) return nil;
    if ((self = [super initWithDuration:0.5 animationCurve:NSAnimationEaseIn])) {
        myView = view; 
    }
    return self;
}

-(void)setCurrentProgress:(NSAnimationProgress)progress {
    [super setCurrentProgress:progress];
    myView.whiteout = 1-progress;
    [myView setNeedsDisplay:YES];
}
    
    

@end
