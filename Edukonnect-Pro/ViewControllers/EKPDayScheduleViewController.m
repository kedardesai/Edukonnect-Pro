//
//  EKPDayScheduleViewController.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/13/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPDayScheduleViewController.h"

@interface EKPDayScheduleViewController ()

@end

@implementation EKPDayScheduleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.dayScheduleTableView setBackgroundView:nil];
    [self.dayScheduleTableView setBackgroundColor:[UIColor loadScreenBackgroundColor]];
    
    self.navigationController.navigationBar.topItem.title = @"";
}

- (void)viewWillAppear:(BOOL)animated
{
    NSDictionary *dict = [self.dayScheduleArray objectAtIndex:0];
    self.title = [dict objectForKey:TIMETABLE_API_DAY];
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.dayScheduleTableView.delegate = nil;
    self.dayScheduleTableView = nil;
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
    return [self.dayScheduleArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reuseIdentifier = @"dayScheduleCell";
    UITableViewCell *cell = [self.dayScheduleTableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    [cell setBackgroundColor:[UIColor loadScreenBackgroundColor]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSDictionary *lectureDictionary = [self.dayScheduleArray objectAtIndex:indexPath.row];
    
    UILabel *subjectLabel = (UILabel *) [cell.contentView viewWithTag:100];
    [subjectLabel setText:[lectureDictionary objectForKey:TIMETABLE_API_LECTURE]];
    
    UILabel *startTimeLabel = (UILabel *) [cell.contentView viewWithTag:101];
    [startTimeLabel setText:[lectureDictionary objectForKey:TIMETABLE_API_START_TIME]];
    [startTimeLabel sizeToFit];
    
    UILabel *toLabel = (UILabel *) [cell.contentView viewWithTag:102];
    CGRect toFrame = toLabel.frame;
    toFrame.origin.x = startTimeLabel.frame.origin.x + startTimeLabel.frame.size.width + 10;
    [toLabel setFrame:toFrame];
    
    UILabel *endTimeLabel = (UILabel *) [cell.contentView viewWithTag:103];
    [endTimeLabel setText:[lectureDictionary objectForKey:TIMETABLE_API_END_TIME]];
    CGRect endFrame = endTimeLabel.frame;
    endFrame.origin.x = toFrame.origin.x + toFrame.size.width + 10;
    [endTimeLabel setFrame:endFrame];
    
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
