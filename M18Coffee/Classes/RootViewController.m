//
//  RootViewController.m
//  M18Coffee
//
//  Created by vikingosegundo on 19.01.10.
//  Copyright apparatschik 2010. All rights reserved.
//

#import "RootViewController.h"
#import "Order.h"


@implementation RootViewController

@synthesize pickerViewController;
@synthesize data;
@synthesize managedObjectModel;
@synthesize managedObjectContext;	    
@synthesize persistentStoreCoordinator;

- (void)viewDidLoad {
	data = [[NSMutableArray alloc] init];
	self.navigationItem.leftBarButtonItem = self.editButtonItem;
	
	self.managedObjectContext;
    [super viewDidLoad];
	
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	NSEntityDescription *entity = [NSEntityDescription entityForName:@"Order" inManagedObjectContext:managedObjectContext];
	[request setEntity:entity];
	
	NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"date" ascending:YES];
	NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
	[request setSortDescriptors:sortDescriptors];
	[sortDescriptors release];
	[sortDescriptor release];
	
	NSError *error;
	NSMutableArray *mutableFetchResults = [[managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
	if (mutableFetchResults == nil) {
		// Handle the error.
	}
	
	[self setData:mutableFetchResults];
	[mutableFetchResults release];
	[request release];
	
}


/*
 - (void)viewWillAppear:(BOOL)animated {
 [super viewWillAppear:animated];
 }
 */
/*
 - (void)viewDidAppear:(BOOL)animated {
 [super viewDidAppear:animated];
 }
 */
/*
 - (void)viewWillDisappear:(BOOL)animated {
 [super viewWillDisappear:animated];
 }
 */
/*
 - (void)viewDidDisappear:(BOOL)animated {
 [super viewDidDisappear:animated];
 }
 */

/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations.
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release anything that can be recreated in viewDidLoad or on demand.
	// e.g. self.myOutlet = nil;
}


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.data count];
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	
    static NSString *CellIdentifier = @"Cell";
	
	static NSDateFormatter *dateFormatter = nil; 
	if (dateFormatter == nil) {
		dateFormatter = [[NSDateFormatter alloc] init]; 
		[dateFormatter setTimeStyle:NSDateFormatterMediumStyle]; 
		[dateFormatter setDateStyle:NSDateFormatterNoStyle];
	}
	
    // Dequeue or create a new cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
	
    Order *order = (Order *)[data objectAtIndex:indexPath.row];
	
    NSString *string = [NSString stringWithFormat:@"%@",
						[order text]];
    cell.textLabel.text = string;
	
	NSString *dateString = [dateFormatter stringFromDate:[order date]];
	cell.detailTextLabel.text =   dateString;
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
	
    if (editingStyle == UITableViewCellEditingStyleDelete) {
		
        // Delete the managed object at the given index path.
        NSManagedObject *orderToDelete = [data objectAtIndex:indexPath.row];
        [managedObjectContext deleteObject:orderToDelete];
		
        // Update the array and table view.
        [data removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
		
        // Commit the change.
        NSError *error = nil;
        if (![managedObjectContext save:&error]) {
            // Handle the error.
        }
    }
}


/*
 // Override to support row selection in the table view.
 - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
 
 // Navigation logic may go here -- for example, create and push another view controller.
 // AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
 // [self.navigationController pushViewController:anotherViewController animated:YES];
 // [anotherViewController release];
 }
 */


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */


/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source.
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }   
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
 }   
 }
 */


/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */


/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


- (void)dealloc {
	
	[self.managedObjectModel release];
	[self.managedObjectContext release];	    
	[self.persistentStoreCoordinator release];
	[self.pickerViewController release];
	[self.data release];
    [super dealloc];
}

-(void) movePickerUp{
	if ([self.data count]> 0 && [self.tableView numberOfRowsInSection:0]*[self.tableView rowHeight]>160) {
		[UIView beginAnimations:@"PickerUpAnimation" context:nil];
		[UIView setAnimationBeginsFromCurrentState:YES];
		[UIView setAnimationDuration:.5];
		[self.tableView setFrame:CGRectMake(0, 0, [self.tableView frame].size.width, 160.0)];
		[UIView commitAnimations];
		[self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:[data count]-1 inSection:0] 
							  atScrollPosition:UITableViewScrollPositionTop 
									  animated:YES];
	}
	
}

-(void) movePickerDown{
    [UIView beginAnimations:@"PickerDownAnimation" context:nil];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:.5]; 
    CGSize size =  [self.tableView frame].size;
    [self.tableView setFrame:CGRectMake(0, 0, size.width, 416)];
    [UIView commitAnimations];
    if ([self.data count] > 0){
        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] 
							  atScrollPosition:UITableViewScrollPositionTop 
									  animated:YES];
    }
	
}

-(IBAction) togglePicker {
	if (self.pickerViewController == nil) {
		self.pickerViewController = [[M18PickerViewController alloc] initWithNibName:@"M18PickerViewController" bundle:nil];
		[[self.pickerViewController view] setFrame:CGRectMake(0, 220, 320, 260)];
		[self.view.window addSubview:[self.pickerViewController view]];
		[[self.pickerViewController view] setHidden:YES];
	};
	
	if ([self.pickerViewController.view isHidden]==YES) {
		[[self.pickerViewController view] setHidden:NO];
		[self movePickerUp];
		return;
	}
	[[self.pickerViewController view] setHidden:YES];
	[self movePickerDown];
	
	
}

-(void) addRow:(NSString*) row{
	[self.tableView reloadData];
	
	Order *order = (Order *)[NSEntityDescription insertNewObjectForEntityForName:@"Order" inManagedObjectContext:managedObjectContext];
	order.date =[NSDate date];
	order.text = row;
	
	NSError *error;
	if (![managedObjectContext save:&error]) {
		// Handle the error.
	}
	[data addObject:order];
	NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[data count]-1 inSection:0];
	[self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
						  withRowAnimation:UITableViewRowAnimationFade];
	[self movePickerUp];
}


/**
 Returns the managed object context for the application.
 If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
 */
- (NSManagedObjectContext *) managedObjectContext {
	
    if (managedObjectContext != nil) {
        return managedObjectContext;
    }
	
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        managedObjectContext = [[NSManagedObjectContext alloc] init];
        [managedObjectContext setPersistentStoreCoordinator: coordinator];
    }
    return managedObjectContext;
}


/**
 Returns the managed object model for the application.
 If the model doesn't already exist, it is created by merging all of the models found in the application bundle.
 */
- (NSManagedObjectModel *)managedObjectModel {
	
    if (managedObjectModel != nil) {
        return managedObjectModel;
    }
    managedObjectModel = [[NSManagedObjectModel mergedModelFromBundles:nil] retain];    
    return managedObjectModel;
}


/**
 Returns the persistent store coordinator for the application.
 If the coordinator doesn't already exist, it is created and the application's store added to it.
 */

/**
 Returns the path to the application's Documents directory.
 */
- (NSString *)applicationDocumentsDirectory {
	return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}


- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
	
    if (persistentStoreCoordinator != nil) {
        return persistentStoreCoordinator;
    }
	
    NSURL *storeUrl = [NSURL fileURLWithPath: [[self applicationDocumentsDirectory] stringByAppendingPathComponent: @"order.sqlite"]];
	
	NSError *error = nil;
    persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:nil error:&error]) {
		/*
		 Replace this implementation with code to handle the error appropriately.
		 
		 abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
		 
		 Typical reasons for an error here include:
		 * The persistent store is not accessible
		 * The schema for the persistent store is incompatible with current managed object model
		 Check the error message to determine what the actual problem was.
		 */
		NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
		abort();
    }    
	
    return persistentStoreCoordinator;
}

@end

