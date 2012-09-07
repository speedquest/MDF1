//
//  CustomCell.m
//  Week 2
//
//  Created by Nicholas Weil on 9/6/12.
//  Copyright (c) 2012 Nicholas Weil. All rights reserved.
//

#import "CustomCell.h"

@interface CustomCell ()

@end

@implementation CustomCell
@synthesize boxLabel;
@synthesize rackLabel;

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




- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
