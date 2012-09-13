//
//  SecondViewController.m
//  Week3_Map
//
//  Created by Nicholas Weil on 9/12/12.
//  Copyright (c) 2012 Nicholas Weil. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "SecondViewController.h"
#import "AppDelegate.h"
#import "MapLocation.h"
#import "FirstViewController.h"


@interface SecondViewController ()

@end

@implementation SecondViewController
@synthesize listView,a,b,c,d,e,f,g,h,i,j;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Map", @"Map");
        self.tabBarItem.image = [UIImage imageNamed:@"globe_24"];
    }
    return self;
}


- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    MKPinAnnotationView* pinView = (MKPinAnnotationView*)[self.listView dequeueReusableAnnotationViewWithIdentifier:@"MapLocation"];
    
    if (!pinView)
        pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"PinAnnotation"];
    else
        
        pinView.enabled = YES;
    pinView.canShowCallout = YES;
    
    return pinView;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:TRUE];
    
    MKCoordinateRegion newRegion;
    newRegion.center.latitude = 28.535143;
    newRegion.center.longitude = -81.382871;
    newRegion.span.latitudeDelta = .5;
    newRegion.span.longitudeDelta = .5;
    
    self.listView.delegate = self;
    
    [self.listView setRegion:newRegion animated:YES];
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate locArray];
    arrayDisplayLoc = appDelegate.locArray;
    
    
    [listView removeAnnotations:listView.annotations];
    for (int counter = 0; arrayDisplayLoc.count > counter; counter++)
    {
        MapLocation *locations = [arrayDisplayLoc objectAtIndex:counter];
        [listView addAnnotation:locations];
    }
    
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
