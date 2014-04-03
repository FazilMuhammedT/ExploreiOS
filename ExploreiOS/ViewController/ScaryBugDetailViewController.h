//
//  ScaryBugDetailViewController.h
//  ExploreiOS
//
//  http://www.raywenderlich.com/1845/ios-tutorial-how-to-create-a-simple-iphone-app-tutorial-part-2
//
//  Created by Fazil T on 03/04/14.
//  Copyright (c) 2014 Learning. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RateView.h"

@class ScaryBugDoc;

@interface ScaryBugDetailViewController : UIViewController <UITextFieldDelegate, RateViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) ScaryBugDoc *detailItem;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet RateView *rateView;
@property (strong, nonatomic) UIImagePickerController *picker;

- (IBAction)addPictureTapped:(UIButton *)sender;
- (IBAction)titleFieldTextChanged:(UITextField *)sender;

@end
