//
//  FirstViewController.m
//  Week3_Map
//
//  Created by Nicholas Weil on 9/12/12.
//  Copyright (c) 2012 Nicholas Weil. All rights reserved.
//

#import "FirstViewController.h"
#import "MapLocation.h"
#import "MapDetailViewController.h"
#import "AppDelegate.h"
#import <MapKit/MapKit.h>
#import "SecondViewController.h"


@interface FirstViewController ()

@end

@implementation FirstViewController
@synthesize locationArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Storage Facility", @"Storage Facility");
        self.tabBarItem.image = [UIImage imageNamed:@"storage_24"];
    }
    return self;
}

- (void)viewDidLoad
{
    self.navigationController.navigationBar.tintColor=[UIColor blackColor];
    UIBarButtonItem *editButton =[[UIBarButtonItem alloc]initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(onEdit)];
    self.navigationItem.rightBarButtonItem = editButton;
    self.navigationItem.rightBarButtonItem = editButton;
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate getLocations];
    locationArray = appDelegate.locArray;
    
    CLLocationCoordinate2D theCoordinate1;
    theCoordinate1.latitude = 28.543711;    //  Washington Street
    theCoordinate1.longitude = -81.388308;
	
	CLLocationCoordinate2D theCoordinate2;
    theCoordinate2.latitude = 28.54208;     // W. Central Blvd.
    theCoordinate2.longitude = -81.385497;
	
	CLLocationCoordinate2D theCoordinate3;
    theCoordinate3.latitude = 28.540384;    // Church Street
    theCoordinate3.longitude = -81.381227;
	
	CLLocationCoordinate2D theCoordinate4;
    theCoordinate4.latitude = 28.541298;    // E. Pine Street
    theCoordinate4.longitude = -81.37861;
    
    CLLocationCoordinate2D theCoordinate5;
    theCoordinate5.latitude = 28.553277;    // E. Colonial Drive
    theCoordinate5.longitude = -81.374753;
    
    CLLocationCoordinate2D theCoordinate6;
    theCoordinate6.latitude = 28.591955;    //  Full Sail
    theCoordinate6.longitude = -81.304301;
    
    CLLocationCoordinate2D theCoordinate7;
    theCoordinate7.latitude = 28.553465;    //  Executive Airport
    theCoordinate7.longitude = -81.332746;
    
    CLLocationCoordinate2D theCoordinate8;
    theCoordinate8.latitude = 28.560702;    //  College Park
    theCoordinate8.longitude = -81.389136;
    
    CLLocationCoordinate2D theCoordinate9;
    theCoordinate9.latitude = 28.571708;    //  Florida Hospital
    theCoordinate9.longitude = -81.370082;
    
    CLLocationCoordinate2D theCoordinate10;
    theCoordinate10.latitude = 28.542156;   // Lake Eola
    theCoordinate10.longitude = -81.373;
    
    
    MapLocation* mapLocation1 = [[MapLocation alloc] init];
    mapLocation1.coordinate=theCoordinate1;
	mapLocation1.title=@"Washington Street";
	mapLocation1.warehouseDetail=@"Low rent";
	
	MapLocation* mapLocation2=[[MapLocation alloc] init];
	mapLocation2.coordinate=theCoordinate2;
	mapLocation2.title=@"W. Central Blvd.";
	mapLocation2.warehouseDetail=@"Rough neighborhood";
	
	MapLocation* mapLocation3=[[MapLocation alloc] init];
	mapLocation3.coordinate=theCoordinate3;
	mapLocation3.title=@"Church Street";
	mapLocation3.warehouseDetail=@"HIGH rent!";
	
	MapLocation* mapLocation4=[[MapLocation alloc] init];
	mapLocation4.coordinate=theCoordinate4;
	mapLocation4.title=@"E. Pine Street";
	mapLocation4.warehouseDetail=@"Trendy/SoHo?";
    
    MapLocation* mapLocation5=[[MapLocation alloc] init];
	mapLocation5.coordinate=theCoordinate5;
	mapLocation5.title=@"E. Colonial Drive";
	mapLocation5.warehouseDetail=@"Run down";
	
	MapLocation* mapLocation6=[[MapLocation alloc] init];
	mapLocation6.coordinate=theCoordinate6;
	mapLocation6.title=@"Full Sail";
	mapLocation6.warehouseDetail=@"Too many kids";
	
	MapLocation* mapLocation7=[[MapLocation alloc] init];
	mapLocation7.coordinate=theCoordinate7;
	mapLocation7.title=@"Executive Airport";
	mapLocation7.warehouseDetail=@"Cheap rent?";
	
	MapLocation* mapLocation8=[[MapLocation alloc] init];
	mapLocation8.coordinate=theCoordinate8;
	mapLocation8.title=@"College Park";
	mapLocation8.warehouseDetail=@"Crowded";
    
    MapLocation* mapLocation9=[[MapLocation alloc] init];
	mapLocation9.coordinate=theCoordinate9;
	mapLocation9.title=@"Florida Hospital";
	mapLocation9.warehouseDetail=@"Nice parking";
	
	MapLocation* mapLocation10=[[MapLocation alloc] init];
	mapLocation10.coordinate=theCoordinate10;
	mapLocation10.title=@"Lake Eola";
	mapLocation10.warehouseDetail=@"Too wet";
    
    [locationArray addObject:mapLocation1];
	[locationArray addObject:mapLocation2];
	[locationArray addObject:mapLocation3];
	[locationArray addObject:mapLocation4];
    [locationArray addObject:mapLocation5];
    [locationArray addObject:mapLocation6];
    [locationArray addObject:mapLocation7];
    [locationArray addObject:mapLocation8];
    [locationArray addObject:mapLocation9];
    [locationArray addObject:mapLocation10];
    
    NSLog(@"The array is%@",locationArray);
    
}


//- (IBAction)edit:(id)sender
//{
//    if (locationListView.isEditing == NO){
//        [editBtn setTitle:@"DONE" forState:UIControlStateNormal];
//        [editBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
//        [locationListView setEditing:YES animated:YES];
//    }else{
//        [locationListView setEditing:NO animated:YES];
//        [editBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//        [editBtn setTitle:@"EDIT" forState:UIControlStateNormal];
//    }
//}
//  Setting up the Array count to figure out how many there are
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return locationArray.count;
}

//  Setting up the Editing of the Table
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(editingStyle == UITableViewCellEditingStyleDelete)
    {
        [locationArray removeObjectAtIndex:indexPath.row];
        
        //  Test NSLog to see it's working
        NSLog(@"Total count: %i",locationArray.count);
        [locationListView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:true];
    }
}

//  Reusing Cells as they leave the screen to minimize memory use, etc.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    MapLocation *loc = [locationArray objectAtIndex:indexPath.row];
	cell.textLabel.text = loc.title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MapDetailViewController *details = [[MapDetailViewController alloc] initWithNibName:@"MapDetailViewController" bundle:nil];
    if (details != nil)
    {
        [self.navigationController pushViewController:details animated:YES];
        MapLocation *pinit = [locationArray objectAtIndex:indexPath.row];
        [details implementMap:pinit.coordinate title:pinit.title];
    }
}

-(void)onEdit
{
    [locationListView setEditing:!locationListView.editing animated:YES];
    
    if (locationListView.editing)
    {
        [self.navigationItem.rightBarButtonItem setTitle:@"Done"];
    }
    else
    {
        [self.navigationItem.rightBarButtonItem setTitle:@"Edit"];
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
