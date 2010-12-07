//
//  FavoriteAppDelegate.h
//  Favorite
//
//  Created by Manuel on 07.12.10.
//  Copyright 2010 apparatschik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FavoriteAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

