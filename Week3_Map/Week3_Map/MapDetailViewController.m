
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
@synthesize mapTheView;

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


- (IBAction)implementMap:(CLLocationCoordinate2D)coord title:(NSString *)title
{
    NSString *mCoord = [[NSString alloc]initWithFormat:@"Lon: %f Lat: %f", coord.longitude, coord.latitude];
    
    locationName.text = title;
    latLong.text = mCoord;
    
    MKCoordinateRegion newRegion;
    newRegion.center.latitude = coord.latitude;
    newRegion.center.longitude = coord.longitude;
    newRegion.span.latitudeDelta = 0.0333;
    newRegion.span.longitudeDelta = 0.0333;
    
    self.mapTheView.delegate = (id)self;
    
    self.title = title;
    
    [self.mapTheView setRegion:newRegion animated:YES];
    
    CLLocationCoordinate2D location;
    location.latitude = coord.latitude;
    location.longitude = coord.longitude;
	
	sendDetail1=[[MapLocation alloc] init];
	sendDetail1.coordinate=location;
	sendDetail1.title=title;
	sendDetail1.warehouseDetail=@"Details";
    
    [mapTheView addAnnotation:sendDetail1];
}


- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    MKPinAnnotationView* pinView = (MKPinAnnotationView*)[self.mapTheView dequeueReusableAnnotationViewWithIdentifier:@"MapLocation"];
    
    if (!pinView)
        pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"PinAnnotation"];
    else
        pinView.enabled = YES;
    pinView.canShowCallout = YES;
    
    return pinView;
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
