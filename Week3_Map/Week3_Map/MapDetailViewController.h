//
//  MapDetailViewController.h
//  Week3_Map
//
//  Created by Nicholas Weil on 9/12/12.
//  Copyright (c) 2012 Nicholas Weil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapLocation.h"
#import <MapKit/MapKit.h>  // Importing the MapKit Framework Header



@interface MapDetailViewController : UIViewController
{
    IBOutlet MKMapView *detailMapView;
    IBOutlet UILabel *locationName;
    IBOutlet UILabel *latLong;
    MapLocation* sendDetail1;
    MapLocation* sendDetail2;
    
}

@property (retain) IBOutlet MKMapView *mapView;
-(IBAction)implementMap:(CLLocationCoordinate2D)coord title:(NSString *)warehouseName;

@end
