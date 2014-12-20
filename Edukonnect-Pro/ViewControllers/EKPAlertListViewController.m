//
//  EKPAlertListViewController.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/20/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPAlertListViewController.h"
#import "EKPAlertAPI.h"
#import "EKPAlert.h"

@interface EKPAlertListViewController ()

@end

@implementation EKPAlertListViewController

#pragma mark UIViewLifeCycle Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.topItem.title = @"";
    
    self.alertListArray = [[NSMutableArray alloc] init];
    
    [self.alertListTableView setBackgroundView:nil];
    [self.alertListTableView setBackgroundColor:[UIColor loadScreenBackgroundColor]];
    [self.alertListTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.pageId = 0;
    self.isNextPageAvailable = YES;
    self.isFirstLoad = YES;
    [self callAPI];
    
    [self.alertListTableView setFrame:self.view.bounds];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.title = [NSString stringWithFormat:@"Alert List"];
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.alertListTableView.delegate = nil;
    self.alertListTableView = nil;
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
        NSMutableDictionary *resultDict = [EKPAlertAPI getAlertsForPageId:self.pageId];
        NSMutableArray *noticeArray = [[resultDict objectForKey:ALERT_API_NOTICE] mutableCopy];
        for (NSMutableDictionary *noticeDict in noticeArray) {
            EKPAlert *alertTemp = [[EKPAlert alloc] init];
            alertTemp.noticeId = [noticeDict objectForKey:ALERT_API_NOTICE_ID];
            alertTemp.noticeHeading = [noticeDict objectForKey:ALERT_API_HEADING];
            alertTemp.noticeMessage = [noticeDict objectForKey:ALERT_API_MESSAGE];
            alertTemp.noticeCreatedBy = [noticeDict objectForKey:ALERT_API_CREATED_BY];
            alertTemp.isSeen = [[noticeDict objectForKey:ALERT_API_IS_SEEN] boolValue];
            
            [self.alertListArray addObject:alertTemp];
        }
        
        if (self.pageId == 1) {
            // Save Notice List in Singleton
            [EKPSingleton saveAlertList:self.alertListArray];
        }
        self.isNextPageAvailable = [[resultDict objectForKey:ALERT_API_NEXT_PAGE] boolValue];
        
        [self.alertListTableView reloadData];
    }
}


#pragma mark UITableViewDelegate and UITableViewDatasource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.alertListArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"alertCell"];
    
    if (!cell) {
        cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"alertCell"];
    }
    
    self.isFirstLoad = NO;
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [cell setBackgroundColor:[UIColor loadScreenBackgroundColor]];
    
    EKPAlert *currentAlert = [self.alertListArray objectAtIndex:indexPath.row];
    
    UIView *contentView = [cell.contentView viewWithTag:100];
    
    UILabel *headingLabel = (UILabel *) [contentView viewWithTag:101];
    [headingLabel setText:currentAlert.noticeHeading];
    
    UITextView *messageTextView = (UITextView *) [contentView viewWithTag:102];
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData:[currentAlert.noticeMessage dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    messageTextView.attributedText = attributedString;
    [messageTextView setTextColor:[UIColor whiteColor]];
    
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
