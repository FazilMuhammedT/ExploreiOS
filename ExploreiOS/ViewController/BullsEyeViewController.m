//
//  BullsEyeViewController.m
//  ExploreiOS
//
//  iOS Apprentice series from raywenderlich.com/ios-apprentice by Matthijs Hollemans
//  v1.4 (14 Aug 2012) - Base Code
//
//  Created by Fazil T on 26/03/14.
//  Copyright (c) 2014 Learning. All rights reserved.
//

#import "BullsEyeViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface BullsEyeViewController ()<UIAlertViewDelegate>
@property (nonatomic, weak) IBOutlet UISlider *slider;
@property (nonatomic, weak) IBOutlet UILabel *targetLabel;
@property (nonatomic, weak) IBOutlet UILabel *scoreLabel;
@property (nonatomic, weak) IBOutlet UILabel *roundLabel;

@property (nonatomic, weak) IBOutlet UIView *aboutView;
@property (nonatomic, strong) IBOutlet UIWebView *webView;

@end

@implementation BullsEyeViewController{
    int currentValue;
    int targetValue;
    int score;
    int round;

}

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
    // Do any additional setup after loading the view.
    self.title = @"Bull's Eye";
    
    //Slider UI Settings
    UIImage *thumbImageNormal = [UIImage imageNamed:@"BullsEye-SliderThumb-Normal"];
    [self.slider setThumbImage:thumbImageNormal forState:UIControlStateNormal];
    
    UIImage *thumbImageHighlighted = [UIImage imageNamed:@"BullsEye-SliderThumb-Highlighted"];
    [self.slider setThumbImage:thumbImageHighlighted forState:UIControlStateHighlighted];
    
    UIImage *trackLeftImage = [[UIImage imageNamed:@"BullsEye-SliderTrackLeft"] stretchableImageWithLeftCapWidth:14 topCapHeight:0];
    [self.slider setMinimumTrackImage:trackLeftImage forState:UIControlStateNormal];
    
    UIImage *trackRightImage = [[UIImage imageNamed:@"BullsEye-SliderTrackRight"] stretchableImageWithLeftCapWidth:14 topCapHeight:0];
    [self.slider setMaximumTrackImage:trackRightImage forState:UIControlStateNormal];
    
    //Webview Logic
    NSString *htmlFile = [[NSBundle mainBundle] pathForResource:@"BullsEye" ofType:@"html"];
    NSData *htmlData = [NSData dataWithContentsOfFile:htmlFile];
    NSURL *baseURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
    [self.webView loadData:htmlData MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:baseURL];

    [self startNewGame];
    [self updateLabels];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}


#pragma mark - Action Method

- (IBAction) showAlert
{
    int difference = abs(targetValue - currentValue);
    int points = 100 - difference;
    
    NSString *title;
    if (difference == 0) {
        title = @"Perfect!";
        points += 100;
    } else if (difference < 5) {
        title = @"You almost had it!";
        if (difference == 1) {
            points += 50;
        }
    } else if (difference < 10) {
        title = @"Pretty good!";
    } else {
        title = @"Not even close...";
    }
    score += points;
    NSString *message = [NSString stringWithFormat:@"You scored %d points", points];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
    
    [alertView show];
}

- (IBAction) sliderMoved:(UISlider *) slider
{
    currentValue = lroundf(slider.value);
    NSLog(@"The value of the slider is now: %d", currentValue);
}

- (IBAction) startOver
{
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionFade;
    transition.duration = 1;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    [self startNewGame];
    [self updateLabels];
    
    [self.view.layer addAnimation:transition forKey:nil];
}

- (IBAction) infoButton{
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionFromTop;
    transition.duration = 1;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];

    self.aboutView.hidden = NO;

    [self.view.layer addAnimation:transition forKey:nil];
}

- (IBAction) closeButton{
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionFromBottom;
    transition.duration = 1;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    

    self.aboutView.hidden = YES;
    [self.view.layer addAnimation:transition forKey:nil];

}

#pragma mark - Alert View Delegate

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self startNewRound];
    [self updateLabels];
}

#pragma mark - Logical Methods

- (void)startNewRound
{
    round += 1;
    targetValue = 1 + (arc4random() % 100);
    
    currentValue = 50;
    self.slider.value = currentValue;
}

- (void)startNewGame
{
    score = 0;
    round = 0;
    [self startNewRound];
}

- (void)updateLabels
{
    self.targetLabel.text = [NSString stringWithFormat:@"%d", targetValue];
    self.scoreLabel.text = [NSString stringWithFormat:@"%d", score];
    self.roundLabel.text = [NSString stringWithFormat:@"%d", round];

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

/* To do list - iOS Apprentice - Bull's Eye Game 
 
 - Put a button on the screen and label it “Hit Me!”.
 - When the player presses the Hit Me button the app has to show an alert popup to inform the player how well he did. Somehow we have to calculate the score and put that into this alert.
 - Put text on the screen, such as the “Score:” and “Round:” labels. Some of this text changes over time, such as the score, which increases when the player finishes a round.
 - Put a slider on the screen and make it go between the values 1 and 100.
 - Read the value of the slider after the user presses the Hit Me button.
 - Generate a random number at the start of each round and display it on the screen. This is the target value.
 - Compare the value of the slider to that random number and calculate a score based on how far off the player is. We show this score in the alert view.
 - Put the Start Over button on the screen. Make it reset the score and put the player back into the first round.
 - Put the app in landscape orientation.
 - Make it look pretty. :-)
 
 */

/*
 File’s Owner
 A xib, the user interface of a view controller, is owned by that view controller. This means the view controller will load that xib file, put all of its objects on the screen, and make the connections. The view controller will dispose of the xib file when the screen closes. File’s Owner, therefore, refers to the view controller object.
 */

/*
 
 The complete set of frameworks for iOS is known collectively as Cocoa Touch.
 
 */
@end
