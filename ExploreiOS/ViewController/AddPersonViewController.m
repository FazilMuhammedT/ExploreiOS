//
//  AddPersonViewController.m
//  ExploreiOS
//
//  Logic based on
//  http://www.raywenderlich.com/40293/learn-to-code-ios-apps-2-strings-arrays-objects-and-classes
//
//  Created by Fazil T on 26/03/14.
//  Copyright (c) 2014 Learning. All rights reserved.
//

#import "AddPersonViewController.h"
#import "Person.h"

@interface AddPersonViewController (){
    NSMutableArray *peopleArray;
}

@property (nonatomic, weak) IBOutlet UITextField *firsNameTextField;
@property (nonatomic, weak) IBOutlet UITextField *lastNameTextField;
@property (nonatomic, weak) IBOutlet UITextField *ageTextField;

@end

@implementation AddPersonViewController

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
    self.title = @"Add Person";
    peopleArray = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actiom Method

- (IBAction) addPerson{
    if (self.firsNameTextField.text.length==0) {
        [self.firsNameTextField becomeFirstResponder];
    } else if (self.lastNameTextField.text.length==0) {
        [self.lastNameTextField becomeFirstResponder];
    } else if (self.ageTextField.text.length==0) {
        [self.ageTextField becomeFirstResponder];
    } else{
        Person *person = [[Person alloc] init];
        [person addPersonInfo:@{@"firstName":self.firsNameTextField.text,
                                @"lastName":self.lastNameTextField.text,
                                @"age": self.ageTextField.text}];
        [peopleArray addObject:person];
        
        
    }
}

- (IBAction) listPerson{
    NSLog(@"Number of people in the database: %d", [peopleArray count]);
    for (Person *onePerson in peopleArray) {
        [onePerson printPersonInfo];
    }
    
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
