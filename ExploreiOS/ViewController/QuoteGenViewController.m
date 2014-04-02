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
@property (nonatomic, strong) IBOutlet UISegmentedControl *quoteOpt;

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
    
    // 2 - Load movie quotes
    NSString *quotesPlistPath = [[NSBundle mainBundle] pathForResource:@"Quotes" ofType:@"plist"];
    self.movieQuotes= [NSMutableArray arrayWithContentsOfFile:quotesPlistPath];
    [self quoteButtonTapped:nil];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Action Methods

-(IBAction)quoteButtonTapped:(id)sender {
    
    if (self.quoteOpt.selectedSegmentIndex == 2) {
        // 1 - Get number of rows in array
        int arrayTotal = [self.myQuotes count];
        // 2 - Get random index
        int index = (arc4random() % arrayTotal);
        // 3 - Get the quote string for the index
        NSString *myQuote = self.myQuotes[index];
        // 4 - Display the quote in the text view
        self.quoteText.text = [NSString stringWithFormat:@"Quote:\n\n%@",  myQuote];
        
        //To display all the quote
        // 1.2 - Initialize string for concatenated quotes
        NSString *allMyQuotes = @"";
        NSString *my_quote = nil;
        // 1.3 - Iterate through array
        for (int x=0; x < arrayTotal; x++) {
            my_quote = self.myQuotes[x];
            allMyQuotes = [NSString stringWithFormat:@"%@\n%@\n",  allMyQuotes,my_quote];
        }
        self.quoteText.text = [NSString stringWithFormat:@"%@", allMyQuotes];

    } // 2 - Get movie quotes
    else {
        // 2.1 - determine category
        NSString *selectedCategory = @"classic";
        if (self.quoteOpt.selectedSegmentIndex == 1) {
            selectedCategory = @"modern";
        }
        // 2.2 - filter array by category using predicate
        // A predicate is a useful object that filters an array. It’s a bit like having a select with a simple where clause in SQL
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"category == %@", selectedCategory];
        NSArray *filteredArray = [self.movieQuotes filteredArrayUsingPredicate:predicate];
        // 2.3 - get total number in filtered array
        int arrayTotal = [filteredArray count];
        // 2.4 - as a safeguard only get quote when the array has rows in it
        if (arrayTotal > 0) {
            // 2.5 - get random index
            int index = (arc4random() % arrayTotal);
            // 2.6 - get the quote string for the index
            NSString *quote = filteredArray[index][@"quote"];
            // 2.7 - Check if there is a source
            //NSString *source = [[filteredArray objectAtIndex:index] valueForKey:@"source"];
            NSString *source = filteredArray[index] [@"source"];
            if (![source length] == 0) {
                quote = [NSString stringWithFormat:@"%@\n\n(%@)",  quote, source];
            }
            // 2.8 - Customize quote based on category
            if ([selectedCategory isEqualToString:@"classic"]) {
                quote = [NSString stringWithFormat:@"From Classic Movie\n\n%@",  quote];
            } else {
                quote = [NSString stringWithFormat:@"Movie Quote:\n\n%@",  quote];
            }
            // 2.9 - Display quote
            self.quoteText.text = quote;
            
            // 2.10 - Update row to indicate that it has been displayed
            int movieArrayTotal = [self.movieQuotes count];
            NSString *quote1 = filteredArray[index][@"quote"];
            for (int x=0; x < movieArrayTotal; x++) {
                NSString *quote2 = self.movieQuotes[x][@"quote"];
                if ([quote1 isEqualToString:quote2]) {
                    NSMutableDictionary *itemAtIndex = (NSMutableDictionary *)self.movieQuotes[x];
                    itemAtIndex[@"source"] = @"DONE";
                }
            }
            
        } else {
            self.quoteText.text = [NSString stringWithFormat:@"No quotes to display."];
        }
    }
}

-(IBAction)movieQuoteButtonTapped:(id)sender {
    // 1 - Get number of rows in array
    int arrayTotal = [self.movieQuotes count];
    // 2 - Get random index
    int index = (arc4random() % arrayTotal);
    // 3 - Get the quote string for the index
    NSString *movieQuote = self.movieQuotes[index][@"quote"];
    // 4 - Display the quote in the text view
    self.quoteText.text = [NSString stringWithFormat:@"Quote:\n\n%@",  movieQuote];
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
