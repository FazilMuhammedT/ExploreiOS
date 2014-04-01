//
//  VehicleDetailViewController.m
//  ExploreiOS
//
//  http://www.raywenderlich.com/45940/intro-object-oriented-design-part-1
//  http://www.raywenderlich.com/45942/intro-object-oriented-design-part-2
//
//  Created by Fazil T on 01/04/14.
//  Copyright (c) 2014 Learning. All rights reserved.
//

#import "VehicleDetailViewController.h"
#import "Vehicle.h"
#import "UIAlertView+Convenience.h"

@interface VehicleDetailViewController () <UIAlertViewDelegate>
@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;
@property (nonatomic, weak) IBOutlet UIView *contentView;
@property (nonatomic, weak) IBOutlet UILabel *vehicleDetailsLabel;

@end

/*
 The Adapter design pattern converts the interface of a class into another interface that clients expect. Adapter lets classes work together that couldn’t otherwise because of incompatible interfaces. It decouples the client from the class of the targeted object.

 Protocols are the primary example of the Adapter pattern in Objective-C. This designates a number of methods that can be implemented by any class. They’re most often used for DataSource and Delegate methods, but can also be used to help two unrelated classes communicate with each other.
 
 The advantage of this pattern is that as long as a class declares that it conforms to the protocol, it really doesn’t matter whether it’s a model, a view, or a controller. It simply needs to know what is happening in the other class, and will implement any required methods needed to know about this.
 
 */
@implementation VehicleDetailViewController

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
    [self configureView];
    
}

-(void)viewDidLayoutSubviews
{
    //This method is called any time AutoLayout fires - this means it will fire when the user
    //rotates his or her device.
    [super viewDidLayoutSubviews];
    
    //Create a CGRect that contains all the subviews of the content view.
    CGRect allSubviewsFrame = CGRectZero;
    for (UIView *subview in self.contentView.subviews) {
        allSubviewsFrame = CGRectUnion(allSubviewsFrame, subview.frame);
    }
    
    //Set the scrollview content size to the width of the main view and 20 points
    //below the bottom of the CGRect that contains all the subviews so that it scrolls to the
    //appropriate point.
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, CGRectGetMaxY(allSubviewsFrame) + 20);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Managing the detail item
- (void)configureView
{
    // Update the user interface for the detail vehicle, if it exists.
    if (self.detailVehicle) {
        //Set the View Controller title, which will display in the Navigation bar.
        self.title = [self.detailVehicle vehicleTitleString];
        
        self.vehicleDetailsLabel.text = [self.detailVehicle vehicleDetailsString];
    }
}

#pragma mark - Action Methods

-(IBAction)turn
{
    //Create an alert view with a single text input to capture the number of degrees
    //to turn your vehicle. Set this class as the delegate so one of the delegate methods
    //can retrieve what the user entered.
    UIAlertView *turnEntryAlertView = [[UIAlertView alloc] initWithTitle:@"Turn" message:@"Enter number of degrees to turn:" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Go!", nil];
    turnEntryAlertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    [[turnEntryAlertView textFieldAtIndex:0] setKeyboardType:UIKeyboardTypeNumberPad];
    [turnEntryAlertView show];
}

-(IBAction)goForward
{
    [UIAlertView showSimpleAlertWithTitle:@"Go Forward" andMessage:[self.detailVehicle goForward]];
}

-(IBAction)goBackward
{
    [UIAlertView showSimpleAlertWithTitle:@"Go Backward" andMessage:[self.detailVehicle goBackward]];
}

-(IBAction)stopMoving
{
    [UIAlertView showSimpleAlertWithTitle:@"Stop Moving" andMessage:[self.detailVehicle stopMoving]];
}

-(IBAction)makeNoise
{
    [UIAlertView showSimpleAlertWithTitle:@"Make Some Noise!" andMessage:[self.detailVehicle makeNoise]];
}

#pragma mark - UIAlertViewDelegate method
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //Note: Only one alert view will actually declare this class its delegate, so we can
    //      proceed without double-checking the alert view instance. If you have more than
    //      one alert view using the same class as its delegate, make sure you check which
    //      UIAlertView object is calling this delegate method.
    if (buttonIndex != alertView.cancelButtonIndex) {
        //Get the text the user input in the text field
        NSString *degrees = [[alertView textFieldAtIndex:0] text];
        
        //Convert it from a string to an integer
        NSInteger degreesInt = [degrees integerValue];
        
        //Use the simple alert view to display the information for turning.
        [UIAlertView showSimpleAlertWithTitle:@"Turn" andMessage:[self.detailVehicle turn:degreesInt]];
    } //else the user has cancelled, and we don't need to do anything.
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
