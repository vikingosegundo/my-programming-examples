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
    }
    return self;
}

- (void)dealloc {
    [super dealloc];
}


@end
