//
//  M18CoffeeAppDelegate.h
//  M18Coffee
//
//  Created by Manuel on 19.01.10.
//  Copyright apparatschik 2010. All rights reserved.
//

@interface M18CoffeeAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

