//
//  KeyGrabberView.h
//  keyboardviz
//
//  Created by Patrick on 11/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "KeyRenderer.h"


@interface KeyGrabberView : NSView {
	NSMutableDictionary *keyMap;
}

- (KeyRenderer *) lookupRenderer: (NSString*) idx;
- (void) makeRenderers: (NSString *) chars x: (int) xCoord y: (int) yCoord;
- (void) makeRenderer:(NSString*) label x:(int) xCoord y:(int) yCoord width: (int) w;
@property (retain,getter=getMap) NSMutableDictionary *keyMap;
@end
