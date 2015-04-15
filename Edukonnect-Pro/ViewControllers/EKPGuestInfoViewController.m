//
//  EKPGuestInfoViewController.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 3/31/15.
//  Copyright (c) 2015 Kedar Desai. All rights reserved.
//

#import "EKPGuestInfoViewController.h"

@interface EKPGuestInfoViewController ()

@end

@implementation EKPGuestInfoViewController


#pragma mark UIViewLifeCycle Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Name, mobile no, email Id, state and pincode.
    _dataArray = [[NSMutableArray alloc] initWithObjects:@"Enter Name", @"Enter Mobile No.", @"Enter Email Id", @"Select State", @"Enter Pin Code", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark UITableViewDatasource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger numberOfRows = 0;
    switch (section) {
        case 0:
            numberOfRows = [_dataArray count];
            break;
            
        case 1:
            numberOfRows = 1;
            break;
            
        default:
            break;
    }
    
    return numberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reuseIdentifier;
    switch (indexPath.section) {
        case 0:
            reuseIdentifier = @"GuestInformationCell";
            break;
            
        case 1:
            reuseIdentifier = @"GuestRegistrationCell";
            break;
            
        default:
            break;
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    if (indexPath.section == 0) {
        UITextField *textField = (UITextField *) [cell.contentView viewWithTag:100];
        [textField setPlaceholder:[_dataArray objectAtIndex:indexPath.row]];
        
    } else {
        UIButton *submitBtn = (UIButton *) [cell.contentView viewWithTag:100];
        [submitBtn addTarget:self action:@selector(submitBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return cell;
}


#pragma mark UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        UITextField *textField = (UITextField *) [cell.contentView viewWithTag:100];
        [textField becomeFirstResponder];
        
    } else {
        [self performSegueWithIdentifier:@"GuestLoginSegue" sender:self];
    }
}


#pragma mark IBAction Methods

- (void)submitBtnClicked:(UIButton *)senderBtn
{
    [self performSegueWithIdentifier:@"GuestLoginSegue" sender:self];
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
