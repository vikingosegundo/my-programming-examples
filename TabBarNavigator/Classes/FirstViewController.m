#import "FirstViewController.h"
#import "NewViewController.h"


@implementation FirstViewController

-(void) viewDidLoad
{
	self.tableView = nil;	
	UITableView *tv = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] bounds] style:UITableViewStyleGrouped];
	self.tableView = tv; 
	[tv release];
}


-(void) viewDidUnload
{
	[self.tableView release];	
	[super viewDidUnload];
}

- (void) dealloc {
    [super dealloc];
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
	return 2;
}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	return [NSString stringWithFormat:@"Section %d", section];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	// Configure the cell.
	cell.textLabel.text = [NSString stringWithFormat:@"%d.%d", indexPath.section, indexPath.row];
    return cell;
}



-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
	NewViewController *controller = [[NewViewController alloc] initWithString:[NSString stringWithFormat:@"%d.%d", indexPath.section, indexPath.row]];
	[[self navigationController] pushViewController:controller animated:YES];
	[controller release], controller = nil;
}

@end
