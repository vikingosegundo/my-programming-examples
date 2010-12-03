//
//  FirstViewController.h
//  ExtendingCells
//
//  Created by Vikingosegundo on 29.07.10.
//  Copyright (c) 2010 apparatschik. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FirstViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource> {
    NSIndexPath *selectedIndexPath;
	NSDictionary *articles;
}

@end
