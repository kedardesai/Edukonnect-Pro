//
//  EKPLibraryViewController.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/18/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPLibraryViewController.h"
#import "EKPSearchBookViewController.h"
#import "EKPBookListViewController.h"
#import "EKPLibraryAPI.h"


@interface EKPLibraryViewController ()

@end

@implementation EKPLibraryViewController

#pragma mark UIViewLifeCycle Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.topItem.title = @"";
    
    self.libraryMenuListArray = [[NSMutableArray alloc] initWithObjects:@"All Books", @"Search Book", @"My Books", nil];
    
    [self.libraryMenuListTableView setBackgroundView:nil];
    [self.libraryMenuListTableView setBackgroundColor:[UIColor loadScreenBackgroundColor]];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.title = @"Library";
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.libraryMenuListTableView.delegate = nil;
    self.libraryMenuListTableView = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDatasource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.libraryMenuListArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reuseIdentifier = @"libraryCell";
    UITableViewCell *cell = [self.libraryMenuListTableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    [cell setBackgroundColor:[UIColor loadScreenBackgroundColor]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UILabel *nameLabel = (UILabel *) [cell.contentView viewWithTag:100];
    [nameLabel setText:[self.libraryMenuListArray objectAtIndex:indexPath.row]];
    
    return cell;
}

#pragma mark UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *segueIdentifier;
    
    self.bookListType = indexPath.row;
    
    switch (indexPath.row) {
        case 0: // In case of All Books
            segueIdentifier = @"LibraryToBookListSegue";
            break;
            
        case 1: // In case of Search Books
            segueIdentifier = @"LibraryToSearchSegue";
            break;
            
        case 2: // In case of My Books
            segueIdentifier = @"LibraryToBookListSegue";
            break;
            
        default:
            break;
    }
    
    [self performSegueWithIdentifier:segueIdentifier sender:self];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"LibraryToBookListSegue"]) {
        // Go To Book List
        NSMutableDictionary *resultDict = [[NSMutableDictionary alloc] init];
        
        if (self.bookListType == 0) {
            resultDict = [EKPLibraryAPI getAllBooksForPageId:1];
            
        } else if (self.bookListType == 2) {
            resultDict = [EKPLibraryAPI getMyBooksForPageId:1];
        }
        
        EKPBookListViewController *bookListVC = (EKPBookListViewController *) segue.destinationViewController;
        bookListVC.bookListDict = [[NSMutableDictionary alloc] initWithDictionary:resultDict];
        bookListVC.bookListType = self.bookListType;
        bookListVC.pageId = 1;
        
    } else if ([[segue identifier] isEqualToString:@"LibraryToSearchSegue"]) {
        // Go To Search List
        EKPSearchBookViewController *searchBookVC = (EKPSearchBookViewController *) segue.destinationViewController;
        searchBookVC.bookListType = self.bookListType;
    }
}

@end
