//
//  ViewController.m
//  Week1_TableView_Example
//
//  Created by Nicholas Weil on 8/28/12.
//  Copyright (c) 2012 Nicholas Weil. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"
#import "DetailedView.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize boxArray;
@synthesize rackArray;
@synthesize detailsViewController;


- (IBAction)clickEdit:(id)sender
{
    if (theTableView.editing == NO)
    {
        [theTableView setEditing:YES];
    }
    else
        [theTableView setEditing:NO];
}

- (void)viewDidLoad
{
    {
        boxArray = [[NSMutableArray alloc] initWithObjects:
                     @"Box One",
                     @"Box Two",
                     @"Box Three",
                     @"Box Four",
                     @"Box Five",
                     @"Box Six",
                     @"Box Seven",
                     @"Box Eight",
                     @"Box Nine",
                     @"Box Ten",
                     @"Box Eleven",
                     @"Box Twelve",
                     @"Box Thirteen",
                     @"Box Fourteen",
                     @"Box Fifteen",
                     @"Box Sixteen",
                     @"Box Seventeen",
                     @"Box Eighteen",
                     @"Box Nineteen",
                     @"Box Twenty",
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

//  Determining the COUNT of the array to establish the # of rows
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return boxArray.count;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        NSLog(@"This will delete row=%d", indexPath.row);
        [boxArray removeObjectAtIndex:indexPath.row];
        [theTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}


//  Makes the app reuse table cells once off-screen, rather than populate each one and hold it (USING DEQUEUE)
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    CustomCell *cell = [theTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:nil options:nil];
        
        for (UIView *view in views){
            if([view isKindOfClass:[CustomCell class]])
            {
                
                cell = (CustomCell*)view;
                cell.boxLabel.text = (NSString*)[boxArray objectAtIndex:indexPath.row];
                cell.rackLabel.text = (NSString*)[rackArray objectAtIndex:indexPath.row];
            }
        }
    }
    cell.boxLabel.text = (NSString*)[boxArray objectAtIndex:indexPath.row];
    cell.rackLabel.text = (NSString*)[rackArray objectAtIndex:indexPath.row];
    
    return cell;
}
    

@end
