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
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

-(NSInteger) tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section
{
	return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyIdentifier"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewStylePlain reuseIdentifier:@"MyIdentifier"];
    }
    cell.textLabel.text = @"hhh";

    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	NSLog(@"%@, %d, %d ", tableView, indexPath.section, indexPath.row);
}

@end
