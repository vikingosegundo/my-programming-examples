//
//  OverlayTestViewController.m
//  OverlayTest
//
//  Created by Manuel Meyer on 28.09.11.
//  Copyright 2011 apparatschik. All rights reserved.
//

#import "OverlayTestViewController.h"

@interface OverlayTestViewController ()
@property (nonatomic,retain) UIView *overlayView;
@end

@implementation OverlayTestViewController
@synthesize showOverlay;
@synthesize overlayView;

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [self setShowOverlay:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [showOverlay release];
	[overlayView release];
    [super dealloc];
}
- (IBAction)showOverlay:(id)sender {
	
	if (!self.overlayView) {
		self.overlayView = [[[UIView alloc] initWithFrame:CGRectMake(110, 100, 100, 100)] autorelease];
		self.overlayView.backgroundColor = [UIColor colorWithWhite:0 alpha:.5];
		[self.view.window addSubview:self.overlayView];
		self.overlayView.hidden = YES;
	}
	
	self.overlayView.hidden = !self.overlayView.hidden;
	
}
@end
