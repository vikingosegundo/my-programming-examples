//
//  M18CoffeeAppDelegate.m
//  M18Coffee
//
//  Created by Manuel on 19.01.10.
//  Copyright apparatschik 2010. All rights reserved.
//

#import "M18CoffeeAppDelegate.h"
#import "RootViewController.h"


@implementation M18CoffeeAppDelegate

@synthesize window;
@synthesize navigationController;


#pragma mark -
#pragma mark Application lifecycle

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
	
	[window addSubview:[navigationController view]];
    [window makeKeyAndVisible];
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}


@end

