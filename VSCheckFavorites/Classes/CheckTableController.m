//
//  CheckTableController.m
//  VSCheckFavorites
//
//  Created by Manuel on 02.11.10.
//  Copyright 2010 apparatschik. All rights reserved.
//

#import "CheckTableController.h"


@interface CheckTableController ()
-(void)buttonPressed:(UIButton *)sender;
@end


@implementation CheckTableController
@synthesize delegate;


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 3;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		UIImage *unselectedImage = [UIImage imageNamed:@"unselected.png"];
		UIImage *selectedImage = [UIImage imageNamed:@"selected.png"];
		UIButton *b = [UIButton buttonWithType:UIButtonTypeCustom];
		[b setBackgroundImage:unselectedImage forState:UIControlStateNormal];
		[b setBackgroundImage:selectedImage forState:UIControlStateSelected];
		[b addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
		[b setFrame:CGRectMake(0, 0, 40, 40)];
		[cell.contentView addSubview:b];
    }
		
    return cell;
}



#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:NO];
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}



-(void) buttonPressed:(UIButton *)sender
{
	UITableViewCell* cell =  (UITableViewCell*)sender.superview.superview;
	if([sender isSelected]){
		[self.delegate unCheckTriggeredAtIndex:[[self.tableView indexPathForCell:cell] row]];
		[sender setSelected:NO];
	} else {
		[self.delegate checkTriggeredAtIndex:[[self.tableView indexPathForCell:cell] row]];
		[sender setSelected:YES];
	}

}
@end

