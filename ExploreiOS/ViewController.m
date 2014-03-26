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
    IBOutlet UILabel *resultLabel;
    IBOutlet UILabel *trialLabel;

    IBOutlet UITextField *numberTextField;

    
    //Guess Number
    int answer;
    int guess;
    int turn;
    
}
- (IBAction) clickTheButton:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    answer = 0;
    guess = 0;
    turn = 0;
    
    answer = arc4random()%100 + 1;

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

}

//Logic to Guess the number taken from
//http://www.raywenderlich.com/38557/learn-to-code-ios-apps-1-welcome-to-programming

- (IBAction) checkTheNumberButton:(id)sender{
    guess = numberTextField.text.integerValue;
        if(guess > answer){
            resultLabel.text = @"Guess a Lower Value!";
            numberTextField.text = @"";
            [numberTextField resignFirstResponder];
        }
        else if(guess < answer){
            resultLabel.text = @"Guess a Higher Value!";
            numberTextField.text = @"";
            [numberTextField resignFirstResponder];
        }
        else{
            resultLabel.text = [NSString stringWithFormat:@"Correct! The answer was %i",answer];
            [numberTextField resignFirstResponder];
        }
    trialLabel.text =[NSString stringWithFormat:@"Trial Taken %i",++turn];
}

@end
