//
//  Order.h
//  M18Coffee
//
//  Created by Manuel on 19.01.10.
//  Copyright 2010 apparatschik. All rights reserved.
//

#import <CoreData/CoreData.h>


@interface Order :  NSManagedObject  
{
}

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSString * text;
@property (nonatomic, retain) NSNumber * amount;

@end



