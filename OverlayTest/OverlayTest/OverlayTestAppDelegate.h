//
//  OverlayTestAppDelegate.h
//  OverlayTest
//
//  Created by Manuel Meyer on 28.09.11.
//  Copyright 2011 apparatschik. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OverlayTestViewController;

@interface OverlayTestAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet OverlayTestViewController *viewController;

@end
