//
//  serverDetailso.h
//  Week4Final
//
//  Created by Nicholas Weil on 9/20/12.
//  Copyright (c) 2012 Nicholas Weil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface serverDetails : NSObject
{
    NSString *name;
    NSString *type;
}

-(id)initWithName:(NSString*)computersName mainUse:(NSString*)usedFor;

@end

