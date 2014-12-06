//
//  EKPSwitchUserViewController.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/3/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPSwitchUserViewController.h"
#import "EKPLoginAPI.h"

@interface EKPSwitchUserViewController ()

@end

@implementation EKPSwitchUserViewController


#pragma mark UIViewLifeCycle Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBar.topItem.title = @"";
    
    self.studentListArray = [[NSMutableArray alloc] initWithArray:[EKPSingleton loadStudentList]];
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage loadScreenBackgroundImage]]];
    
    [self.studentListTableView setBackgroundView:nil];
    [self.studentListTableView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage loadScreenBackgroundImage]]];
}

-(void)viewWillAppear:(BOOL)animated
{
    self.title = [NSString stringWithFormat:@"%@", SWITCH_USER_SCREEN_TITLE];
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
    return [self.studentListArray count] + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reuseIdentifier;
    
    if (indexPath.row == [self.studentListArray count]) {
        reuseIdentifier = @"newStudentCell";
    } else {
        reuseIdentifier = @"studentCell";
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    
    if (indexPath.row == [self.studentListArray count]) {
        UILabel *studentNameLabel = (UILabel *) [cell.contentView viewWithTag:100];
        [studentNameLabel setText:@"Add New Student"];
        
    } else {
        EKPStudent *studentTemp = [self.studentListArray objectAtIndex:indexPath.row];
        
        UILabel *studentNameLabel = (UILabel *) [cell.contentView viewWithTag:100];
        [studentNameLabel setText:studentTemp.studentName];
        
        EKPStudent *currentStudent = [EKPSingleton loadStudent];
        if ([studentTemp isEqualToStudent:currentStudent]) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            
        } else {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
    }
    
    [cell setBackgroundColor:[UIColor colorWithPatternImage:[UIImage loadScreenBackgroundImage]]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}


#pragma mark UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == [self.studentListArray count]) { // To add new Student in the list
        UIStoryboard *storyboard = [EKPUtility getStoryboardForCurrentDevice];
        [(UINavigationController*)self.view.window.rootViewController pushViewController:[storyboard instantiateViewControllerWithIdentifier:@"EKPLoginViewController"] animated:YES];
        
    } else {
        
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        
        EKPStudent *studentTemp = [self.studentListArray objectAtIndex:indexPath.row];
        EKPStudent *currentStudent = [EKPSingleton loadStudent];
        
        for (NSInteger row=0; row<[self.studentListArray count]; row++) {
            NSIndexPath *indexPathTemp = [NSIndexPath indexPathForRow:row inSection:0];
            UITableViewCell *cellTemp = [tableView cellForRowAtIndexPath:indexPathTemp];
            cellTemp.accessoryType = UITableViewCellAccessoryNone;
        }
        
        if (![studentTemp.studentGRNo isEqualToString:currentStudent.studentGRNo]) {
            NSDictionary *resultDict = [EKPLoginAPI loginUserWith:studentTemp];
            BOOL status = [[resultDict objectForKey:STATUS_KEY] boolValue];
            if (status) {
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
            }
            
        } else {
            [EKPUtility showAlertWithTitle:INFORMATION_TITLE andMessage:ALREADY_LOGGED_IN];
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
