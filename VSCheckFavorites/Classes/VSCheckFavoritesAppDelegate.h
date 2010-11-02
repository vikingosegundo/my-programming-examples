//
//  VSCheckFavoritesAppDelegate.h
//  VSCheckFavorites
//
//  Created by Manuel on 02.11.10.
//  Copyright 2010 apparatschik. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VSCheckFavoritesViewController;

@interface VSCheckFavoritesAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    VSCheckFavoritesViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet VSCheckFavoritesViewController *viewController;

@end

