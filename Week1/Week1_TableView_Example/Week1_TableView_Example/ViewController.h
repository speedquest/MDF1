//
//  ViewController.h
//  Week1_TableView_Example
//
//  Created by Nicholas Weil on 8/28/12.
//  Copyright (c) 2012 Nicholas Weil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailedView.h"

@interface ViewController : UIViewController <UITableViewDelegate>
{
    IBOutlet UITableView *theTableView;         //  Establishing the Table Outlet
    NSMutableArray *boxArray;                   //  Establihsing the Array to store box numbers
    NSMutableArray *rackArray;                  //  Establishing the Array to store rack numbers

    DetailedView *detailsViewController;        //  Establishing the secondary view to show more data
}

@property (strong, nonatomic) NSMutableArray *boxArray;
@property (strong, nonatomic) NSMutableArray *rackArray;
@property (nonatomic, retain) DetailedView *detailsViewController;


- (IBAction)clickEdit:(id)sender;


@end
