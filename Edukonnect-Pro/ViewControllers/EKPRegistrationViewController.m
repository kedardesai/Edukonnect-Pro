//
//  EKPRegistrationViewController.m
//  Edukonnect-Pro
//
//  Created by Dinesh Panwar on 29/09/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPRegistrationViewController.h"
#import "KDTextField.h"
#import "EKPRegistrationAPI.h"

@interface EKPRegistrationViewController ()

@end

@implementation EKPRegistrationViewController


#pragma mark UIViewLifeCycle Methods

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.topItem.title = @"";
    [self.view setBackgroundColor:[UIColor loadScreenBackgroundColor]];
    
    _userRolesArray = [[NSMutableArray alloc] initWithObjects:ADMIN_ROLE, PARENT_ROLE, TEACHER_ROLE, STUDENT_ROLE, GUEST_ROLE, nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.title = [NSString stringWithFormat:@"%@", REGISTRATION_SCREEN_TITLE];
    [self.navigationItem setHidesBackButton:YES animated:YES];
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
    return [_userRolesArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"userRoleCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    UILabel *roleLabel =  (UILabel *) [cell.contentView viewWithTag:100];
    [roleLabel setText:[_userRolesArray objectAtIndex:indexPath.row]];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Select Your Role.";
}


#pragma mark UITableViewDatasource Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [EKPSingleton saveUserRole:[_userRolesArray objectAtIndex:indexPath.row]];
    
    switch (indexPath.row) {
        case 0: // For Admin
            [self performSegueWithIdentifier:@"RegisteredSuccessfullySegue" sender:self];
            break;
            
        case 1: // For Parent
            [self performSegueWithIdentifier:@"RegisteredSuccessfullySegue" sender:self];
            break;
            
        case 2: // For Teacher
            [self performSegueWithIdentifier:@"RegisteredSuccessfullySegue" sender:self];
            break;
            
        case 3: // For Student
            [self performSegueWithIdentifier:@"RegisteredSuccessfullySegue" sender:self];
            break;
            
        case 4: // For Guest
            [self performSegueWithIdentifier:@"GuestLoginSegue" sender:self];
            break;
            
        default:
            break;
    }
}

@end
