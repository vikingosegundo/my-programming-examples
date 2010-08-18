//
//  DetailContactViewController.m
//  MyContacts
//
//  Created by Manuel on 18.08.10.
//  Copyright 2010 apparatschik. All rights reserved.
//

#import "DetailContactViewController.h"
#import "DetailContactHeaderView.h"
#import "MyContactsAppDelegate.h"
@implementation DetailContactViewController
@synthesize contact;

@synthesize possibleFields;

#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];

	self.possibleFields = [(MyContactsAppDelegate *)[[UIApplication sharedApplication] delegate] allPossibleFields];
	
}




#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [[contact allKeys] count]-3;
}


-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	if (section == 0) {
		return 80.0;
	}
	return 0;
}

-(UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	if (section == 0) {
		if (headerView == nil) {
			
			
			[[NSBundle mainBundle] loadNibNamed:@"DetailContactHeader" owner:self options:nil];
			headerView.nameLabel.text = [NSString stringWithFormat:@"%@ %@", [contact objectForKey:@"name"], [contact objectForKey:@"familyname"]];
			if ([[contact allKeys] containsObject:@"pictureurl"]) {
				headerView.avatarView.image = [UIImage imageNamed:[contact objectForKey:@"pictureurl"]];
			}
			
		}
		return headerView;
	}
	
	return nil;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier] autorelease];
    }
    
	id key = [self.possibleFields objectAtIndex:indexPath.row];
	cell.textLabel.text = [NSString stringWithFormat:@"%@", key];
	cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", [contact objectForKey:key]];
    
    return cell;
}



#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
}

- (void)viewDidUnload {

}


- (void)dealloc {
	[headerView release];
	[contact release];
	[possibleFields release];
    [super dealloc];
}


@end

