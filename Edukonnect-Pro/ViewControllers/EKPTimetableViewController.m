//
//  EKPTimetableViewController.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/12/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPTimetableViewController.h"
#import "EKPTimetableAPI.h"
#import "EKPDayScheduleViewController.h"

@interface EKPTimetableViewController ()

@end

@implementation EKPTimetableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.timeTableDayListArray = [[NSMutableArray alloc] init];
    
    [self.timeTableDayListTableView setBackgroundView:nil];
    [self.timeTableDayListTableView setBackgroundColor:[UIColor loadScreenBackgroundColor]];
    
    self.navigationController.navigationBar.topItem.title = @"";
    self.timeTableDayListArray = [EKPTimetableAPI getTimetable];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.title = @"Timetable";
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.timeTableDayListTableView.delegate = nil;
    self.timeTableDayListTableView = nil;
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
    return [self.timeTableDayListArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reuseIdentifier = @"dayCell";
    
    UITableViewCell *cell = [self.timeTableDayListTableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    NSArray *dayScheduleArray = [self.timeTableDayListArray objectAtIndex:indexPath.row];
    NSDictionary *dayScheduleDict = [dayScheduleArray objectAtIndex:0];
    
    UILabel *dayName = (UILabel *) [cell.contentView viewWithTag:100];
    [dayName setText:[dayScheduleDict objectForKey:TIMETABLE_API_DAY]];
    
    [cell setBackgroundColor:[UIColor loadScreenBackgroundColor]];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray *dayScheduleArray = [[self.timeTableDayListArray objectAtIndex:indexPath.row] mutableCopy];
    self.selectedDayScheduleArray = dayScheduleArray;
    [self performSegueWithIdentifier:@"TimetableToDayScheduleSegue" sender:self];
}

#pragma mark Navigation Methods

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"TimetableToDayScheduleSegue"]) {
        EKPDayScheduleViewController *dayScheduleVC = (EKPDayScheduleViewController *) segue.destinationViewController;
        dayScheduleVC.dayScheduleArray = self.selectedDayScheduleArray;
    }
}

@end
