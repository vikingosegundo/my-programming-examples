//
//  ViewController.m
//  HideImages
//
//  Created by Manuel Meyer on 22.11.11.
//  Copyright (c) 2011 apparatschik. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize imageViews;
@synthesize toggleButton;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}


-(void)dealloc
{
	[imageViews release];
	[toggleButton release];
	[super dealloc];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	if (!imageViews) {
		self.imageViews = [NSMutableArray array];
	}

	for(UIView *v in self.view.subviews)
		if([v isKindOfClass:[UIImageView class]])
			[self.imageViews addObject:v];
}

- (void)viewDidUnload
{
	[self setToggleButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)toggleImageViews:(id)sender
{
	if ([self.view.subviews containsObject:[self.imageViews lastObject]]) {
		for(UIView *v in self.view.subviews)
			if([v isKindOfClass:[UIImageView class]])
				[v removeFromSuperview];
		[self.toggleButton setTitle:@"show" forState:UIControlStateNormal];
	} else {
		for(UIView *v in self.imageViews)
			[self.view addSubview:v];
		[self.toggleButton setTitle:@"hide" forState:UIControlStateNormal];		
	}	
}
@end
