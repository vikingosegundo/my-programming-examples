//
//  PaginationExampleViewController.m
//  PaginationExample
//
//  Created by Manuel on 01.12.10.
//  Copyright 2010 apparatschik. All rights reserved.
//

#import "PaginationExampleViewController.h"

@interface PaginationExampleViewController ()
@property (retain) NSArray *pageViews;

@end


@implementation PaginationExampleViewController
@synthesize pagingScrollView;
@synthesize pageViews;


#pragma mark -
#pragma mark  Frame calculations



- (CGSize)contentSizeForPagingScrollView {
    // We have to use the paging scroll view's bounds to calculate the contentSize, for the same reason outlined above.
    CGRect bounds = pagingScrollView.bounds;
    return CGSizeMake(bounds.size.width * [self.pageViews count] , bounds.size.height);
} 





// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    	
	
	UIView *blueView = [[[UIView alloc] initWithFrame:CGRectZero] autorelease];
	[blueView setBackgroundColor:[UIColor blueColor]];

	UIView *redView = [[[UIView alloc] initWithFrame:CGRectZero] autorelease];
	[redView setBackgroundColor:[UIColor redColor]];
	
	UIView *yellowView = [[[UIView alloc] initWithFrame:CGRectZero] autorelease];
	[yellowView setBackgroundColor:[UIColor yellowColor]]; 
	
	self.pageViews = [NSArray arrayWithObjects:blueView, redView, yellowView,nil];
	
	for (UIView *view in self.pageViews) {
		[view setFrame:CGRectMake([self.pageViews indexOfObject:view]*self.pagingScrollView.frame.size.width+5, 5, self.pagingScrollView.frame.size.width-10, self.pagingScrollView.frame.size.height-10.0)];
		[self.pagingScrollView addSubview:view];
		[view release];

	}
	
	pagingScrollView.pagingEnabled = YES;
    pagingScrollView.backgroundColor = [UIColor blackColor];
    pagingScrollView.showsVerticalScrollIndicator = NO;
    pagingScrollView.showsHorizontalScrollIndicator = NO;
    pagingScrollView.contentSize = [self contentSizeForPagingScrollView];
    pagingScrollView.delegate = self;
    self.view = pagingScrollView;
	
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
	self.pageViews = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
