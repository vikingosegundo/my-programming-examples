//
//  DetailViewController.h
//  Favorite
//
//  Created by Manuel on 07.12.10.
//  Copyright 2010 apparatschik. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DetailViewController : UIViewController {
	UIButton *favButton;
	NSInteger number;
}

@property(retain) IBOutlet UIButton *favButton;
@property(assign) NSInteger number;
-(IBAction)toggleFav:(UIButton *)sender;
@end
