//
//  RootViewController.h
//  M18Coffee
//
//  Created by Manuel on 19.01.10.
//  Copyright apparatschik 2010. All rights reserved.
//
#import "M18PickerViewController.h"

@interface RootViewController : UITableViewController {
	M18PickerViewController* pickerViewController;
	NSMutableArray *data;
	NSManagedObjectModel *managedObjectModel;
    NSManagedObjectContext *managedObjectContext;	    
    NSPersistentStoreCoordinator *persistentStoreCoordinator;
}

-(IBAction) togglePicker;
-(void) addRow:(NSString*) row;
@property(nonatomic,retain) M18PickerViewController *pickerViewController;
@property(nonatomic,retain) NSMutableArray *data;

@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@end
