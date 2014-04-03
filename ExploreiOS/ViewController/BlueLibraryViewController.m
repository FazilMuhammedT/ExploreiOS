//
//  BlueLibraryViewController.m
//  ExploreiOS
//
//  http://www.raywenderlich.com/46988/ios-design-patterns
//
//  Created by Fazil T on 03/04/14.
//  Copyright (c) 2014 Learning. All rights reserved.
//

#import "BlueLibraryViewController.h"
#import "LibraryAPI.h"
#import "Album+TableRepresentation.h"
#import "HorizontalScroller.h"
#import "AlbumView.h"

@interface BlueLibraryViewController ()<UITableViewDataSource, UITableViewDelegate, HorizontalScrollerDelegate> {
    UITableView *dataTable;
    NSArray *allAlbums;
    NSDictionary *currentAlbumData;
    int currentAlbumIndex;
    
    HorizontalScroller *scroller;

}

@end

@implementation BlueLibraryViewController

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
    // 1 Change the background color to a nice navy blue color
    self.view.backgroundColor = [UIColor colorWithRed:0.76f green:0.81f blue:0.87f alpha:1];
    currentAlbumIndex = 0;
    
    //2 Get a list of all the albums via the API
    allAlbums = [[LibraryAPI sharedInstance] getAlbums];
    
    // 3 This is where you create the UITableView.
    // the uitableview that presents the album data
    dataTable = [[UITableView alloc] initWithFrame:CGRectMake(10, 220, self.view.frame.size.width-20, self.view.frame.size.height-340) style:UITableViewStylePlain];
    dataTable.delegate = self;
    dataTable.dataSource = self;
    dataTable.backgroundView = nil;
    [self.view addSubview:dataTable];
    
    scroller = [[HorizontalScroller alloc] initWithFrame:CGRectMake(0, 80, self.view.frame.size.width, 120)];
    scroller.backgroundColor = [UIColor colorWithRed:0.24f green:0.35f blue:0.49f alpha:1];
    scroller.delegate = self;
    [self.view addSubview:scroller];
    
    [self reloadScroller];
    
    [self showDataForAlbumAtIndex:currentAlbumIndex];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showDataForAlbumAtIndex:(int)albumIndex
{
    // defensive code: make sure the requested index is lower than the amount of albums
    if (albumIndex < allAlbums.count)
    {
    	// fetch the album
        Album *album = allAlbums[albumIndex];
        // save the albums data to present it later in the tableview
        currentAlbumData = [album trTableRepresentation];
    }
    else
    {
        currentAlbumData = nil;
    }
    
    // we have the data we need, let's refresh our tableview
    [dataTable reloadData];
}

#pragma mark - Table View Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [currentAlbumData[@"titles"] count];
    //return 4;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = currentAlbumData[@"titles"][indexPath.row];
    cell.detailTextLabel.text = currentAlbumData[@"values"][indexPath.row];
    
    return cell;
}

#pragma mark - HorizontalScrollerDelegate methods
- (void)horizontalScroller:(HorizontalScroller *)scroller clickedViewAtIndex:(int)index
{
    currentAlbumIndex = index;
    [self showDataForAlbumAtIndex:index];
}

- (NSInteger)numberOfViewsForHorizontalScroller:(HorizontalScroller*)scroller
{
    return allAlbums.count;
}
- (UIView*)horizontalScroller:(HorizontalScroller*)scroller viewAtIndex:(int)index
{
    Album *album = allAlbums[index];
    return [[AlbumView alloc] initWithFrame:CGRectMake(0, 0, 100, 100) albumCover:album.coverUrl];
}

- (void)reloadScroller
{
    allAlbums = [[LibraryAPI sharedInstance] getAlbums];
    if (currentAlbumIndex < 0) currentAlbumIndex = 0;
    else if (currentAlbumIndex >= allAlbums.count) currentAlbumIndex = allAlbums.count-1;
    [scroller reload];
    
    [self showDataForAlbumAtIndex:currentAlbumIndex];
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
