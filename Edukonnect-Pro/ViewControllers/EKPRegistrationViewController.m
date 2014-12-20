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
#import "MBProgressHUD.h"

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
    
    [self.nameLabel setTextColor:[UIColor loadComponentNormalColor]];
    [self.nameTextField setTextFieldtype:kTextFieldTypeString];
    [self.nameTextField setIsAnimated:YES];
    [self.nameTextField setNormalBorderColor:[UIColor loadComponentNormalColor] errorBorderColor:[UIColor loadComponentAlertColor] normalTextColor:[UIColor blackColor] errorTextColor:[UIColor blackColor] normalBorderWidth:0.6 errorBorderWidth:0.6];
    self.nameTextField.layer.cornerRadius = 2.0;
    self.nameTextField.layer.shadowOffset = CGSizeMake(1, 1);
    self.nameTextField.layer.shadowRadius = 5;
    self.nameTextField.layer.shadowOpacity = 0.5;
    
    [self.mobileLabel setTextColor:[UIColor loadComponentNormalColor]];
    [self.mobileTextField setTextFieldtype:kTextFieldTypeMobile];
    [self.mobileTextField setIsAnimated:YES];
    [self.mobileTextField setNormalBorderColor:[UIColor loadComponentNormalColor] errorBorderColor:[UIColor loadComponentAlertColor] normalTextColor:[UIColor blackColor] errorTextColor:[UIColor blackColor] normalBorderWidth:0.6 errorBorderWidth:0.6];
    self.mobileTextField.layer.cornerRadius = 2.0;
    self.mobileTextField.layer.shadowOffset = CGSizeMake(1, 1);
    self.mobileTextField.layer.shadowRadius = 5;
    self.mobileTextField.layer.shadowOpacity = 0.5;
    
    [self.emailLabel setTextColor:[UIColor loadComponentNormalColor]];
    [self.emailTextField setTextFieldtype:kTextFieldTypeEmail];
    [self.emailTextField setIsAnimated:YES];
    [self.emailTextField setNormalBorderColor:[UIColor loadComponentNormalColor] errorBorderColor:[UIColor loadComponentAlertColor] normalTextColor:[UIColor blackColor] errorTextColor:[UIColor blackColor] normalBorderWidth:0.6 errorBorderWidth:0.6];
    self.emailTextField.layer.cornerRadius = 2.0;
    self.emailTextField.layer.shadowOffset = CGSizeMake(1, 1);
    self.emailTextField.layer.shadowRadius = 5;
    self.emailTextField.layer.shadowOpacity = 0.5;
    
    self.registrationBtn.layer.cornerRadius = 2.0;
    self.registrationBtn.layer.masksToBounds = NO;
    self.registrationBtn.layer.shadowOffset = CGSizeMake(2, 2);
    self.registrationBtn.layer.shadowRadius = 5;
    self.registrationBtn.layer.shadowOpacity = 0.5;
    [self.registrationBtn.titleLabel setShadowOffset:CGSizeMake(1.0f, 1.0f)];
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

#pragma mark Code-Reusable Methods

- (void)setLeftViewForTextField
{
    UIView *usernameLeftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    UIImageView *imageViewUsername = [[UIImageView alloc] initWithFrame:CGRectMake(10, 9, 20, 20)];
    [imageViewUsername setContentMode:UIViewContentModeScaleAspectFit];
    [imageViewUsername setImage:[UIImage imageNamed:@"Username"]];
    [usernameLeftView addSubview:imageViewUsername];
    [self.nameTextField setLeftView:usernameLeftView];
    [self.nameTextField setLeftViewMode:UITextFieldViewModeAlways];
    
    UIView *passwordLeftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    UIImageView *imageViewPassword = [[UIImageView alloc] initWithFrame:CGRectMake(10, 9, 20, 20)];
    [imageViewPassword setImage:[UIImage imageNamed:@"Password"]];
    [imageViewPassword setContentMode:UIViewContentModeScaleAspectFit];
    [passwordLeftView addSubview:imageViewPassword];
    [self.mobileTextField setLeftView:passwordLeftView];
    [self.mobileTextField setLeftViewMode:UITextFieldViewModeAlways];
    
    UIView *emailLeftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    UIImageView *imageViewemail = [[UIImageView alloc] initWithFrame:CGRectMake(10, 9, 20, 20)];
    [imageViewemail setImage:[UIImage imageNamed:@"Password"]];
    [imageViewemail setContentMode:UIViewContentModeScaleAspectFit];
    [emailLeftView addSubview:imageViewemail];
    [self.emailTextField setLeftView:emailLeftView];
    [self.emailTextField setLeftViewMode:UITextFieldViewModeAlways];
}

#pragma mark KDTextFieldDelegate Methods

- (void)onError:(NSError *)error withTextField:(KDTextField *)textField
{
//    [self showAlertViewWithTitle:@"Error - Invalid Text" andMessage:[error localizedDescription]];
    if (textField == self.nameTextField) {
        [self.nameLabel setTextColor:[UIColor loadComponentAlertColor]];
        
    } else if (textField == self.mobileTextField) {
        [self.mobileLabel setTextColor:[UIColor loadComponentAlertColor]];
        
    } else if (textField == self.emailTextField) {
        [self.emailLabel setTextColor:[UIColor loadComponentAlertColor]];
    }
}

- (void)onSucess:(KDTextField *)textField
{
//    [self showAlertViewWithTitle:@"Success" andMessage:textField.text];
}

- (BOOL)addCustomValidation:(KDTextField *)textField
{
    NSLog(@"Add Custom Validation here for password");
    return YES;
}

#pragma mark UITextFieldDelegate Methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}

#pragma maek UINavigation

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    [self.nameLabel setTextColor:[UIColor loadComponentNormalColor]];
    [self.mobileLabel setTextColor:[UIColor loadComponentNormalColor]];
    [self.emailLabel setTextColor:[UIColor loadComponentNormalColor]];
    
    [self.nameTextField validateTextFieldAnimated:YES];
    [self.mobileTextField validateTextFieldAnimated:YES];
    [self.emailTextField validateTextFieldAnimated:YES];
    
    if (self.nameTextField.isValid && self.mobileTextField.isValid && self.mobileTextField.isValid) {
        // Validate Inputs here
        EKPUser *user = [[EKPUser alloc] init];
        user.userName = self.nameTextField.text;
        user.userMobile = self.mobileTextField.text;
        user.userEmail = self.emailTextField.text;
        
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        
        __block BOOL result;
        
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
            // Do something...
            result = [EKPRegistrationAPI registerUserWith:user];
            if (result) {
                [EKPSingleton saveUserWithUser:user];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                [MBProgressHUD hideHUDForView:self.view animated:YES];
            });
        });
        
        return result;
    }
    
    return NO;
}

@end
