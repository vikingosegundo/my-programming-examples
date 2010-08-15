//
//  TwoTableViewsAppDelegate.h
//  TwoTableViews
//
//  Created by Manuel on 16.08.10.
//  Copyright apparatschik 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TwoTableViewsViewController;

@interface TwoTableViewsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    TwoTableViewsViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet TwoTableViewsViewController *viewController;

@end

