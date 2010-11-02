//
//  CheckTableController.h
//  VSCheckFavorites
//
//  Created by Manuel on 02.11.10.
//  Copyright 2010 apparatschik. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CheckTableControllerDelegate

-(void)checkTriggeredAtIndex:(int)index;
-(void)unCheckTriggeredAtIndex:(int)index;

@end

@interface CheckTableController : UITableViewController {
}
@property(nonatomic,retain) NSMutableArray *array;
@property(nonatomic,retain) id<CheckTableControllerDelegate> delegate;
@end
