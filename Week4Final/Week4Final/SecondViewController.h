//
//  SecondViewController.h
//  Week4Final
//
//  Created by Nicholas Weil on 9/20/12.
//  Copyright (c) 2012 Nicholas Weil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController <NSURLConnectionDataDelegate>
{
    NSURLRequest *secondRequest;
    NSURLConnection *secondConnection;
    NSURL *secondURL;
    
    NSMutableData *secondRequestData;
    
    IBOutlet UITextView *showMyXML;
}

@property (strong, nonatomic) IBOutlet UITextView *showMyXML;

@end