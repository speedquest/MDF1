//
//  WarehouseProtocolController.m
//  Week 2
//
//  Created by Nicholas Weil on 9/7/12.
//  Copyright (c) 2012 Nicholas Weil. All rights reserved.
//

#import "WarehouseProtocolController.h"
#import "FirstViewController.h"
@interface WarehouseProtocolController ()

@end

@implementation WarehouseProtocolController

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

/*THIS BREAKS MY TAB BAR!!!!   AAARGH!!!!
 
 - (IBAction)onClick:(id)sender
{
    FirstViewController *firstView = [[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil];
    if (firstView != nil)
        //  Moves the view to the FirstViewController.xib
    {
        [self presentModalViewController:firstView animated:TRUE];  // Animates the view change to a Modal view change
        
    }
    
}
 */
@end
