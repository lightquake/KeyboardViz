//
//  KeyGrabber.h
//  keyboardviz
//
//  Created by Patrick on 11/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface KeyGrabber : NSTextView {
	IBOutlet id textView;
}
- (IBAction) addLetter: sender;
@end
