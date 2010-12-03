//
//  FirstViewController.m
//  ExtendingCells
//
//  Created by Vikingosegundo on 29.07.10.
//  Copyright (c) 2010 apparatschik. All rights reserved.
//
#import "FirstViewController.h"
@implementation FirstViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    selectedIndexPath = nil;
    articles = [[NSDictionary dictionaryWithObject:[NSArray arrayWithObjects:@"one", @"two", @"three",
                                                    @"four", @"five", @"six",
                                                    @"seven", @"eight", @"nine",
                                                    @"ten", @"eleven", nil]
                 forKey:@"title"] retain];
}
- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}
- (void)viewDidUnload {
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
- (void)dealloc {
    [selectedIndexPath release];
    [articles release];
    [super dealloc];
}

- (int)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[articles allKeys] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [[articles allKeys] objectAtIndex : section];
}

- (int)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section
{
    id key = [[articles allKeys] objectAtIndex:section];
    return [[articles objectForKey : key] count];
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ((selectedIndexPath != nil) && (selectedIndexPath.row == indexPath.row))
        return 80.0;
    return 40.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * MyIdentifier = @"MyIdentifier";
    UITableViewCell * cell = [self.tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier] autorelease];
    }
    id key = [[articles allKeys] objectAtIndex:indexPath.section];
    cell.textLabel.text = [[articles objectForKey:key] objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (selectedIndexPath == indexPath) {
        selectedIndexPath = nil;
    } else {
        selectedIndexPath = indexPath;
    }
    [self.tableView deselectRowAtIndexPath : indexPath animated : NO];
    [tableView beginUpdates];
    [tableView endUpdates];
}

@end
