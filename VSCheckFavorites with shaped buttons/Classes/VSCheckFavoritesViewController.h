//
//  VSCheckFavoritesViewController.h
//  VSCheckFavorites
//
//  Created by Manuel on 02.11.10.
//  Copyright 2010 apparatschik. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ShowFavoritesTableController;
@class CheckTableController;

@interface VSCheckFavoritesViewController : UIViewController {
	IBOutlet UITableView *showTable;
	IBOutlet UITableView *checkTable;
}
@property(nonatomic,retain) IBOutlet ShowFavoritesTableController *showTableController;
@property(nonatomic,retain) IBOutlet CheckTableController *checkTableController;
@end

