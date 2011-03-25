//
//  FirstTVContoller.m
//  TwoTableViews
//
//  Created by Manuel on 16.08.10.
//  Copyright 2010 apparatschik. All rights reserved.
//

#import "FirstTVContoller.h"
#import "SecondTVController.h"

@implementation FirstTVContoller



-(void) loadView
{
	if (items == nil) {
		items = [[NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"6",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",nil] retain];
	}
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

-(NSInteger) tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section
{
	return [items count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyIdentifier"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewStylePlain reuseIdentifier:@"MyIdentifier"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"1.%@" ,[items objectAtIndex:indexPath.row]];
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {

        return UITableViewCellEditingStyleDelete;
    
}
- (void)tableView:(UITableView *)tv commitEditingStyle:(UITableViewCellEditingStyle)editingStyle 
forRowAtIndexPath:(NSIndexPath *)indexPath {
	
    if(editingStyle == UITableViewCellEditingStyleDelete) {		
        //Delete the object from the table.
		[items removeObjectAtIndex:indexPath.row];
        [tv deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

-(void) dealloc
{
	[items release];
	[super dealloc];
}

@end
