//
//  OverlayTestViewController.h
//  OverlayTest
//
//  Created by Manuel Meyer on 28.09.11.
//  Copyright 2011 apparatschik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OverlayTestViewController : UIViewController {
	UIButton *showOverlay;
}

@property (nonatomic, retain) IBOutlet UIButton *showOverlay;
- (IBAction)showOverlay:(id)sender;

@end
