//
//  FirstViewController.m
//  Week 2
//
//  Created by Nicholas Weil on 9/4/12.
//  Copyright (c) 2012 Nicholas Weil. All rights reserved.
//

#import "FirstViewController.h"
#import "WarehouseProtocolController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Home", @"Home");
        self.tabBarItem.image = [UIImage imageNamed:@"Home_24"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
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

/*//  Warehouse Protocols Button Action
- (IBAction)onClick:(id)sender
{
     WarehouseProtocolController *protocolView = [[WarehouseProtocolController alloc] initWithNibName:@"WarehouseProtocolController" bundle:nil];
    if (protocolView != nil)
    //  Moves the view to the WarehouseProtocalController.xib
    {
        // [self.navigationController pushViewController:protocolView animated:true];
        [self presentModalViewController:protocolView animated:TRUE];  // Animates the view change to a Modal view change

    }
     
}
*/

//  Brings up the Warehouse Protocols View
- (IBAction)onClick:(id)sender
{
    WarehouseProtocolController *warehouseView = [[WarehouseProtocolController alloc] initWithNibName:@"WarehouseProtocolController" bundle:nil];
    if (warehouseView != nil)
    {
        [self.navigationController pushViewController:warehouseView animated:true];
    }
}
@end
