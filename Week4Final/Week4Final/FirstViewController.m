//
//  FirstViewController.m
//  Week4Final
//
//  Created by Nicholas Weil on 9/20/12.
//  Copyright (c) 2012 Nicholas Weil. All rights reserved.
//
#import "FirstViewController.h"
#import "detailViewController.h"  // Loads detailViewController for use
#import "serverDetails.h"         // Loads the serverDetails header for use

@interface FirstViewController ()

@end

@implementation FirstViewController

//  Synthesize all the variables
@synthesize detailView;
@synthesize tableViewFeed;
@synthesize request;
@synthesize connection;
@synthesize url;
@synthesize requestData;
@synthesize computers;
@synthesize numItems;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Table XML", @"Table XML");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}

- (void)viewDidLoad
{
    //  Track number of items, but reset to ZERO for start
    numItems = 0;
    computers = [[NSMutableArray alloc] init];
    
    url = [[NSURL alloc] initWithString:@"http://speedquestkarting.com/XMLParseExample.xml"];
    request = [[NSURLRequest alloc] initWithURL:url];
    
    if (request != nil)
    {
        connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        requestData = [NSMutableData data];
        NSXMLParser *dataParser = [[NSXMLParser alloc] initWithContentsOfURL:url];
        if (dataParser != nil) {
            [dataParser setDelegate:self];
            [dataParser parse];
        }
        //  NSLog(@"%@",requestData);
    }
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

//  Parsing the XML Data as it loads in from the web server
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if ([elementName isEqualToString:@"serverList"])
    {
        NSString *itemsStr = [attributeDict valueForKey:@"numItems"];
        if (itemsStr != nil)
        {
            numItems = (int *)[itemsStr intValue];
        }
    }
    else if ([elementName isEqualToString:@"item"])
    {
        NSString *name = [attributeDict valueForKey:@"Name"];
        NSString *type = [attributeDict valueForKey:@"Type"];
        serverDetails *item = [[serverDetails alloc] initWithName:name mainUse:type];
        if (item != nil)
        {
            [computers addObject:item];
        }
    }
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

//  The method to get the XML file data from a specific location
- (NSData*)GetFileDataFromFile:(NSString*)filename
{
    NSString *filePath = nil;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    filePath = [documentsDirectory stringByAppendingPathComponent:filename];
    if ([fileManager fileExistsAtPath:filePath])
    {
        return  [NSData dataWithContentsOfFile:filePath];
    }
    return nil;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    if (data != nil)
    {
        [requestData appendData:data];
    }
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *requestString = [[NSString alloc] initWithData:requestData encoding:NSASCIIStringEncoding];
    if (requestString != nil)
    {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        if (documentsDirectory !=nil)
        {
            NSString *fullPath = [[NSString alloc] initWithFormat:@"%@/%@",documentsDirectory, @"XMLParseExample.xml"];
            if (fullPath != nil)
            {
                [requestData writeToFile:fullPath atomically:true];
            }
        }
    }
}

//  Establishes the TOTAL number of items within the Table
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return computers.count;
}

//  Creating the cells for the table
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableViewFeed dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
        
    serverDetails *serverName = [computers objectAtIndex:indexPath.row];
    NSString *theUse = [serverName valueForKey:@"name"];
    NSLog(@"%@",theUse);
	cell.textLabel.text = theUse;
    
    return cell;
}


 //  Once a row is selected, this determines the row and passes the info for displaying in the detailed view
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    detailViewController *inDepthView
    = [[detailViewController alloc] initWithNibName:@"detailViewController" bundle:nil];
    [self.navigationController pushViewController:inDepthView animated:TRUE];
    serverDetails *serverXML = [computers objectAtIndex:indexPath.row];
    NSString *serverName = [serverXML valueForKey:@"name"];
    NSString *serverQuantity = [serverXML valueForKey:@"type"];
    NSLog(@"passed %@",serverName);
    NSLog(@"passed %@",serverQuantity);
    [inDepthView detailName:serverName type:serverQuantity];
    
}

@end