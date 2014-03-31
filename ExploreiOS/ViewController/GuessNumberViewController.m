//
//  GuessNumberViewController.m
//  ExploreiOS
//
//  Logic to Guess the number taken from
//  http://www.raywenderlich.com/38557/learn-to-code-ios-apps-1-welcome-to-programming//
//
//  Created by Fazil T on 26/03/14.
//  Copyright (c) 2014 Learning. All rights reserved.
//

#import "GuessNumberViewController.h"

@interface GuessNumberViewController (){
    IBOutlet UILabel *resultLabel;
    IBOutlet UILabel *trialLabel;
    
    IBOutlet UITextField *numberTextField;
    
    
    //Guess Number
    int answer;
    int guess;
    int turn;
    

}

@end

@implementation GuessNumberViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return UIInterfaceOrientationIsPortrait(interfaceOrientation);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.title = @"Guess the Number";

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
