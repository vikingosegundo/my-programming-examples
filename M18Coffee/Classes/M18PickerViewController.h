//
//  M18PickerViewController.h
//  M18Coffee
//
//  Created by vikingosegundo on 18.01.10.
//  Copyright 2010 apparatschik. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface M18PickerViewController : UIViewController {
	IBOutlet UIPickerView *pickerView;
	NSArray *coffeeKinds;
	NSArray *coffeeOptions;
	NSArray *latteOptions;
}

-(IBAction) addCoffee;

@property(nonatomic,retain) NSArray *coffeeKinds;
@property(nonatomic,retain) NSArray *coffeeOptions;
@property(nonatomic, retain)NSArray *latteOptions;

@end
