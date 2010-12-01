//
//  PaginationExampleAppDelegate.h
//  PaginationExample
//
//  Created by Manuel on 01.12.10.
//  Copyright 2010 apparatschik. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PaginationExampleViewController;

@interface PaginationExampleAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    PaginationExampleViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet PaginationExampleViewController *viewController;

@end

