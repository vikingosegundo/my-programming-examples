//
//  MyContactsAppDelegate.m
//  MyContacts
//
//  Created by Manuel on 18.08.10.
//  Copyright apparatschik 2010. All rights reserved.
//

#import "MyContactsAppDelegate.h"
#import "RootViewController.h"


@implementation MyContactsAppDelegate

@synthesize window;
@synthesize navigationController;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {  
	NSString* plistPath = [[NSBundle mainBundle] pathForResource:@"contacts" ofType:@"plist"];
	contacts = [[NSArray arrayWithContentsOfFile:plistPath] retain];
    [window addSubview:navigationController.view];
    [window makeKeyAndVisible];
	
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
}


- (void)dealloc {
	[contacts release];
	[fields release];
	[navigationController release];
	[window release];
	[super dealloc];
}

-(NSArray *) allContacts
{
	return contacts;
}

-(NSArray *)allPossibleFields
{
	if (fields == nil) {
		fields = [[NSArray alloc] initWithObjects:@"street", @"number",@"city",@"province",@"country",nil] ;
	}
	return fields;
}
@end

