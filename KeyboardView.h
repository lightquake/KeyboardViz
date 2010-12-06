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

- (void) keyPressed:(NSString *)keyName;
- (void) makeKeys: (NSString *) chars x: (int) xCoord y: (int) yCoord;
- (void) makeKey:(NSString*) label x:(int)xCoord y:(int)yCoord width:(int)w;

@end
