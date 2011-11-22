//
//  ViewController.h
//  KeyboardScroll
//
//  Created by Manuel Meyer on 22.11.11.
//  Copyright (c) 2011 apparatschik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
@property (retain, nonatomic) UITextField *selectedTextField;
@end
