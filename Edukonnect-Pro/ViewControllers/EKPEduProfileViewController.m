//
//  EKPEduProfileViewController.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/6/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPEduProfileViewController.h"
#import "EKPProfileAPI.h"

@interface EKPEduProfileViewController ()

- (BOOL)validateInputs;

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
    self.currentProfile = [EKPSingleton loadCurrentProfile];
    
    // For SchoolCode
    [self.schoolCodeLabel setTextColor:[UIColor loadComponentNormalColor]];
    [self.schoolCodeTextField setNormalBorderColor:[UIColor loadComponentNormalColor] errorBorderColor:[UIColor loadComponentAlertColor] normalTextColor:[UIColor blackColor] errorTextColor:[UIColor blackColor] normalBorderWidth:0.6 errorBorderWidth:0.6];
    [self.schoolCodeTextField setTextFieldtype:kTextFieldTypeCustom];
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
    [self.grNoTextField setTextFieldtype:kTextFieldTypeCustom];
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
    
    if (self.currentProfile) {
        if ([self.currentProfile.profileSchoolCode length]>0) {
            [self.schoolCodeTextField setText:self.currentProfile.profileSchoolCode];
        }
        if ([self.currentProfile.profileGrNo length]>0) {
            [self.grNoTextField setText:self.currentProfile.profileGrNo];
        }
        if ([self.currentProfile.profileParentName length]>0) {
            [self.parentNameTextField setText:self.currentProfile.profileParentName];
        }
        if ([self.currentProfile.profilePassword length]>0) {
            [self.passwordTextField setText:self.currentProfile.profilePassword];
            [self.confirmPasswordTextField setText:self.currentProfile.profilePassword];
        }
        if ([self.currentProfile.profileRelation length]>0) {
            [self.passwordTextField setText:self.currentProfile.profileRelation];
        }
        if ([self.currentProfile.profileContactNumber length]>0) {
            [self.contactNoTextField setText:self.currentProfile.profileContactNumber];
        }
        if ([self.currentProfile.profileAddress length]>0) {
            [self.addressTextField setText:self.currentProfile.profileAddress];
        }
        if ([self.currentProfile.profileProfession length]>0) {
            [self.addressTextField setText:self.currentProfile.profileProfession];
        }
    } else {
        if ([self.currentStudent.studentSchoolCode length]>0) {
            [self.schoolCodeTextField setText:self.currentStudent.studentSchoolCode];
        }
        if ([self.currentStudent.studentGRNo length]>0) {
            [self.grNoTextField setText:self.currentStudent.studentGRNo];
        }
        if ([self.currentStudent.studentName length]>0) {
            [self.parentNameTextField setText:self.currentStudent.studentName];
        }
        if ([self.currentStudent.studentPassword length]>0) {
            [self.passwordTextField setText:self.currentStudent.studentPassword];
        }
        if ([self.currentStudent.studentPassword length]>0) {
            [self.confirmPasswordTextField setText:self.currentStudent.studentPassword];
        }
        if ([self.currentUser.userMobile length]>0) {
            [self.contactNoTextField setText:self.currentUser.userMobile];
        }
        if ([self.currentStudent.studentAddress length]>0) {
            [self.addressTextField setText:self.currentStudent.studentAddress];
        }
    }
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
    BOOL isValidInputs = [self validateInputs];
    if (isValidInputs) {
        self.currentProfile.profileSchoolCode = self.schoolCodeTextField.text;
        self.currentProfile.profileGrNo = self.grNoTextField.text;
        self.currentProfile.profileParentName = self.parentNameTextField.text;
        self.currentProfile.profilePassword = self.passwordTextField.text;
        self.currentProfile.profileRelation = self.relationTextField.text;
        self.currentProfile.profileContactNumber = self.contactNoTextField.text;
        self.currentProfile.profileAddress = self.addressTextField.text;
        self.currentProfile.profileProfession = self.professionTextField.text;
        
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        
        __block BOOL status;
        
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
            // Do something...
            status = [EKPProfileAPI updateProfile:self.currentProfile];
            if (status) {
                // school_details
                [EKPUtility showAlertWithTitle:SUCCESS_TITLE andMessage:PROFILE_UPDATED];
                [EKPSingleton saveCurrentProfile:self.currentProfile];
                
            } else {
                [EKPUtility showAlertWithTitle:FAILED_TITLE andMessage:PROFILE_NOT_UPDATED];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                [MBProgressHUD hideHUDForView:self.view animated:YES];
            });
        });
    }
}


#pragma mark Validation Methods

- (BOOL)validateInputs
{
    [self.parentNameTextField validateTextFieldAnimated:YES];
    [self.passwordTextField validateTextFieldAnimated:YES];
    [self.confirmPasswordTextField validateTextFieldAnimated:YES];
    [self.relationTextField validateTextFieldAnimated:YES];
    [self.contactNoTextField validateTextFieldAnimated:YES];
    [self.addressTextField validateTextFieldAnimated:YES];
    [self.professionTextField validateTextFieldAnimated:YES];
    
    if (self.parentNameTextField.isValid && self.passwordTextField.isValid && self.confirmPasswordTextField.isValid && self.relationTextField.isValid && self.contactNoTextField.isValid && self.addressTextField.isValid && self.professionTextField.isValid) {
        return YES;
    }
    
    return NO;
}


#pragma mark KDTextFieldDelegate Methods

- (void)onError:(NSError *)error withTextField:(KDTextField *)textField
{
    //    [EKPUtility showAlertWithTitle:@"Error - Invalid Text" andMessage:[error localizedDescription]];
    if (textField == self.parentNameTextField) {
        [self.parentNameLabel setTextColor:[UIColor loadComponentAlertColor]];
        
    } else if (textField == self.passwordTextField) {
        [self.passwordLabel setTextColor:[UIColor loadComponentAlertColor]];
        
    } else if (textField == self.confirmPasswordTextField) {
        [self.confirmPasswordLabel setTextColor:[UIColor loadComponentAlertColor]];
        
    } else if (textField == self.relationTextField) {
        [self.relationLabel setTextColor:[UIColor loadComponentAlertColor]];
        
    } else if (textField == self.contactNoTextField) {
        [self.contactNoLabel setTextColor:[UIColor loadComponentAlertColor]];
        
    } else if (textField == self.addressTextField) {
        [self.addressLabel setTextColor:[UIColor loadComponentAlertColor]];
        
    } else if (textField == self.professionTextField) {
        [self.professionLabel setTextColor:[UIColor loadComponentAlertColor]];
        
    }
}

- (void)onSucess:(KDTextField *)textField
{
    //    [self showAlertViewWithTitle:@"Success" andMessage:textField.text];
}

- (BOOL)addCustomValidation:(KDTextField *)textField
{
    if ([[textField text] length] == 0) {
        textField.isValid = NO;
        return NO;
    }
    
    if (textField == self.confirmPasswordTextField) {
        if (![[self.confirmPasswordTextField text] isEqualToString:[self.passwordTextField text]]) {
            textField.isValid = NO;
            return NO;
        }
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
