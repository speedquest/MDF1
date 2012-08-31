//
//  DetailedViewController.m
//  Week1_TableView_Example
//
//  Created by Nicholas Weil on 8/28/12.
//  Copyright (c) 2012 Nicholas Weil. All rights reserved.
//

#import "DetailedView.h"
#import "ViewController.h"

@interface DetailedView ()

@end

@implementation DetailedView
@synthesize boxNumber;
@synthesize pickedBox;

-(id) selectPickedBox:(NSString *)text
{
    self.pickedBox = text;
    [boxNumber setText:[self pickedBox]];
    return self;
}



-(void)viewDidLoad
{
    [boxNumber setText:[self pickedBox]];
    self.title = @"The boxes are!";
    [super viewDidLoad];
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

-(IBAction)onBack:(id)sender
{
    [self dismissModalViewControllerAnimated:TRUE];
}
@end
