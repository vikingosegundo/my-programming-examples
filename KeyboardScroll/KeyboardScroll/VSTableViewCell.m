//
//  VSTableViewCell.m
//  KeyboardScroll
//
//  Created by Manuel Meyer on 22.11.11.
//  Copyright (c) 2011 apparatschik. All rights reserved.
//

#import "VSTableViewCell.h"

@implementation VSTableViewCell
@synthesize textField;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
	[textField release];
	[super dealloc];
}
@end
