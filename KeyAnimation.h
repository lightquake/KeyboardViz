//
//  KeyAnimation.h
//  keyboardviz
//
//  Created by Patrick on 12/7/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "KeyView.h"


@interface KeyAnimation : NSAnimation {
    KeyView* myView;
}

-(KeyAnimation*)initWithView:(KeyView*)view;

@end
