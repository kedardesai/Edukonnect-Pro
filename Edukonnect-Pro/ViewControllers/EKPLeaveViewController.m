//
//  EKPLeaveViewController.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 4/12/15.
//  Copyright (c) 2015 Kedar Desai. All rights reserved.
//

#import "EKPLeaveViewController.h"
#import "EKPLeaveAPI.h"
#import "EKPLeave.h"

@interface EKPLeaveViewController ()

@property (nonatomic, strong) UIDatePicker *datepicker;
@property (nonatomic, strong) WYPopoverController *popOverForDatePicker;

@end

@implementation EKPLeaveViewController


#pragma mark UIViewLifeCycle Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _pageId = 1;
    _isNextPageAvailable = false;
}

- (void)viewWillAppear:(BOOL)animated
{
    _dataArray = [[NSMutableArray alloc] initWithArray:[EKPLeaveAPI listOfLeavesForPageId:_pageId]];
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
    NSString *identifier = @"LeaveCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    EKPLeave *leaveObj = [_dataArray objectAtIndex:indexPath.row];
    
    UIView *contentView = (UIView *) [cell.contentView viewWithTag:100];
    
    UILabel *datesLabel = (UILabel *) [contentView viewWithTag:101];
    [datesLabel setText:[NSString stringWithFormat:@"%@ to %@ (%@d)", [EKPUtility getDateForTimeStamp:leaveObj.leaveDtFrom], [EKPUtility getDateForTimeStamp:leaveObj.leaveDtTo], leaveObj.leaveDays]];
    
    UILabel *statusLabel = (UILabel *) [contentView viewWithTag:102];
    [statusLabel setText:leaveObj.leaveStatus];
    
    UILabel *noteLabel = (UILabel *) [contentView viewWithTag:103];
    [noteLabel setText:leaveObj.leaveNote];
    
    return cell;
}


#pragma mark IBAction Methods

- (IBAction)applyLeavesClicked:(UIButton *)applyLeaveButton
{
    NSLog(@"applyLeavesClicked...");
    
//    UIViewController *viewController = [[UIViewController alloc]init];
//    UIView *viewForDatePicker = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 100)];
//    
//    _datepicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, 0, 200, 100)];
//    _datepicker.datePickerMode = UIDatePickerModeDate;
//    _datepicker.hidden = NO;
//    _datepicker.date = [NSDate date];
//    [_datepicker addTarget:self action:@selector(dateSelected:) forControlEvents:UIControlEventValueChanged];
//    
//    [viewForDatePicker addSubview:_datepicker];
//    [viewController.view addSubview:viewForDatePicker];
//    
//    _popOverForDatePicker = [[WYPopoverController alloc] initWithContentViewController:viewController];
//    _popOverForDatePicker.delegate = self;
//    [_popOverForDatePicker setPopoverContentSize:CGSizeMake(300, 300) animated:NO];
//    [_popOverForDatePicker presentPopoverFromRect:applyLeaveButton.frame inView:self.view  permittedArrowDirections:(UIPopoverArrowDirectionUp|UIPopoverArrowDirectionDown| UIPopoverArrowDirectionLeft|UIPopoverArrowDirectionRight) animated:YES];
}

//-(void)dateSelected:(id)sender
//{
//    NSDateFormatter *df = [[NSDateFormatter alloc]init];
//    df.dateStyle = NSDateFormatterMediumStyle;
//    NSLog(@"%@",[NSString stringWithFormat:@"%@",[df stringFromDate:_datepicker.date]]);
//}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
