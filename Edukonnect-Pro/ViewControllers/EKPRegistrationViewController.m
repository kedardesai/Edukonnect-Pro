//
//  EKPRegistrationViewController.m
//  Edukonnect-Pro
//
//  Created by Dinesh Panwar on 29/09/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPRegistrationViewController.h"
#import "KDTextField.h"

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
    
    // Set HeaderView for registrationTableView
    UIImageView *imageView = (UIImageView *) [self.registrationTableHeaderView viewWithTag:100];
    [imageView setImage:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.title = [NSString stringWithFormat:@"%@", REGISTRATION_SCREEN_TITLE];
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
    NSInteger numberOfRows;
    
    switch (section) {
        case 0:
            numberOfRows = 3;
            break;
            
        case 1:
            numberOfRows = 1;
            break;
            
        default:
            numberOfRows = 0;
            break;
    }
    
    return numberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reUseIdentifier;
    KDTextFieldType textFieldType = kTextFieldTypeDefault;
    
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
                reUseIdentifier = @"RegisterNameCell";
                textFieldType = kTextFieldTypeString;
                break;
                
            case 1:
                reUseIdentifier = @"RegisterMobileCell";
                textFieldType = kTextFieldTypeMobile;
                break;
                
            case 2:
                reUseIdentifier = @"RegisterEmailCell";
                textFieldType = kTextFieldTypeEmail;
                break;
                
            default:
                reUseIdentifier = @"Cell";
                textFieldType = kTextFieldTypeDefault;
                break;
        }
        
    } else {
        reUseIdentifier = @"RegisterSubmitCell";
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reUseIdentifier forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.section == 0) {
        KDTextField *textField = (KDTextField *) [cell viewWithTag:101];
        [textField setTextFieldtype:textFieldType];
        [textField setIsAnimated:NO];
        [textField setNormalBorderColor:nil errorBorderColor:nil normalTextColor:nil errorTextColor:nil normalBorderWidth:0.0 errorBorderWidth:0.0];
        
    }
    
    return cell;
}

#pragma mark Navigation Methods

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if ([identifier isEqualToString:@"registeredLoginSegue"]) {
        // 1. Calidate inputs
        // 2. Call Registration API
        // 3. Get Returned Data
        // 4. Store Returned Data For Future Use
        BOOL isSuccess = YES;
        if (isSuccess) {
            [EKPUtility showAlertWithTitle:SUCCESS_TITLE andMessage:REGISTRATION_SUCCESS];
            return YES;
        } else {
            [EKPUtility showAlertWithTitle:FAILED_TITLE andMessage:REGISTRATION_FAIL];
            return NO;
        }
    }
    
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
