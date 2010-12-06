//
//  Keyboard.h
//  keyboardviz
//
//  Created by Patrick on 11/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "KeyboardView.h"

@interface Keyboard : NSObject {
	IBOutlet KeyboardView* myView;
}

- (void) trigger: (NSEvent *) event;
@property (retain) KeyboardView* myView;
@end
