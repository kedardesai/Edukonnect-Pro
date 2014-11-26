//
//  EKPLoginViewController.m
//  Edukonnect-Pro
//
//  Created by Dinesh Panwar on 30/09/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPLoginViewController.h"
#import "KDTextField.h"
#import "EKPLoginAPI.h"
#import "EKPStudent.h"

@interface EKPLoginViewController ()

@end

@implementation EKPLoginViewController

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
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage loadScreenBackgroundImage]]];
    
    [self.schoolCodeLabel setTextColor:[UIColor loadComponentNormalColor]];
    [self.schoolCodeTextField setTextFieldtype:kTextFieldTypeCustom];
    [self.schoolCodeTextField setIsAnimated:YES];
    [self.schoolCodeTextField setNormalBorderColor:[UIColor loadComponentNormalColor] errorBorderColor:[UIColor loadComponentAlertColor] normalTextColor:[UIColor blackColor] errorTextColor:[UIColor blackColor] normalBorderWidth:0.6 errorBorderWidth:0.6];
    self.schoolCodeTextField.layer.cornerRadius = 2.0;
    self.schoolCodeTextField.layer.shadowOffset = CGSizeMake(1, 1);
    self.schoolCodeTextField.layer.shadowRadius = 5;
    self.schoolCodeTextField.layer.shadowOpacity = 0.5;
    
    [self.userNameLabel setTextColor:[UIColor loadComponentNormalColor]];
    [self.userNameTextField setTextFieldtype:kTextFieldTypeEmail];
    [self.userNameTextField setIsAnimated:YES];
    [self.userNameTextField setNormalBorderColor:[UIColor loadComponentNormalColor] errorBorderColor:[UIColor loadComponentAlertColor] normalTextColor:[UIColor blackColor] errorTextColor:[UIColor blackColor] normalBorderWidth:0.6 errorBorderWidth:0.6];
    self.userNameTextField.layer.cornerRadius = 2.0;
    self.userNameTextField.layer.shadowOffset = CGSizeMake(1, 1);
    self.userNameTextField.layer.shadowRadius = 5;
    self.userNameTextField.layer.shadowOpacity = 0.5;
    
    [self.passwordLabel setTextColor:[UIColor loadComponentNormalColor]];
    [self.passwordTextField setTextFieldtype:kTextFieldTypePassword];
    [self.passwordTextField setIsAnimated:YES];
    [self.passwordTextField setNormalBorderColor:[UIColor loadComponentNormalColor] errorBorderColor:[UIColor loadComponentAlertColor] normalTextColor:[UIColor blackColor] errorTextColor:[UIColor blackColor] normalBorderWidth:0.6 errorBorderWidth:0.6];
    self.passwordTextField.layer.cornerRadius = 2.0;
    self.passwordTextField.layer.shadowOffset = CGSizeMake(1, 1);
    self.passwordTextField.layer.shadowRadius = 5;
    self.passwordTextField.layer.shadowOpacity = 0.5;
    
    self.loginButton.layer.cornerRadius = 2.0;
    self.loginButton.layer.masksToBounds = NO;
    self.loginButton.layer.shadowOffset = CGSizeMake(2, 2);
    self.loginButton.layer.shadowRadius = 5;
    self.loginButton.layer.shadowOpacity = 0.5;
    [self.loginButton.titleLabel setShadowOffset:CGSizeMake(1.0f, 1.0f)];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.title = [NSString stringWithFormat:@"%@", LOGIN_SCREEN_TITLE];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Code-Reusable Methods

- (void)setLeftViewForTextField
{
    UIView *schoolCodeLeftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    UIImageView *imageViewSchoolCode = [[UIImageView alloc] initWithFrame:CGRectMake(10, 9, 20, 20)];
    [imageViewSchoolCode setImage:[UIImage imageNamed:@"Password"]];
    [imageViewSchoolCode setContentMode:UIViewContentModeScaleAspectFit];
    [schoolCodeLeftView addSubview:imageViewSchoolCode];
    [self.schoolCodeTextField setLeftView:schoolCodeLeftView];
    [self.schoolCodeTextField setLeftViewMode:UITextFieldViewModeAlways];
    
    UIView *usernameLeftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    UIImageView *imageViewUsername = [[UIImageView alloc] initWithFrame:CGRectMake(10, 9, 20, 20)];
    [imageViewUsername setContentMode:UIViewContentModeScaleAspectFit];
    [imageViewUsername setImage:[UIImage imageNamed:@"Username"]];
    [usernameLeftView addSubview:imageViewUsername];
    [self.userNameTextField setLeftView:usernameLeftView];
    [self.userNameTextField setLeftViewMode:UITextFieldViewModeAlways];
    
    UIView *passwordLeftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    UIImageView *imageViewPassword = [[UIImageView alloc] initWithFrame:CGRectMake(10, 9, 20, 20)];
    [imageViewPassword setImage:[UIImage imageNamed:@"Password"]];
    [imageViewPassword setContentMode:UIViewContentModeScaleAspectFit];
    [passwordLeftView addSubview:imageViewPassword];
    [self.passwordTextField setLeftView:passwordLeftView];
    [self.passwordTextField setLeftViewMode:UITextFieldViewModeAlways];
}

#pragma mark KDTextFieldDelegate Methods

- (void)onError:(NSError *)error withTextField:(KDTextField *)textField
{
//    [EKPUtility showAlertWithTitle:@"Error - Invalid Text" andMessage:[error localizedDescription]];
    if (textField == self.schoolCodeTextField) {
        [self.schoolCodeLabel setTextColor:[UIColor loadComponentAlertColor]];
        
    } else if (textField == self.userNameTextField) {
        [self.userNameLabel setTextColor:[UIColor loadComponentAlertColor]];
        
    } else if (textField == self.passwordTextField) {
        [self.passwordLabel setTextColor:[UIColor loadComponentAlertColor]];
    }
}

- (void)onSucess:(KDTextField *)textField
{
    //    [self showAlertViewWithTitle:@"Success" andMessage:textField.text];
}

- (BOOL)addCustomValidation:(KDTextField *)textField
{
    if ([[textField text] length] == 0) {
        return NO;
    }
    textField.isValid = YES;
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

#pragma mark UINavigation

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    [self.schoolCodeLabel setTextColor:[UIColor loadComponentNormalColor]];
    [self.userNameLabel setTextColor:[UIColor loadComponentNormalColor]];
    [self.passwordLabel setTextColor:[UIColor loadComponentNormalColor]];
    
    [self.schoolCodeTextField validateTextFieldAnimated:YES];
    [self.userNameTextField validateTextFieldAnimated:YES];
    [self.passwordTextField validateTextFieldAnimated:YES];
    
    if (self.schoolCodeTextField.isValid && self.userNameTextField.isValid && self.passwordTextField.isValid) {
        // Validate Inputs here
        EKPStudent *student = [[EKPStudent alloc] init];
        student.studentSchoolCode = self.schoolCodeTextField.text;
        student.studentUsername = self.userNameTextField.text;
        student.studentPassword = self.passwordTextField.text;
        NSDictionary *resultDict = [EKPLoginAPI loginUserWith:student];
        BOOL status = [[resultDict objectForKey:STATUS_KEY] boolValue];
        if (status) {
            // school_details
            NSDictionary *schoolDict = (NSDictionary *)[resultDict objectForKey:LOGIN_API_SCHOOL_DETAILS];
            student.studentSchoolAddress = [schoolDict objectForKey:LOGIN_API_SCHOOL_ADDRESS];
            student.studentSchoolEmail = [schoolDict objectForKey:LOGIN_API_SCHOOL_EMAIL];
            if (![[schoolDict objectForKey:LOGIN_API_SCHOOL_LOGO] isEqual:[NSNull null]]) {
                student.studentSchoolLogo = [schoolDict objectForKey:LOGIN_API_SCHOOL_LOGO];
            }
            student.studentSchoolName = [schoolDict objectForKey:LOGIN_API_SCHOOL_NAME];
            // student_details
            NSDictionary *studentDict = (NSDictionary *)[resultDict objectForKey:LOGIN_API_STUDENT_DETAILS];
            student.studentAddress = [studentDict objectForKey:LOGIN_API_STUDENT_ADDRESS];
            student.studentBirthday = [studentDict objectForKey:LOGIN_API_STUDENT_BIRTHDAY];
            student.studentClass = [studentDict objectForKey:LOGIN_API_STUDENT_CLASS];
            if (![[studentDict objectForKey:LOGIN_API_STUDENT_GRNO] isEqual:[NSNull null]]) {
                student.studentGRNo = [studentDict objectForKey:LOGIN_API_STUDENT_GRNO];
            }
            student.studentName = [studentDict objectForKey:LOGIN_API_STUDENT_NAME];
            student.studentRollNo = [studentDict objectForKey:LOGIN_API_STUDENT_ROLLNO];
            student.studentSex = [studentDict objectForKey:LOGIN_API_STUDENT_SEX];
            
            [EKPSingleton saveStudent:student];
//            [EKPSingleton addStudentToList:student];
        }
        return status;
    }
    
    return NO;
}

@end
