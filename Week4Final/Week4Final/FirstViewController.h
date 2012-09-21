//
//  FirstViewController.h
//  Week4Final
//
//  Created by Nicholas Weil on 9/20/12.
//  Copyright (c) 2012 Nicholas Weil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "detailViewController.h"

@interface FirstViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, NSURLConnectionDelegate, NSURLConnectionDataDelegate, NSXMLParserDelegate>
{
    //  URL Request variables
    NSURLRequest *request;
    NSURLConnection * connection;
    NSURL *url;
    NSMutableData *requestData;
    
    __weak IBOutlet UIView *newDetailView;
    //  Data variables from array
    NSMutableArray *computers;
    //  Keep track of which row/item
    NSInteger *numItems;
    //  TableView Outlet
    IBOutlet UITableView *tableViewFeed;
    // detailView Controller
    detailViewController *detailView;
    __weak IBOutlet UILabel *serverN;
    __weak IBOutlet UILabel *serverQ;
    __weak IBOutlet UIButton *backButton;
    __weak IBOutlet UITableView *initialTable;
}

@property (strong, nonatomic) NSURLRequest *request;
@property (strong, nonatomic) NSURLConnection *connection;
@property (strong, nonatomic) NSURL *url;
@property (strong, nonatomic) NSMutableData *requestData;



@property (strong, nonatomic) NSMutableArray *computers;
@property (readwrite, nonatomic) NSInteger *numItems;

@property (strong, nonatomic) IBOutlet UITableView *tableViewFeed;
@property (strong, nonatomic) detailViewController *detailView;

-(IBAction)backButton:(id)sender;

@end