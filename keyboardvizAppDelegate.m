//
//  keyboardvizAppDelegate.m
//  keyboardviz
//
//  Created by Patrick on 11/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "keyboardvizAppDelegate.h"

@implementation keyboardvizAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    [window setBackgroundColor:[NSColor colorWithDeviceWhite:1.0 alpha:0.0]];
    [window setOpaque:NO];
    [window setHasShadow:NO];
}

-(BOOL) applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication
{
    return YES;
}
@end
