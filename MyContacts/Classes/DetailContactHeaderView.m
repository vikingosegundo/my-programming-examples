//
//  DetailContactHeaderView.m
//  MyContacts
//
//  Created by Manuel on 18.08.10.
//  Copyright 2010 apparatschik. All rights reserved.
//

#import "DetailContactHeaderView.h"


@implementation DetailContactHeaderView
@synthesize nameLabel, avatarView;

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)dealloc {
    [super dealloc];
}


@end
