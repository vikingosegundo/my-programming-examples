//
//  DetailContactViewController.h
//  MyContacts
//
//  Created by Manuel on 18.08.10.
//  Copyright 2010 apparatschik. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DetailContactHeaderView;

@interface DetailContactViewController : UITableViewController {
	IBOutlet DetailContactHeaderView *headerView;
	NSArray *possibleFields;	
}

@property(nonatomic, retain) NSDictionary *contact;
@property(nonatomic, retain) UIView *footerView;
@end
