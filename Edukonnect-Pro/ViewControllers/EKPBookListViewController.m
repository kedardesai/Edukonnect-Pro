//
//  EKPBookListViewController.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/19/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPBookListViewController.h"
#import "EKPLibraryAPI.h"
#import "EKPBook.h"

@interface EKPBookListViewController ()

- (void)callAPI;
- (void)parseData;

@end

@implementation EKPBookListViewController

#pragma mark UIViewLifeCycle Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.topItem.title = @"";
    
    self.bookListArray = [[NSMutableArray alloc] init];
    
    [self.bookListTableView setBackgroundView:nil];
    [self.bookListTableView setBackgroundColor:[UIColor loadScreenBackgroundColor]];
    [self.bookListTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.isNextPageAvailable = YES;
    self.isFirstLoad = YES;
    [self parseData];
}

- (void)viewWillAppear:(BOOL)animated
{
    switch (self.bookListType) {
        case 0:
            self.title = @"Book List";
            break;
            
        case 1:
            self.title = @"Searched Books";
            break;
            
        case 2:
            self.title = @"My Books";
            break;
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Code-Reusable Methods

- (void)callAPI
{
    if (self.isNextPageAvailable) {
        self.pageId++;
        
        // Call API
        switch (self.bookListType) {
            case 0: // All Book List
                self.bookListDict = [EKPLibraryAPI getAllBooksForPageId:self.pageId];
                break;
                
            case 1: // Searched Book List
                self.bookListDict = [EKPLibraryAPI getBooksForKeyword:self.searchKeyword andForPageId:self.pageId];
                break;
                
            case 2: // My Book List
                self.bookListDict = [EKPLibraryAPI getMyBooksForPageId:self.pageId];
                break;
                
            default:
                break;
        }
        
        [self parseData];
    }
}

- (void)parseData
{
    NSMutableArray *bookArray = [[self.bookListDict objectForKey:LIBRARY_API_TAG] mutableCopy];
    for (NSMutableDictionary *bookDict in bookArray) {
        EKPBook *bookTemp = [[EKPBook alloc] init];
        bookTemp.bookAuthor = [bookDict objectForKey:LIBRARY_API_AUTHOR];
        bookTemp.bookCategory = [bookDict objectForKey:LIBRARY_API_CATEGORY];
        bookTemp.bookClassId = [bookDict objectForKey:LIBRARY_API_CLASS_ID];
        bookTemp.bookDesc = [bookDict objectForKey:LIBRARY_API_DESC];
        bookTemp.bookId = [bookDict objectForKey:LIBRARY_API_ID];
        bookTemp.bookName = [bookDict objectForKey:LIBRARY_API_NAME];
        
        [self.bookListArray addObject:bookTemp];
    }
    
    self.isNextPageAvailable = [[self.bookListDict objectForKey:LIBRARY_API_NEXT_PAGE] boolValue];
    
    [self.bookListTableView reloadData];
}

#pragma mark UITableViewDatasource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.bookListArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reuseIdentifier = @"bookCell";
    
    UITableViewCell *cell = [self.bookListTableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setBackgroundColor:[UIColor loadScreenBackgroundColor]];
    
    EKPBook *bookTemp = [self.bookListArray objectAtIndex:indexPath.row];
    
    UIView *contentView = [cell.contentView viewWithTag:100];
    
    UILabel *nameLabel = (UILabel *) [contentView viewWithTag:101];
    [nameLabel setText:bookTemp.bookName];
    
    UILabel *categoryLabel = (UILabel *) [contentView viewWithTag:103];
    [categoryLabel setText:bookTemp.bookCategory];
    
    UILabel *authorLabel = (UILabel *) [contentView viewWithTag:105];
    [authorLabel setText:bookTemp.bookAuthor];
    
    UITextView *descTextView = (UITextView *) [contentView viewWithTag:106];
    [descTextView setText:bookTemp.bookDesc];
    [descTextView setTextColor:[UIColor whiteColor]];
    
    return cell;
}


#pragma mark UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ((scrollView.contentOffset.y + scrollView.frame.size.height) >= scrollView.contentSize.height)
    {
        if (!self.isFirstLoad) {
            [self callAPI];
        }
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
