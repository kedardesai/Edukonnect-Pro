//
//  EKPEduProfileViewController.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/6/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPEduProfileViewController.h"

@interface EKPEduProfileViewController ()

@end

@implementation EKPEduProfileViewController

#pragma mark UIViewLifeCycle Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.topItem.title = @"";
    [self.parentScrollView setBackgroundColor:[UIColor loadScreenBackgroundColor]];
    
    // Dispose of any resources that can be recreated.
    if ([EKPUtility getUserDeviceType] == kEKPUserDeviceIPad) {
        self.parentScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1189);
        
    } else {
        self.parentScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 844);
    }
    
    self.currentStudent = [EKPSingleton loadStudent];
    self.currentUser = [EKPSingleton loadUser];
    
    // For SchoolCode
    [self.schoolCodeLabel setTextColor:[UIColor loadComponentNormalColor]];
    [self.schoolCodeTextField setNormalBorderColor:[UIColor loadComponentNormalColor] errorBorderColor:[UIColor loadComponentAlertColor] normalTextColor:[UIColor blackColor] errorTextColor:[UIColor blackColor] normalBorderWidth:0.6 errorBorderWidth:0.6];
    self.schoolCodeTextField.layer.cornerRadius = 2.0;
    self.schoolCodeTextField.layer.shadowOffset = CGSizeMake(1, 1);
    self.schoolCodeTextField.layer.shadowRadius = 5;
    self.schoolCodeTextField.layer.shadowOpacity = 0.5;
    if ([self.currentStudent.studentSchoolCode length]>0) {
        [self.schoolCodeTextField setText:self.currentStudent.studentSchoolCode];
    }
    
    // For GR No.
    [self.grNoLabel setTextColor:[UIColor loadComponentNormalColor]];
    [self.grNoTextField setNormalBorderColor:[UIColor loadComponentNormalColor] errorBorderColor:[UIColor loadComponentAlertColor] normalTextColor:[UIColor blackColor] errorTextColor:[UIColor blackColor] normalBorderWidth:0.6 errorBorderWidth:0.6];
    self.grNoTextField.layer.cornerRadius = 2.0;
    self.grNoTextField.layer.shadowOffset = CGSizeMake(1, 1);
    self.grNoTextField.layer.shadowRadius = 5;
    self.grNoTextField.layer.shadowOpacity = 0.5;
    if ([self.currentStudent.studentGRNo length]>0) {
        [self.grNoTextField setText:self.currentStudent.studentGRNo];
    }
    
    // For Parent Name
    [self.parentNameLabel setTextColor:[UIColor loadComponentNormalColor]];
    [self.parentNameTextField setTextFieldtype:kTextFieldTypeCustom];
    [self.parentNameTextField setIsAnimated:YES];
    [self.parentNameTextField setNormalBorderColor:[UIColor loadComponentNormalColor] errorBorderColor:[UIColor loadComponentAlertColor] normalTextColor:[UIColor blackColor] errorTextColor:[UIColor blackColor] normalBorderWidth:0.6 errorBorderWidth:0.6];
    self.parentNameTextField.layer.cornerRadius = 2.0;
    self.parentNameTextField.layer.shadowOffset = CGSizeMake(1, 1);
    self.parentNameTextField.layer.shadowRadius = 5;
    self.parentNameTextField.layer.shadowOpacity = 0.5;
    if ([self.currentStudent.studentName length]>0) {
        [self.parentNameTextField setText:self.currentStudent.studentName];
    }
    
    // For Password
    [self.passwordLabel setTextColor:[UIColor loadComponentNormalColor]];
    [self.passwordTextField setTextFieldtype:kTextFieldTypePassword];
    [self.passwordTextField setIsAnimated:YES];
    [self.passwordTextField setNormalBorderColor:[UIColor loadComponentNormalColor] errorBorderColor:[UIColor loadComponentAlertColor] normalTextColor:[UIColor blackColor] errorTextColor:[UIColor blackColor] normalBorderWidth:0.6 errorBorderWidth:0.6];
    self.passwordTextField.layer.cornerRadius = 2.0;
    self.passwordTextField.layer.shadowOffset = CGSizeMake(1, 1);
    self.passwordTextField.layer.shadowRadius = 5;
    self.passwordTextField.layer.shadowOpacity = 0.5;
    if ([self.currentStudent.studentPassword length]>0) {
        [self.passwordTextField setText:self.currentStudent.studentPassword];
    }
    
    // For Confirm Password
    [self.confirmPasswordLabel setTextColor:[UIColor loadComponentNormalColor]];
    [self.confirmPasswordTextField setTextFieldtype:kTextFieldTypePassword];
    [self.confirmPasswordTextField setIsAnimated:YES];
    [self.confirmPasswordTextField setNormalBorderColor:[UIColor loadComponentNormalColor] errorBorderColor:[UIColor loadComponentAlertColor] normalTextColor:[UIColor blackColor] errorTextColor:[UIColor blackColor] normalBorderWidth:0.6 errorBorderWidth:0.6];
    self.confirmPasswordTextField.layer.cornerRadius = 2.0;
    self.confirmPasswordTextField.layer.shadowOffset = CGSizeMake(1, 1);
    self.confirmPasswordTextField.layer.shadowRadius = 5;
    self.confirmPasswordTextField.layer.shadowOpacity = 0.5;
    if ([self.currentStudent.studentPassword length]>0) {
        [self.confirmPasswordTextField setText:self.currentStudent.studentPassword];
    }
    
    // For Relation With Student
    [self.relationLabel setTextColor:[UIColor loadComponentNormalColor]];
    [self.relationTextField setTextFieldtype:kTextFieldTypeString];
    [self.relationTextField setIsAnimated:YES];
    [self.relationTextField setNormalBorderColor:[UIColor loadComponentNormalColor] errorBorderColor:[UIColor loadComponentAlertColor] normalTextColor:[UIColor blackColor] errorTextColor:[UIColor blackColor] normalBorderWidth:0.6 errorBorderWidth:0.6];
    self.relationTextField.layer.cornerRadius = 2.0;
    self.relationTextField.layer.shadowOffset = CGSizeMake(1, 1);
    self.relationTextField.layer.shadowRadius = 5;
    self.relationTextField.layer.shadowOpacity = 0.5;
    
    // For Contact Number
    [self.contactNoLabel setTextColor:[UIColor loadComponentNormalColor]];
    [self.contactNoTextField setTextFieldtype:kTextFieldTypeMobile];
    [self.contactNoTextField setIsAnimated:YES];
    [self.contactNoTextField setNormalBorderColor:[UIColor loadComponentNormalColor] errorBorderColor:[UIColor loadComponentAlertColor] normalTextColor:[UIColor blackColor] errorTextColor:[UIColor blackColor] normalBorderWidth:0.6 errorBorderWidth:0.6];
    self.contactNoTextField.layer.cornerRadius = 2.0;
    self.contactNoTextField.layer.shadowOffset = CGSizeMake(1, 1);
    self.contactNoTextField.layer.shadowRadius = 5;
    self.contactNoTextField.layer.shadowOpacity = 0.5;
    if ([self.currentUser.userMobile length]>0) {
        [self.contactNoTextField setText:self.currentUser.userMobile];
    }
    
    // For Address
    [self.addressLabel setTextColor:[UIColor loadComponentNormalColor]];
    [self.addressTextField setTextFieldtype:kTextFieldTypeCustom];
    [self.addressTextField setIsAnimated:YES];
    [self.addressTextField setNormalBorderColor:[UIColor loadComponentNormalColor] errorBorderColor:[UIColor loadComponentAlertColor] normalTextColor:[UIColor blackColor] errorTextColor:[UIColor blackColor] normalBorderWidth:0.6 errorBorderWidth:0.6];
    self.addressTextField.layer.cornerRadius = 2.0;
    self.addressTextField.layer.shadowOffset = CGSizeMake(1, 1);
    self.addressTextField.layer.shadowRadius = 5;
    self.addressTextField.layer.shadowOpacity = 0.5;
    if ([self.currentStudent.studentAddress length]>0) {
        [self.addressTextField setText:self.currentStudent.studentAddress];
    }
    
    // For Profession
    [self.professionLabel setTextColor:[UIColor loadComponentNormalColor]];
    [self.professionTextField setTextFieldtype:kTextFieldTypeString];
    [self.professionTextField setIsAnimated:YES];
    [self.professionTextField setNormalBorderColor:[UIColor loadComponentNormalColor] errorBorderColor:[UIColor loadComponentAlertColor] normalTextColor:[UIColor blackColor] errorTextColor:[UIColor blackColor] normalBorderWidth:0.6 errorBorderWidth:0.6];
    self.professionTextField.layer.cornerRadius = 2.0;
    self.professionTextField.layer.shadowOffset = CGSizeMake(1, 1);
    self.professionTextField.layer.shadowRadius = 5;
    self.professionTextField.layer.shadowOpacity = 0.5;
    
    self.updateButton.layer.cornerRadius = 2.0;
    self.updateButton.layer.shadowOffset = CGSizeMake(1, 1);
    self.updateButton.layer.shadowRadius = 5;
    self.updateButton.layer.shadowOpacity = 0.5;
}

- (void)viewWillAppear:(BOOL)animated
{
    self.title = [NSString stringWithFormat:@"Edu Profile"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark IBAction Methods

- (IBAction)updateButtonClicked:(id)sender
{
    
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
