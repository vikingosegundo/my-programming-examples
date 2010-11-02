//
//  VSCheckFavoritesViewController.m
//  VSCheckFavorites
//
//  Created by Manuel on 02.11.10.
//  Copyright 2010 apparatschik. All rights reserved.
//

#import "VSCheckFavoritesViewController.h"
#import "ShowFavoritesTableController.h"
#import "CheckTableController.h"

@implementation VSCheckFavoritesViewController
@synthesize showTableController;
@synthesize checkTableController;



// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}


/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	self.showTableController = [[ShowFavoritesTableController alloc] init];
	self.checkTableController= [[CheckTableController alloc] init];
    
	showTable.delegate = self.showTableController;
	showTable.dataSource=self.showTableController;
	
	checkTable.delegate = self.checkTableController;
	checkTable.dataSource=self.checkTableController;
	
	self.showTableController.tableView = showTable;
	self.checkTableController.tableView = checkTable;
	
	
	self.checkTableController.delegate = self.showTableController;
	
	[super viewDidLoad];
	
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
	[self.showTableController release];
	[self.checkTableController release];
    [super dealloc];
}

@end
