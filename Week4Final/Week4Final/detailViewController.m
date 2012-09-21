//
//  detailViewController.m
//  Week4Final
//
//  Created by Nicholas Weil on 9/20/12.
//  Copyright (c) 2012 Nicholas Weil. All rights reserved.
//

#import "detailViewController.h"

@interface detailViewController ()

@end

@implementation detailViewController

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



 -(void)detailName:(NSString*)serverName type:(NSString*)serverQuantity
{
    self.title = serverName;
    NSString *tempServer = [[NSString alloc] initWithFormat:@"%@",serverName];
    NSString *tempQuantity = [[NSString alloc] initWithFormat:@"\n %@",serverQuantity];
    detailViewInfo.text = @"";
    NSLog(@"Testing: %@",detailViewInfo.text);
    outputText = [NSMutableString stringWithString:detailViewInfo.text];
    [outputText appendString:tempServer];
    [outputText appendString:tempQuantity];
    detailViewInfo.text = outputText;
    
}



@end
