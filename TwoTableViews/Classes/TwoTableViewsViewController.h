//
//  TwoTableViewsViewController.h
//  TwoTableViews
//
//  Created by Manuel on 16.08.10.
//  Copyright apparatschik 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstTVContoller.h"
#import "SecondTVController.h"

@interface TwoTableViewsViewController : UIViewController {
	FirstTVContoller *firstController;
	SecondTVController *secondController;
	IBOutlet UITableView *firstTable;
	IBOutlet UITableView *secondTable;
}

@end

