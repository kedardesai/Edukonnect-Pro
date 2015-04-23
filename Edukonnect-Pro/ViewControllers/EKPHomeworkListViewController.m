//
//  EKPHomeworkListViewController.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 4/23/15.
//  Copyright (c) 2015 Kedar Desai. All rights reserved.
//

#import "EKPHomeworkListViewController.h"
#import "EKPHomeworkAPI.h"
#import "EKPHomework.h"
#import "EKPHomeworkDetailsViewController.h"

@interface EKPHomeworkListViewController ()

@property (nonatomic, strong) NSString *fileURL;

@end

@implementation EKPHomeworkListViewController


#pragma mark UIViewLifeCycle Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _pageId = 1;
    NSMutableDictionary *dataDict = [[NSMutableDictionary alloc] initWithDictionary:[EKPHomeworkAPI getHomeworkListForPageId:_pageId]];
    NSArray *homeworkList = [dataDict objectForKey:HOMEWORK_API_TAG];
    _dataArray = [[NSMutableArray alloc] init];
    for (NSDictionary *dict in homeworkList) {
        EKPHomework *homeworkObj = [[EKPHomework alloc] init];
        [homeworkObj setHomeworkDetailsWithDictionary:dict];
        [_dataArray addObject:homeworkObj];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.topItem.title = @"";
    self.title = [NSString stringWithFormat:@"%@", HOMEWORK_SCREEN_TITLE];
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
    NSString *cellIdentifier = @"homeworkCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    EKPHomework *homeworkObj = [_dataArray objectAtIndex:indexPath.row];
    
    UIView *contentView = [cell.contentView viewWithTag:100];
    
    UILabel *homeworkHeadingLabel = (UILabel *) [contentView viewWithTag:101];
    [homeworkHeadingLabel setText:homeworkObj.homeworkHeading];
    
    UILabel *homeworkDateLabel = (UILabel *) [contentView viewWithTag:102];
    [homeworkDateLabel setText:homeworkObj.homeworkDate];
    
    UILabel *homeworkDetailsLabel = (UILabel *) [contentView viewWithTag:103];
    [homeworkDetailsLabel setText:homeworkObj.homeworkDetails];
    
    return cell;
}


#pragma mark UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    EKPHomework *homeworkObj = [_dataArray objectAtIndex:indexPath.row];
    if (homeworkObj.homeworkIsFileUploaded) {
        EKPStudent *currentStudent = [EKPSingleton loadStudent];
        _fileURL = [NSString stringWithFormat:@"%@/uploads/homework/%@%@",currentStudent.studentBasePath, homeworkObj.homeworkId, homeworkObj.homeworkFileExt];
        [self performSegueWithIdentifier:@"ShowHomeworkFileSegue" sender:self];
    }
}


#pragma mark - Navigation Methods

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([[segue identifier] isEqualToString:@"ShowHomeworkFileSegue"]) {
        EKPHomeworkDetailsViewController *destViewController = (EKPHomeworkDetailsViewController *) [segue destinationViewController];
        destViewController.urlString = _fileURL;
    }
}

@end
