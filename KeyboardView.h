//
//  KeyboardView.h
//  keyboardviz
//
//  Created by Patrick on 11/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "KeyView.h"


@interface KeyboardView : NSView {
	NSMutableDictionary *keyMap;
}

- (KeyView *) lookupRenderer: (NSString*) idx;
- (void) makeKeys: (NSString *) chars x: (int) xCoord y: (int) yCoord;
- (KeyView*) makeKey:(NSString*) label x:(int)xCoord y:(int)yCoord width:(int)w;
@property (retain) NSMutableDictionary *keyMap;

@end
