//
//  ViewController.m
//  ExploreiOS
//
//  Created by Fazil T on 25/03/14.
//  Copyright (c) 2014 Learning. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    IBOutlet UILabel *exploreLabel;
    
}
- (IBAction)clickTheButton:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickTheButton:(id)sender{
    NSLog(@"Button clicked");
    exploreLabel.hidden = !exploreLabel.hidden;
    NSLog(@"Explore Label is %d", exploreLabel.hidden);

    NSLog(@"Log line addded from online git repository");
    NSLog(@"Log line addded from Xcode to push");


}

@end
