//
//  TwoTableViewsViewController.m
//  TwoTableViews
//
//  Created by Manuel on 16.08.10.
//  Copyright apparatschik 2010. All rights reserved.
//

#import "TwoTableViewsViewController.h"

@implementation TwoTableViewsViewController



/*
 // The designated initializer. Override to perform setup that is required before the view is loaded.
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
 // Custom initialization
 }
 return self;
 }
 */

/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView {
 }
 */



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	if (firstController == nil) {
		firstController = [[FirstTVContoller alloc] init];
	}
	if (secondController == nil) {
		secondController = [[SecondTVController alloc] init];
	}
	[firstTable setDataSource:firstController];
	[secondTable setDataSource:secondController];
	
	[firstTable setDelegate:firstController];
}



/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

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
	[firstController release];
	[secondController release];
	[firstTable release];
	[secondTable release];
    [super dealloc];
}

@end
