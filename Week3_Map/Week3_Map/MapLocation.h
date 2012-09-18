//
//  MapLocation.h
//  Week3_Map
//
//  Created by Nicholas Weil on 9/12/12.
//  Copyright (c) 2012 Nicholas Weil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MapKit/Mapkit.h"

@interface MapLocation : NSObject <MKAnnotation>
{
    CLLocationCoordinate2D coordinate;
    NSString* title;
    NSString* warehouseDetail;
}

@property (nonatomic, assign)	CLLocationCoordinate2D	coordinate;
@property (nonatomic, copy)		NSString*				title;
@property (nonatomic, copy)		NSString*				warehouseDetail;

@end
