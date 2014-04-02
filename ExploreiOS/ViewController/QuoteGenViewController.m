//
//  QuoteGenViewController.m
//  ExploreiOS
//
//  http://www.raywenderlich.com/21320/objectively-speaking-a-crash-course-in-objective-c-ios6
//
//  Created by Fazil T on 02/04/14.
//  Copyright (c) 2014 Learning. All rights reserved.
//

#import "QuoteGenViewController.h"

@interface QuoteGenViewController ()
@property (nonatomic, strong) NSArray *myQuotes;
@property (nonatomic, strong) NSMutableArray *movieQuotes;
/*
 Property attributes. Without going too deeply into this topic – the nonatomic attribute increases performance at the cost of thread-safety, and the strong attribute indicates that a pointer to the specified variable will stay in memory as long as the object that holds the pointer exists.
 Type of the property. Here you choose NSArray *, which means “pointer to an NSArray class.” NSArray is a handy class provided by Apple that stores lists of data – we’ll talk more about this soon.
 */

@property (nonatomic, weak) IBOutlet UITextView *quoteText;

@end

@implementation QuoteGenViewController

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
    
    self.title = @"Quote Gen";
    
    // 1 - Add array of personal quotes
    self.myQuotes = @[
                      @"Live and let live",
                      @"Don't cry over spilt milk",
                      @"Always look on the bright side of life",
                      @"Nobody's perfect",
                      @"Can't see the woods for the trees",
                      @"Better to have loved and lost then not loved at all",
                      @"The early bird catches the worm",
                      @"As slow as a wet week"
                      ];
    [self quoteButtonTapped:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Action Methods
-(IBAction)quoteButtonTapped:(id)sender {
    // 1 - Get number of rows in array
    int arrayTotal = [self.myQuotes count];
    // 2 - Get random index
    int index = (arc4random() % arrayTotal);
    // 3 - Get the quote string for the index
    NSString *myQuote = self.myQuotes[index];
    // 4 - Display the quote in the text view
    self.quoteText.text = [NSString stringWithFormat:@"Quote:\n\n%@",  myQuote];
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
