//
//  EKPExamListViewController.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/12/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPExamListViewController.h"
#import "EKPResultAPI.h"
#import "EKPExam.h"
#import "EKPResultViewController.h"

@interface EKPExamListViewController ()

@end

@implementation EKPExamListViewController

#pragma mark UIViewLifeCycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.examListArray = [[NSMutableArray alloc] init];
    
    [self.examListTableView setBackgroundView:nil];
    [self.examListTableView setBackgroundColor:[UIColor loadScreenBackgroundColor]];
    
    self.navigationController.navigationBar.topItem.title = @"";
    self.examListArray = [EKPResultAPI getExamList];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.title = @"Exam List";
}

- (void)didReceiveMemoryWarning {
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
    return [self.examListArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reuseIdentifier = @"examCell";
    
    UITableViewCell *cell = [self.examListTableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    EKPExam *examObj = [self.examListArray objectAtIndex:indexPath.row];
    
    UILabel *examNameLabel = (UILabel *) [cell.contentView viewWithTag:100];
    [examNameLabel setText:examObj.examName];
    
    UILabel *examDateLabel = (UILabel *) [cell.contentView viewWithTag:102];
    [examDateLabel setText:examObj.examDate];
    
    return cell;
}

#pragma mark UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    EKPExam *examObj = [self.examListArray objectAtIndex:indexPath.row];
    self.selectedExamId = examObj.examId;
    [self performSegueWithIdentifier:@"ExamListToResultSegue" sender:self];
}


#pragma mark UINavigation Methods

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ExamListToResultSegue"]) {
        EKPResultViewController *resultVC = (EKPResultViewController *) segue.destinationViewController;
        resultVC.examId = self.selectedExamId;
    }
}

@end
