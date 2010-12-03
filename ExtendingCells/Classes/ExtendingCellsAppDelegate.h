//
//  ExtendingCellsAppDelegate.h
//  ExtendingCells
//
//  Created by Vikingosegundo on 29.07.10.
//  Copyright (c) 2010 Vikingosegundo. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface ExtendingCellsAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {
    UIWindow *window;

    UITabBarController *tabBarController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;


@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@end

