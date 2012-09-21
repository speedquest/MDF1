//
//  serverDetails.m
//  Week4Final
//
//  Created by Nicholas Weil on 9/20/12.
//  Copyright (c) 2012 Nicholas Weil. All rights reserved.
//

#import "serverDetails.h"

@implementation serverDetails

-(id)initWithName:(NSString*)computersName mainUse:(NSString*)usedFor
{
    if ((self = [super init]))
    {
        name = computersName;
        type = usedFor;
    }
    return self;
}

@end