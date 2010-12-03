//
//  KeyRenderer.h
//  keyboardviz
//
//  Created by Patrick on 12/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface KeyRenderer : NSObject {
	int presses;
	NSString *label;
}

+ (KeyRenderer*) initWithLabel: (NSString*) l;

- (void) setLabel: (NSString*) l;

- (void) resetPresses;
- (void) incPresses;
- (int) presses;
@end
