//
//  SecondViewController.m
//  Week4Final
//
//  Created by Nicholas Weil on 9/20/12.
//  Copyright (c) 2012 Nicholas Weil. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

@synthesize showMyXML;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Raw XML Feed", @"Raw XML Feed");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}

- (void)viewDidLoad
{
    //Create the URL
    secondURL = [[NSURL alloc] initWithString:@"http://speedquestkarting.com/XMLParseExample.xml"];
    
    secondRequest = [[NSURLRequest alloc] initWithURL:secondURL];
    if (secondRequest != nil)
    {
        secondConnection = [[NSURLConnection alloc] initWithRequest:secondRequest delegate:self];
        
        //Creates mutable data
        secondRequestData = [NSMutableData data];
    }
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    //Checks for data
    if (data != nil)
    {
        //Adds to exhisting secondRequestData
        [secondRequestData appendData:data];
    }
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *requestString = [[NSString alloc] initWithData:secondRequestData encoding:NSASCIIStringEncoding];
    if (requestString != nil)
    {
        self.showMyXML.text = [[NSString alloc] initWithFormat:@"%@", requestString];
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
