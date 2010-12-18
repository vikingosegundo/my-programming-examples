//
//  ShowFavoritesTableController.m
//  VSCheckFavorites
//
//  Created by Manuel on 02.11.10.
//  Copyright 2010 apparatschik. All rights reserved.
//

#import "ShowFavoritesTableController.h"

@implementation ShowFavoritesTableController
@synthesize data;


#pragma mark -
#pragma mark Initialization




#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [data count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	cell.textLabel.text = [NSString stringWithFormat:@"%@", [data objectAtIndex:indexPath.row]];
    return cell;
}


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	NSLog(@"tableView:didSelectRowAtIndexPath:%d", indexPath.row);
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
	[self.data release];
    [super dealloc];
}


-(void) checkTriggeredAtIndex:(int)index
{
	if (self.data == nil) {
		self.data = [[NSMutableArray alloc] init];
	}
	NSLog(@"checkTriggeredAtIndex:%d", index);
	[self.data addObject:[NSString stringWithFormat:@"%d", index]];
	[self.tableView reloadData];
}

-(void) unCheckTriggeredAtIndex:(int)index
{
	NSLog(@"unCheckTriggeredAtIndex:%d", index);
	NSString *string = [NSString stringWithFormat:@"%d", index];
	[self.data removeObject:string];
	[self.tableView reloadData];
}

@end

