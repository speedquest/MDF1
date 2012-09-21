//
//  detailViewController.h
//  Week4Final
//
//  Created by Nicholas Weil on 9/20/12.
//  Copyright (c) 2012 Nicholas Weil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface detailViewController : UIViewController

{
    IBOutlet UITextView *detailViewInfo;
    NSMutableString *outputText;
}

-(void)detailName:(NSString*)serverName type:(NSString*)serverQuantity;

@end