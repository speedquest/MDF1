//
//  SecondViewController.m
//  Week 2
//
//  Created by Nicholas Weil on 9/4/12.
//  Copyright (c) 2012 Nicholas Weil. All rights reserved.
//

#import "SecondViewController.h"
#import "DetailedView.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

@synthesize boxArray;
@synthesize rackArray;
@synthesize detailsViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Examine", @"Examine");
        self.tabBarItem.image = [UIImage imageNamed:@"magnifier_24"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    //  Establishing the Array details
    {
        boxArray = [[NSMutableArray alloc] initWithObjects:
                    @"Box 1",
                    @"Box 2",
                    @"Box 3",
                    @"Box 4",
                    @"Box 5",
                    @"Box 6",
                    @"Box 7",
                    @"Box 8",
                    @"Box 9",
                    @"Box 10",
                    @"Box 11",
                    @"Box 12",
                    @"Box 13",
                    @"Box 14",
                    @"Box 15",
                    @"Box 16",
                    @"Box 17",
                    @"Box 18",
                    @"Box 19",
                    @"Box 20",
                    nil];
        rackArray = [[NSMutableArray alloc] initWithObjects:
                     @"Rack 14",
                     @"Rack 10",
                     @"Rack 12",
                     @"Rack 1",
                     @"Rack 2",
                     @"Rack 3",
                     @"Rack 5",
                     @"Rack 23",
                     @"Rack 7",
                     @"Rack 2",
                     @"Rack 1",
                     @"Rack 5",
                     @"Rack, 2",
                     @"Rack 14",
                     @"Rack 3",
                     @"Rack 10",
                     @"Rack 12",
                     @"Rack 9",
                     @"Rack 3",
                     @"Rack 17",
                     nil];
    }
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



//  Makes the app reuse table cells once off-screen, rather than populate each one and hold it (USING DEQUEUE)
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    //  Uses the iOS library Dequeue to reassign visible table cells
    UITableViewCell *cell = [theTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        /*
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"UITableViewCell" owner:nil options:nil];
        
        for (UIView *view in views){
            if([view isKindOfClass:[UITableViewCell class]])
            {
                cell = (UITableViewCell*)view;
                cell.boxLabel.text = (NSString*)[boxArray objectAtIndex:indexPath.row];
                cell.rackLabel.text = (NSString*)[rackArray objectAtIndex:indexPath.row];
            }
        }
         */
    }
    cell.textLabel.text = (NSString*)[boxArray objectAtIndex:indexPath.row];
    // cell.rackLabel.text = (NSString*)[rackArray objectAtIndex:indexPath.row];
    
    return cell;
}

//  Determining the COUNT of the array to establish the # of rows
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return boxArray.count;
}

//  Editing the Array and it's contents
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [boxArray removeObjectAtIndex:indexPath.row];
        [theTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}


//  Function to Display the Details View

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //  Assigning temp variables to the actual Array info for manipulation
    NSString *boxPicked = [boxArray objectAtIndex:[indexPath row]];
    NSString *rackPicked = [rackArray objectAtIndex:[indexPath row]];
    //  This will merge the two strings for display
    NSString *mergeBoxRack = [[NSString alloc] initWithFormat: @"%@ \n \n %@", boxPicked, rackPicked];
    
    //  Actually showing the Details View
    if (self.detailsViewController == nil)
    {
        DetailedView *theDetailedView = [[DetailedView alloc]initWithNibName:@"DetailedView" bundle:nil];
        self.detailsViewController = theDetailedView;
    }
    
    //  Sending the combined string (Box, Rack) to the Details View and displaying it
    [self.detailsViewController selectPickedBox:mergeBoxRack];
    [self presentModalViewController:detailsViewController animated:TRUE];  // Animates the view change to a Modal view change

    
}


@end
