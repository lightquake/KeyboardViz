//
//  KeyGrabberView.h
//  keyboardviz
//
//  Created by Patrick on 11/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface KeyGrabberView : NSView {
	int presses;
}
- (void) incPresses;
@end
