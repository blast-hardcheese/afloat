//
//  AfloatScriptingSetKeptAfloatCommand.m
//  AfloatScripting
//
//  Created by ∞ on 30/12/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "AfloatScriptingSetKeptAfloatCommand.h"
#import "AfloatScriptingWire.h"
#import "AfloatScriptingAppDelegate.h"

@implementation AfloatScriptingSetKeptAfloatCommand

- (id) performDefaultImplementation {
	BOOL showsBadgeAnimation = AfloatBOOLFromObject([self evaluatedArguments][@"showsBadgeAnimation"], YES);
	BOOL keptAfloat = AfloatBOOLFromObject([self directParameter], NO);
	
	[[NSApp delegate] rearmDeathTimer];
	[[NSDistributedNotificationCenter defaultCenter] postNotificationName:kAfloatScriptSetKeptAfloatNotification object:kAfloatScriptWireObject userInfo:@{
		@"showsBadgeAnimation": @(showsBadgeAnimation),
		@"keptAfloat": @(keptAfloat)
	}];
	return nil;
}

@end
