//
//  EKPSchoolSupportListViewController.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 4/19/15.
//  Copyright (c) 2015 Kedar Desai. All rights reserved.
//

#import "EKPSchoolSupportListViewController.h"
#import "EKPSchoolSupportAPI.h"
#import "EKPSchoolSupport.h"

@interface EKPSchoolSupportListViewController ()

@end

@implementation EKPSchoolSupportListViewController


#pragma mark UIViewLifeCycle Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"HEllo");
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.topItem.title = @"";
    self.title = [NSString stringWithFormat:@"%@", SCHOOL_SUPORT_SCREEN_TITLE];
    
    // Call API
    NSInteger pageId = 1;
    NSMutableDictionary *schoolSupportDict = [[NSMutableDictionary alloc] initWithDictionary:[EKPSchoolSupportAPI getSchoolSupportQueriesListForPageId:pageId]];
    _dataArray = [[NSMutableArray alloc] init];
    NSArray *schoolSupportList = [schoolSupportDict objectForKey:SCHOOL_SUPPORT_API_TAG];
    for (NSDictionary *dataDict in schoolSupportList) {
        EKPSchoolSupport *schoolSupportObj = [[EKPSchoolSupport alloc] init];
        [schoolSupportObj setSchoolSupportDetailsWithDictionary:dataDict];
        [_dataArray addObject:schoolSupportObj];
    }
    [_tableView reloadData];
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
    return [_dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier;
    EKPSchoolSupport *schoolSupport = [_dataArray objectAtIndex:indexPath.row];
    
    if ([schoolSupport.schoolSupportType integerValue] == 0) {
        cellIdentifier = @"myQueryCell";
    } else {
        cellIdentifier = @"responseQueryCell";
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    UIView *contentView = [cell.contentView viewWithTag:100];
    
    UILabel *questionLabel = (UILabel *) [contentView viewWithTag:101];
    [questionLabel setText:schoolSupport.schoolSupportQuestion];
    
    UILabel *dateLabel = (UILabel *) [contentView viewWithTag:102];
    [dateLabel setText:[EKPUtility getDateForTimeStamp:schoolSupport.schoolSupportCreatedDate]];
    
    return cell;
}


#pragma mark IBAction Methods

- (IBAction)addQueryBtnClicked:(id)sender
{
    NSLog(@"Add a Query Btn Clicked");
    [self performSegueWithIdentifier:@"AddNewQuerySegue" sender:self];
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
