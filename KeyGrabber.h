//
//  KeyGrabber.h
//  keyboardviz
//
//  Created by Patrick on 11/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "KeyGrabberView.h"

@interface KeyGrabber : NSObject {
	IBOutlet KeyGrabberView* myView;
}

- (void) trigger: (NSEvent *) event;
@property (retain) KeyGrabberView* myView;
@end
