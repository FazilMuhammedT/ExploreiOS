//
//  TapMeViewController.m
//  ExploreiOS
//
//  Refer the below link for the tutorial
//  http://www.raywenderlich.com/25561/learn-to-code-ios-apps-3-your-first-app
//  http://www.raywenderlich.com/27191/learn-to-code-ios-apps-4-making-it-beautiful
//
//  Created by Fazil T on 31/03/14.
//  Copyright (c) 2014 Learning. All rights reserved.
//

#import "TapMeViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface TapMeViewController ()<UIAlertViewDelegate>{
    IBOutlet UILabel *scoreLabel;
    IBOutlet UILabel *timerLabel;
    
    // Add the next three lines
    NSInteger count;
    NSInteger seconds;
    NSTimer *timer;

    // Add these AVAudioPlayer objects!
    AVAudioPlayer *buttonBeep;
    AVAudioPlayer *secondBeep;
    AVAudioPlayer *backgroundMusic;

}

@end

@implementation TapMeViewController

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
    self.title = @"Tap Me";
    //self.view.backgroundColor = [UIColor purpleColor]; // ADD THIS!!
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"TapMe-bg_tile"]];
    scoreLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"TapMe-field_score.png"]];
    timerLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"TapMe-field_time.png"]];

    buttonBeep = [self setupAudioPlayerWithFile:@"ButtonTap" type:@"wav"];
    secondBeep = [self setupAudioPlayerWithFile:@"SecondBeep" type:@"wav"];
    backgroundMusic = [self setupAudioPlayerWithFile:@"HallOfTheMountainKing" type:@"mp3"];

    [self setupGame];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Action Method

- (IBAction)buttonPressed {
    count++;
    
    scoreLabel.text = [NSString stringWithFormat:@"Score %i", count];
    [buttonBeep play];

}

#pragma mark - Logical Methods

- (void)setupGame {
    // 1
    seconds = 30;
    count = 0;
    
    // 2
    timerLabel.text = [NSString stringWithFormat:@"Time: %i", seconds];
    scoreLabel.text = [NSString stringWithFormat:@"Score %i", count];
    
    // 3
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                             target:self
                                           selector:@selector(subtractTime)
                                           userInfo:nil
                                            repeats:YES];
    [backgroundMusic setVolume:0.3];
    [backgroundMusic play];

}

- (void)subtractTime {
    // 1
    seconds--;
    timerLabel.text = [NSString stringWithFormat:@"Time: %i",seconds];
    [secondBeep play];

    // 2
    if (seconds == 0) {
        [timer invalidate];
        
        // new code is here!
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Time is up!"
                                                        message:[NSString stringWithFormat:@"You scored %i points", count]
                                                       delegate:self
                                              cancelButtonTitle:@"Cancel"
                                              otherButtonTitles:@"Play Again", nil];
        
        [alert show];
    }
}

#pragma mark - Alert View Delegate Method

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        [self setupGame];
    }
}

#pragma mark - Set Audio Player

- (AVAudioPlayer *)setupAudioPlayerWithFile:(NSString *)file type:(NSString *)type
{
    // 1 tell you where in the project to look
    // AVAudioPlayer needs to know the path in the form of a URL, so the full path is converted to URL format.
    NSString *path = [[NSBundle mainBundle] pathForResource:file ofType:type];
    NSURL *url = [NSURL fileURLWithPath:path];
    
    // 2 A NSError object will store an error message if something goes wrong when setting up the AVAudioPlayer
    NSError *error;
    
    // 3 You’re passing in the URL, and the error will get filled in if something goes wrong.
    AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    
    // 4 If something goes wrong, the audioPlayer will be set to nil, which you can check for with the exclamation mark symbol
    if (!audioPlayer) {
        NSLog(@"%@",[error description]);
    }
    
    // 5 If all goes well, the AVAudioPlayer object will be returned!
    return audioPlayer;
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
