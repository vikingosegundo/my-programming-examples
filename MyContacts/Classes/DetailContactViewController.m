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

@interface DetailContactViewController ()
@property(nonatomic, retain) NSArray *possibleFields;
@end

@implementation DetailContactViewController
@synthesize contact;

@synthesize possibleFields;

#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
	self.possibleFields = [(MyContactsAppDelegate *)[[UIApplication sharedApplication] delegate] allPossibleFields];
}


-(void) viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	if (headerView == nil) {
		[[NSBundle mainBundle] loadNibNamed:@"DetailContactHeader" owner:self options:nil];
		headerView.nameLabel.text = [NSString stringWithFormat:@"%@ %@", [contact objectForKey:@"name"], [contact objectForKey:@"familyname"]];
		if ([[contact allKeys] containsObject:@"pictureurl"]) {
			headerView.avatarView.image = [UIImage imageNamed:[contact objectForKey:@"pictureurl"]];
		}
	}
	[self.tableView setTableHeaderView: headerView];
	
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[contact allKeys] count]-3;
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

//	cell.backgroundView = [[[UIView alloc] initWithFrame:cell.frame] autorelease];
//	cell.backgroundView.backgroundColor = [UIColor whiteColor];
//	for (UIView* view in cell.contentView.subviews) 
//	{
//		view.backgroundColor = [UIColor clearColor];
//	}
//	cell.selectedBackgroundView = [[[UIImageView alloc] initWithFrame:cell.frame] autorelease];
//	UIImage *img = [UIImage imageNamed:@"bg.png"];
//	[(UIImageView*)[cell selectedBackgroundView] setImage:img];
		
    return cell;
}

-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	return 44.0;
}

-(UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	UILabel *l = [[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 44)] autorelease];
	l.backgroundColor = [UIColor clearColor];
	l.text= @"I am a Section Header";
	return l;
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

- (void)dealloc {
	[headerView release];
	[contact release];
	[possibleFields release];
    [super dealloc];
}


@end

