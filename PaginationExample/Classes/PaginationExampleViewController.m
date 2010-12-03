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
@synthesize pageControl;


#pragma mark -
#pragma mark  Frame calculations



- (CGSize)contentSizeForPagingScrollView {
    CGRect bounds = pagingScrollView.bounds;
    return CGSizeMake(bounds.size.width * [self.pageViews count] , bounds.size.height );
} 


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
		[view setFrame:CGRectMake([self.pageViews indexOfObject:view]*self.pagingScrollView.frame.size.width+5, 
								  5, 
								  self.pagingScrollView.frame.size.width-10, 
								  self.pagingScrollView.frame.size.height-10.0)];
		[self.pagingScrollView addSubview:view];
		[view release];

	}
	
	self.pageControl.numberOfPages = [self.pageViews count];
	self.pageControl.currentPage = 0;
	
	self.pagingScrollView.pagingEnabled = YES;
    self.pagingScrollView.backgroundColor = [UIColor blackColor];
    self.pagingScrollView.showsVerticalScrollIndicator = NO;
    self.pagingScrollView.showsHorizontalScrollIndicator = NO;
    self.pagingScrollView.contentSize = [self contentSizeForPagingScrollView];
    self.pagingScrollView.delegate = self;
    [self.view addSubview:pagingScrollView];
	[self.view addSubview:self.pageControl];
	
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
	self.pageViews = nil;
	self.pagingScrollView = nil;
	self.pageControl = nil;
}


- (void)dealloc {
    [super dealloc];
}

-(void) scrollViewDidScroll:(UIScrollView *)scrollView
{
	CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
	self.pageControl.currentPage = page;
}
@end
