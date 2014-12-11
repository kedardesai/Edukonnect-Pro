//
//  EKPResultViewController.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/12/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPResultViewController.h"
#import "EKPResultAPI.h"
#import "EKPSubjectResult.h"

@interface EKPResultViewController ()

@end

@implementation EKPResultViewController

#pragma mark UIViewLifeCycle Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.resultListArray = [[NSMutableArray alloc] init];
    
    [self.resultListTableView setBackgroundView:nil];
    [self.resultListTableView setBackgroundColor:[UIColor loadScreenBackgroundColor]];
    [self.resultListTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    self.navigationController.navigationBar.topItem.title = @"";
    
    self.resultListArray = [EKPResultAPI getResultForExamId:self.examId];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.title = @"Result";
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
    return [self.resultListArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.resultListTableView dequeueReusableCellWithIdentifier:@"resultCell"];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    EKPSubjectResult *resultObj = [self.resultListArray objectAtIndex:indexPath.row];
    
    UIView *contentView = [cell.contentView viewWithTag:100];
    
    UILabel *subjectLabel = (UILabel *) [contentView viewWithTag:101];
    [subjectLabel setText:resultObj.resultSubject];
    
    UILabel *marksLabel = (UILabel *) [contentView viewWithTag:102];
    [marksLabel setText:resultObj.resultMarks];
    
    UILabel *outOfLabel = (UILabel *) [contentView viewWithTag:104];
    [outOfLabel setText:resultObj.resultOutof];
    
    UILabel *attendanceLabel = (UILabel *) [contentView viewWithTag:106];
    [attendanceLabel setText:resultObj.resultAttendance];
    
    UITextView *commentTextView = (UITextView *) [contentView viewWithTag:107];
    [commentTextView setText:resultObj.resultComment];
    [commentTextView setTextColor:[UIColor whiteColor]];
    
    [cell setBackgroundColor:[UIColor loadScreenBackgroundColor]];
    
    return cell;
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
