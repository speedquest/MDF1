//
//  CustomCell.h
//  Week1_TableView_Example
//
//  Created by Nicholas Weil on 8/28/12.
//  Copyright (c) 2012 Nicholas Weil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell

{
    IBOutlet UILabel *boxLabel;
    IBOutlet UILabel *rackLabel;
}

@property (strong, nonatomic)IBOutlet UILabel *boxLabel;
@property (strong, nonatomic)IBOutlet UILabel *rackLabel;


@end
