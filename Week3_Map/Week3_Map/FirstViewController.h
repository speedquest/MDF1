//
//  FirstViewController.h
//  Week3_Map
//
//  Created by Nicholas Weil on 9/12/12.
//  Copyright (c) 2012 Nicholas Weil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "MapLocation.h"


@interface FirstViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UITableView *locationListView;
    NSMutableArray *locationArray;
    MapLocation* getLocation;
    __weak IBOutlet UIButton *editBtn;
}

@property (nonatomic) NSMutableArray *locationArray;
@property (weak, nonatomic) IBOutlet UIButton *editBtn;

-(IBAction)editTable:(id)sender;

@end
