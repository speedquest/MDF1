//
//  MapDetailViewController.m
//  Week3_Map
//
//  Created by Nicholas Weil on 9/12/12.
//  Copyright (c) 2012 Nicholas Weil. All rights reserved.
//

#import "MapDetailViewController.h"
#import "FirstViewController.h"
#import "MapLocation.h"
#import "AppDelegate.h"
#import <MapKit/MapKit.h>

@interface MapDetailViewController ()

@end

@implementation MapDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


- (IBAction)mapView:(CLLocationCoordinate2D)coord title:(NSString *)title
{
    NSString *mCoord = [[NSString alloc]initWithFormat:@"Lon: %f Lat: %f", coord.longitude, coord.latitude];
    
    locationName.text = title;
    locationName.text = mCoord;
    
    MKCoordinateRegion newRegion;
    newRegion.center.latitude = coord.latitude;
    newRegion.center.longitude = coord.longitude;
    newRegion.span.latitudeDelta = 0.0333;
    newRegion.span.longitudeDelta = 0.0333;
    
    self.mapView.delegate = (id)self;
    
    self.title = title;
    
    [self.mapView setRegion:newRegion animated:YES];
    
    CLLocationCoordinate2D location;
    location.latitude = coord.latitude;
    location.longitude = coord.longitude;
	
	sendDetail1=[[MapLocation alloc] init];
	sendDetail1.coordinate=location;
	sendDetail1.warehouseName=title;
	sendDetail1.warehouseDetail=@"Eat";
    
    [detailMapView addAnnotation:sendDetail1];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
