//
//  MyContactsAppDelegate.h
//  MyContacts
//
//  Created by Manuel on 18.08.10.
//  Copyright apparatschik 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyContactsAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
	NSArray *contacts;
	NSArray *fields;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

-(NSArray *)allContacts;
-(NSArray *)allPossibleFields;
@end

