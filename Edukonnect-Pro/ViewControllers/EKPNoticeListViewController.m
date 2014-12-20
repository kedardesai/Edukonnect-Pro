//
//  EKPNoticeListViewController.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/7/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPNoticeListViewController.h"
#import "EKPNoticeAPI.h"
#import "EKPNotice.h"

@interface EKPNoticeListViewController ()

- (void)callAPI;

@end

@implementation EKPNoticeListViewController

#pragma mark UIViewLifeCycle Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.topItem.title = @"";
    
    self.noticeListArray = [[NSMutableArray alloc] init];
    
    [self.noticeListTableView setBackgroundView:nil];
    [self.noticeListTableView setBackgroundColor:[UIColor loadScreenBackgroundColor]];
    [self.noticeListTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.pageId = 0;
    self.isNextPageAvailable = YES;
    self.isFirstLoad = YES;
    [self callAPI];
    
    [self.noticeListTableView setFrame:self.view.frame];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.title = [NSString stringWithFormat:@"Notice List"];
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.noticeListTableView.delegate = nil;
    self.noticeListTableView = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark Reusable-Code Methods

- (void)callAPI
{
    if (self.isNextPageAvailable) {
        self.pageId++;
        NSMutableDictionary *resultDict = [EKPNoticeAPI getNoticesForPageId:self.pageId];
        NSMutableArray *noticeArray = [[resultDict objectForKey:NOTICEBOARD_API_NOTICE] mutableCopy];
        for (NSMutableDictionary *noticeDict in noticeArray) {
            EKPNotice *noticeTemp = [[EKPNotice alloc] init];
            noticeTemp.noticeId = [noticeDict objectForKey:NOTICEBOARD_API_NOTICE_ID];
            noticeTemp.noticeHeading = [noticeDict objectForKey:NOTICEBOARD_API_HEADING];
            noticeTemp.noticeMessage = [noticeDict objectForKey:NOTICEBOARD_API_MESSAGE_DETAILS];
            noticeTemp.noticeTimeStamp = [noticeDict objectForKey:NOTICEBOARD_API_TIME_STAMP];
            
            [self.noticeListArray addObject:noticeTemp];
        }
        
        if (self.pageId == 1) {
            // Save Notice List in Singleton
            [EKPSingleton saveNoticeList:self.noticeListArray];
        }
        self.isNextPageAvailable = [[resultDict objectForKey:NOTICEBOARD_API_NEXT_PAGE] boolValue];
        
        [self.noticeListTableView reloadData];
    }
}


#pragma mark UITableViewDelegate and UITableViewDatasource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.noticeListArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"noticeCell"];
    
    if (!cell) {
        cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"noticeCell"];
    }
    
    self.isFirstLoad = NO;
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [cell setBackgroundColor:[UIColor loadScreenBackgroundColor]];
    
    EKPNotice *currentNotice = [self.noticeListArray objectAtIndex:indexPath.row];
    
    UIView *contentView = [cell.contentView viewWithTag:100];
    
    UILabel *headingLabel = (UILabel *) [contentView viewWithTag:101];
    [headingLabel setText:currentNotice.noticeHeading];
    
    UILabel *dateLabel = (UILabel *) [contentView viewWithTag:102];
    [dateLabel setText:[EKPUtility getDateForTimeStamp:currentNotice.noticeTimeStamp]];
    
    UITextView *messageTextView = (UITextView *) [contentView viewWithTag:103];
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData:[currentNotice.noticeMessage dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    messageTextView.attributedText = attributedString;
    [messageTextView setTextColor:[UIColor whiteColor]];
    
    return cell;
}


#pragma mark UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ((scrollView.contentOffset.y + scrollView.frame.size.height) >= scrollView.contentSize.height)
    {
        NSLog(@"%d",self.isFirstLoad);
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
