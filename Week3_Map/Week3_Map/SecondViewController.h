//
//  SecondViewController.h
//  Week3_Map
//
//  Created by Nicholas Weil on 9/12/12.
//  Copyright (c) 2012 Nicholas Weil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapLocation.h"
#import <MapKit/MapKit.h>


@interface SecondViewController : UIViewController <MKMapViewDelegate>
{
    IBOutlet MKMapView *listView;
    MapLocation* sendDetail1;
    MapLocation* sendDetail2;
    MapLocation *a;
    MapLocation *b;
    MapLocation *c;
    MapLocation *d;
    MapLocation *e;
    MapLocation *f;
    MapLocation *g;
    MapLocation *h;
    MapLocation *i;
    MapLocation *j;
    
    NSMutableArray *arrayDisplayName;
    NSMutableArray *arrayDisplayLoc;

 
}

@property (retain) IBOutlet MKMapView *listView;
@property (nonatomic,retain) MapLocation *a;
@property (nonatomic,retain) MapLocation *b;
@property (nonatomic,retain) MapLocation *c;
@property (nonatomic,retain) MapLocation *d;
@property (nonatomic,retain) MapLocation *e;
@property (nonatomic,retain) MapLocation *f;
@property (nonatomic,retain) MapLocation *g;
@property (nonatomic,retain) MapLocation *h;
@property (nonatomic,retain) MapLocation *i;
@property (nonatomic,retain) MapLocation *j;
@property (nonatomic, retain) NSMutableArray *arrayDisplayName;
@property (nonatomic, retain) NSMutableArray *arrayDisplayLoc;


@end
