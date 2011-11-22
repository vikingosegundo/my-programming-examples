//
//  ViewController.h
//  HideImages
//
//  Created by Manuel Meyer on 22.11.11.
//  Copyright (c) 2011 apparatschik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (nonatomic,retain) NSMutableArray *imageViews;
@property (retain, nonatomic) IBOutlet UIButton *toggleButton;
- (IBAction)toggleImageViews:(id)sender;
@end
