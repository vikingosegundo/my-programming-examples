//
//  DetailViewController.m
//  Favorite
//
//  Created by Manuel on 07.12.10.
//  Copyright 2010 apparatschik. All rights reserved.
//

#import "DetailViewController.h"


@implementation DetailViewController
@synthesize favButton;
@synthesize number;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

- (void)viewDidLoad {
    [super viewDidLoad];
	self.title = [NSString stringWithFormat:@"%d", self.number];
	if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"favoriteItems"] containsObject:[NSNumber numberWithInt:self.number]]) {
		self.favButton.selected = YES;
	}
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


-(IBAction)toggleFav:(UIButton *)sender {
    if([sender isSelected]){
        //...
        [sender setSelected:NO];
		NSMutableArray *array = [[[NSUserDefaults standardUserDefaults] objectForKey:@"favoriteItems"] mutableCopy];
		[array removeObject:[NSNumber numberWithInt:self.number]];
		[[NSUserDefaults standardUserDefaults] setObject:array forKey:@"favoriteItems"];
		[array release];
    } else {
        //...    
        [sender setSelected:YES];
		NSMutableArray *array = [[[NSUserDefaults standardUserDefaults] objectForKey:@"favoriteItems"] mutableCopy];
		[array addObject:[NSNumber numberWithInt:self.number]];
		[[NSUserDefaults standardUserDefaults] setObject:array forKey:@"favoriteItems"];
		[array release];
    }
}


@end
