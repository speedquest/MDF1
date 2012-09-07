//
//  DetailedView.h
//  Week1_TableView_Example
//
//  Created by Nicholas Weil on 8/28/12.
//  Copyright (c) 2012 Nicholas Weil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailedView : UIViewController
{
    IBOutlet UILabel *boxNumber;
    NSString *pickedBox;
    
}

-(IBAction)onBack:(id)sender;

@property (nonatomic, retain) IBOutlet UILabel *boxNumber;
@property (nonatomic, retain) NSString *pickedBox;

-(id) selectPickedBox:(NSString *) text;


@end
