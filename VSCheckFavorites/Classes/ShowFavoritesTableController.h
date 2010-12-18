//
//  ShowFavoritesTableController.h
//  VSCheckFavorites
//
//  Created by Manuel on 02.11.10.
//  Copyright 2010 apparatschik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CheckTableController.h"



@interface ShowFavoritesTableController : UITableViewController <CheckTableControllerDelegate> {
	
}
@property(nonatomic,retain)NSMutableArray *data;
@end
