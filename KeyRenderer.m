//
//  KeyRenderer.m
//  keyboardviz
//
//  Created by Patrick on 12/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "KeyRenderer.h"


@implementation KeyRenderer

+ (KeyRenderer*) initWithLabel:(NSString *)l {
	return [[KeyRenderer alloc] initWithLabel: l];
}
- (KeyRenderer*) initWithLabel:(NSString *)l {
	self = [super init];
	[self setLabel: l];
	
	return self;
}

-( void) setLabel: (NSString *) l {
	label = l;
}

- (void) resetPresses {
	presses = 0;
}

- (void) incPresses {
	presses++;
}

- (int) presses {
	return presses;
}
@end
