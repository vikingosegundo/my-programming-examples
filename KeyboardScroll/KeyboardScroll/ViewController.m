//
//  ViewController.m
//  KeyboardScroll
//
//  Created by Manuel Meyer on 22.11.11.
//  Copyright (c) 2011 apparatschik. All rights reserved.
//

#import "ViewController.h"
#import "VSTableViewCell.h"

@interface ViewController  ()
- (void)scrollToRectOfTextField;
@end

@implementation ViewController
@synthesize selectedTextField = selectedTextField_;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
	[self setTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}



-(void) viewWillAppear:(BOOL)animated
{
	if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone) {
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(keyboardDidShow:) 
													 name:UIKeyboardDidShowNotification 
												   object:self.view.window];
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(keyboardWillHide:) 
													 name:UIKeyboardWillHideNotification 
												   object:self.view.window];
	} 
	[super viewWillAppear:animated];

	
}


- (void)viewDidAppear:(BOOL)animated
{
 //   [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
	[[NSNotificationCenter defaultCenter] removeObserver:self 
                                                    name:UIKeyboardDidShowNotification 
                                                  object:nil]; 
    [[NSNotificationCenter defaultCenter] removeObserver:self 
                                                    name:UIKeyboardWillHideNotification 
                                                  object:nil];
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

- (void)dealloc {
	[selectedTextField_ release];
	[super dealloc];
}

- (void)keyboardDidShow:(NSNotification *)notification
{
	if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone) {
		NSDictionary *userInfo = [notification userInfo];
		CGSize size = [[userInfo objectForKey: UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
		CGRect newTableViewFrame = CGRectMake(self.tableView.frame.origin.x, self.tableView.frame.origin.y, 
											  self.tableView.frame.size.width, self.tableView.frame.size.height - size.height);
		self.tableView.frame = newTableViewFrame;
		
	}
}


- (void)keyboardWillHide:(NSNotification *)notification
{
    NSDictionary *userInfo = [notification userInfo];
    CGSize size = [[userInfo objectForKey: UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    self.tableView.frame = CGRectMake(self.tableView.frame.origin.x, 
                                      self.tableView.frame.origin.y, 
                                      self.tableView.frame.size.width, 
                                      self.tableView.frame.size.height + size.height);
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
    static NSString *CellIdentifier = @"CustomTableCell";
    static NSString *CellNib = @"VSTableViewCell";
	
    VSTableViewCell *cell = (VSTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:CellNib owner:self options:nil];
        cell = (VSTableViewCell *)[nib objectAtIndex:0];
		cell.textField.delegate = self;
    }
	
    // perform additional custom work...
	cell.textField.text = [NSString stringWithFormat:@"%d", indexPath.row];
    return cell;
}


- (void) textFieldDidBeginEditing:(UITextField *)textField {
    self.selectedTextField = textField;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	return YES;
}

- (void)scrollToRectOfTextField {
	UITableViewCell *cell = (UITableViewCell*)[self.selectedTextField superview];
	CGRect r = CGRectMake(self.selectedTextField.frame.origin.x, 
						  cell.frame.origin.y+self.selectedTextField.frame.origin.y,
						  self.selectedTextField.frame.size.width,
						  self.selectedTextField.frame.size.height);
	[self.tableView scrollRectToVisible:r animated:YES];
	

}

@end
