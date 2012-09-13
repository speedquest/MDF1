//
//  AppDelegate.h
//  Week3_Map
//
//  Created by Nicholas Weil on 9/12/12.
//  Copyright (c) 2012 Nicholas Weil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondViewController.h"
#import "MapDetailViewController.h"
#import "MapLocation.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>
{
    UIViewController *listView;
    MapDetailViewController *detailedMapView;
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
}

@property (nonatomic,retain) UIViewController *listView;
@property (nonatomic,retain) MapDetailViewController *detailedMapView;
@property (nonatomic, retain) NSMutableArray *locArray;
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

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITabBarController *tabBarController;


-(void)getLocations;

@end
