//
//  M18PickerViewController.m
//  M18Coffee
//
//  Created by vikingosegundo on 18.01.10.
//  Copyright 2010 apparatschik. All rights reserved.
//

#import "M18PickerViewController.h"
#import "RootViewController.h"


@interface M18PickerViewController ()
NSInteger numberOfComponents;
@end


@implementation M18PickerViewController



@synthesize coffeeKinds;
@synthesize coffeeOptions;
@synthesize latteOptions;

- (void)viewDidLoad {
	[super viewDidLoad];
	[[self.view viewWithTag:1] setHidden:NO];
	[self.view becomeFirstResponder];
	coffeeKinds = [[NSArray alloc] initWithObjects:@"",@"Coffee",@"Cappuchino",@"Latte",@"Espresso",@"Milkcoffee",nil];

	coffeeOptions = [[NSArray alloc] initWithObjects:@"",@"soymilk",@"doubled",@"cremé",@"simple",@"macchiato",nil];
	latteOptions = [[NSArray alloc] initWithObjects:@"",@"Caramel", @"Hazelnut",@"Almond", nil];
	UIButton *button = (UIButton*)[self.view viewWithTag:2];
	[button setEnabled:NO];
	numberOfComponents = 3;
}

 - (void)viewWillAppear:(BOOL)animated {
 [super viewWillAppear:animated];
 }
 


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[self.coffeeKinds release], self.coffeeKinds = nil;
	[self.coffeeOptions release], self.coffeeOptions=nil;
    [super dealloc];
}
- (IBAction) addCoffee{	
	UIButton *button =(UIButton*)[self.view viewWithTag:2];

	UITableView *tv =(UITableView*)[[self.view window] viewWithTag:100];

	UIPickerView* picker = (UIPickerView*)[self.view viewWithTag:1];
	
	
	NSString *row1 = [NSString stringWithFormat: @"%i", [picker selectedRowInComponent:0]+1];
	NSString *row2 = [NSString stringWithFormat: @"%@", [self.coffeeKinds objectAtIndex:[picker selectedRowInComponent:1]]];
	NSString *row3 = [NSString stringWithFormat: @"%@", [self.coffeeOptions objectAtIndex:[picker selectedRowInComponent:2]] ];
	
	[(RootViewController *)tv.dataSource addRow:[NSString stringWithFormat:@"%@ %@ %@",row1,row2,row3]];
	[picker selectRow:0 inComponent:0 animated:YES ];
	[picker selectRow:0 inComponent:1 animated:YES ];
	[picker selectRow:0 inComponent:2 animated:YES ];
	[button setEnabled:NO];
	[button setTitle:@"" forState:UIControlStateNormal];
	[button setHighlighted:NO];
}	


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pv{
	return numberOfComponents;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
	NSInteger i;
	if (component == 0) {
		i= 7;
	} else if (component == 1) {
		i= [self.coffeeKinds count]; 
	
	} else if (component == 2) {
		i= [self.coffeeOptions count]; 
	} else {
		i = [self.latteOptions count];
	}

	return i;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
	
	NSString *string;
	if (component == 0) {
		string = [NSString stringWithFormat:@"%i",row+1];
	} else if (component == 1) {
		string = [NSString stringWithFormat:@"%@", [self.coffeeKinds objectAtIndex:row]];
		if ([string  isEqualToString: @"" ]) {
			[[self.view viewWithTag:3] setHidden:YES];
		}
	}else if (component == 2) {
		string = [NSString stringWithFormat:@"%@", [self.coffeeOptions objectAtIndex:row]];
	}else if (component == 3) {
		string = [NSString stringWithFormat:@"%@", [self.latteOptions objectAtIndex:row]];
	}
	return string;
}
- (CGFloat)pickerView:(UIPickerView *)pv widthForComponent:(NSInteger)component {
	CGFloat f;
	if (component == 0) {
		f = 30;
		
	} else{
		f = [[pv viewWithTag:1] frame].size.width-80; 
		f = f/(numberOfComponents -1);
	}
	return f;
}
- (void)pickerView:(UIPickerView *)pv didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
	UIButton *button =(UIButton*)[self.view viewWithTag:2];

	if ([pv selectedRowInComponent:1] == 0) {
		[button setEnabled:NO];
		[button setHighlighted:NO];
	}	else {
		[button setEnabled:YES];
		[button setHighlighted:YES];
	}	
	
	UIPickerView* picker = (UIPickerView*)[self.view viewWithTag:1];
	NSString *row1 = [NSString stringWithFormat: @"%i", [picker selectedRowInComponent:0]+1];
	NSString *row2 = [NSString stringWithFormat: @"%@", [self.coffeeKinds objectAtIndex:[picker selectedRowInComponent:1]]];
	NSString *row3 = [NSString stringWithFormat: @"%@", [self.coffeeOptions objectAtIndex:[picker selectedRowInComponent:2]] ];
	[button setTitle:[NSString stringWithFormat:@"%@ %@ %@",row1,row2,row3] forState:UIControlStateNormal];
	if (component == 1 && row == 3) {
		numberOfComponents = 4;
		[pv reloadAllComponents];
	} else if ([pv selectedRowInComponent:1] !=3) {
		numberOfComponents = 3;
		[pv reloadAllComponents];
	}

	if (numberOfComponents == 4) {
		NSString *row4 = [self.latteOptions objectAtIndex:[picker selectedRowInComponent:3]];
		[button setTitle:[button.titleLabel.text stringByAppendingFormat:@" %@", row4] forState:UIControlStateNormal];
	}
	
	
}


@end
