//
//  EKPLeaveAppicationViewController.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 4/17/15.
//  Copyright (c) 2015 Kedar Desai. All rights reserved.
//

#import "EKPLeaveAppicationViewController.h"
#import "EKPLeaveAPI.h"
#import "EKPLeave.h"

@interface EKPLeaveAppicationViewController ()

//- (void)onKeyboardHide:(id)sender

@end

@implementation EKPLeaveAppicationViewController


#pragma mark UIViewLifeCycle Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.leaveStartDay setTextFieldtype:kTextFieldTypeNumber];
    [self.leaveStartDay setIsAnimated:YES];
    [self.leaveStartDay setDelegate:self];
    [self.leaveStartDay setNormalBorderColor:[UIColor loadComponentNormalColor] errorBorderColor:[UIColor loadComponentAlertColor] normalTextColor:[UIColor blackColor] errorTextColor:[UIColor blackColor] normalBorderWidth:0.6 errorBorderWidth:0.6];
    self.leaveStartDay.layer.cornerRadius = 2.0;
    self.leaveStartDay.layer.shadowOffset = CGSizeMake(1, 1);
    self.leaveStartDay.layer.shadowRadius = 5;
    self.leaveStartDay.layer.shadowOpacity = 0.5;
    [self.leaveStartDay setReturnKeyType:UIReturnKeyDone];
    [self.leaveStartDay addTarget:self action:@selector(textFieldFinished:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    [self.leaveStartMonth setTextFieldtype:kTextFieldTypeNumber];
    [self.leaveStartMonth setIsAnimated:YES];
    [self.leaveStartMonth setDelegate:self];
    [self.leaveStartMonth setNormalBorderColor:[UIColor loadComponentNormalColor] errorBorderColor:[UIColor loadComponentAlertColor] normalTextColor:[UIColor blackColor] errorTextColor:[UIColor blackColor] normalBorderWidth:0.6 errorBorderWidth:0.6];
    self.leaveStartMonth.layer.cornerRadius = 2.0;
    self.leaveStartMonth.layer.shadowOffset = CGSizeMake(1, 1);
    self.leaveStartMonth.layer.shadowRadius = 5;
    self.leaveStartMonth.layer.shadowOpacity = 0.5;
    
    [self.leaveStartYear setTextFieldtype:kTextFieldTypeNumber];
    [self.leaveStartYear setIsAnimated:YES];
    [self.leaveStartYear setDelegate:self];
    [self.leaveStartYear setNormalBorderColor:[UIColor loadComponentNormalColor] errorBorderColor:[UIColor loadComponentAlertColor] normalTextColor:[UIColor blackColor] errorTextColor:[UIColor blackColor] normalBorderWidth:0.6 errorBorderWidth:0.6];
    self.leaveStartYear.layer.cornerRadius = 2.0;
    self.leaveStartYear.layer.shadowOffset = CGSizeMake(1, 1);
    self.leaveStartYear.layer.shadowRadius = 5;
    self.leaveStartYear.layer.shadowOpacity = 0.5;
    
    [self.leaveEndDay setTextFieldtype:kTextFieldTypeNumber];
    [self.leaveEndDay setIsAnimated:YES];
    [self.leaveEndDay setDelegate:self];
    [self.leaveEndDay setNormalBorderColor:[UIColor loadComponentNormalColor] errorBorderColor:[UIColor loadComponentAlertColor] normalTextColor:[UIColor blackColor] errorTextColor:[UIColor blackColor] normalBorderWidth:0.6 errorBorderWidth:0.6];
    self.leaveEndDay.layer.cornerRadius = 2.0;
    self.leaveEndDay.layer.shadowOffset = CGSizeMake(1, 1);
    self.leaveEndDay.layer.shadowRadius = 5;
    self.leaveEndDay.layer.shadowOpacity = 0.5;
    
    [self.leaveEndMonth setTextFieldtype:kTextFieldTypeNumber];
    [self.leaveEndMonth setIsAnimated:YES];
    [self.leaveEndMonth setDelegate:self];
    [self.leaveEndMonth setNormalBorderColor:[UIColor loadComponentNormalColor] errorBorderColor:[UIColor loadComponentAlertColor] normalTextColor:[UIColor blackColor] errorTextColor:[UIColor blackColor] normalBorderWidth:0.6 errorBorderWidth:0.6];
    self.leaveEndMonth.layer.cornerRadius = 2.0;
    self.leaveEndMonth.layer.shadowOffset = CGSizeMake(1, 1);
    self.leaveEndMonth.layer.shadowRadius = 5;
    self.leaveEndMonth.layer.shadowOpacity = 0.5;
    
    [self.leaveEndYear setTextFieldtype:kTextFieldTypeNumber];
    [self.leaveEndYear setIsAnimated:YES];
    [self.leaveEndYear setDelegate:self];
    [self.leaveEndYear setNormalBorderColor:[UIColor loadComponentNormalColor] errorBorderColor:[UIColor loadComponentAlertColor] normalTextColor:[UIColor blackColor] errorTextColor:[UIColor blackColor] normalBorderWidth:0.6 errorBorderWidth:0.6];
    self.leaveEndYear.layer.cornerRadius = 2.0;
    self.leaveEndYear.layer.shadowOffset = CGSizeMake(1, 1);
    self.leaveEndYear.layer.shadowRadius = 5;
    self.leaveEndYear.layer.shadowOpacity = 0.5;
    
    [self.leaveNote setTextFieldtype:kTextFieldTypeString];
    [self.leaveNote setIsAnimated:YES];
    [self.leaveNote setDelegate:self];
    [self.leaveNote setNormalBorderColor:[UIColor loadComponentNormalColor] errorBorderColor:[UIColor loadComponentAlertColor] normalTextColor:[UIColor blackColor] errorTextColor:[UIColor blackColor] normalBorderWidth:0.6 errorBorderWidth:0.6];
    self.leaveNote.layer.cornerRadius = 2.0;
    self.leaveNote.layer.shadowOffset = CGSizeMake(1, 1);
    self.leaveNote.layer.shadowRadius = 5;
    self.leaveNote.layer.shadowOpacity = 0.5;
    
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(onKeyboardHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark IBAction Methods

- (IBAction)submitBtnClicked:(id)senderBtn
{
    [_leaveStartDay validateTextFieldAnimated:YES];
    [_leaveStartMonth validateTextFieldAnimated:YES];
    [_leaveStartYear validateTextFieldAnimated:YES];
    [_leaveEndDay validateTextFieldAnimated:YES];
    [_leaveEndMonth validateTextFieldAnimated:YES];
    [_leaveEndYear validateTextFieldAnimated:YES];
    [_leaveNote validateTextFieldAnimated:YES];
    
    if ([_leaveStartDay isValid] && [_leaveStartMonth isValid] && [_leaveStartYear isValid] && [_leaveEndDay isValid] && [_leaveEndMonth isValid] && [_leaveEndYear isValid] && [_leaveNote isValid]) {
        // Call API
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"dd/mm/yyyy"];
        EKPLeave *leaveObj = [[EKPLeave alloc] init];
        
        NSDate *startDate = [dateFormat dateFromString:[NSString stringWithFormat:@"%@/%@/%@", _leaveStartDay.text, _leaveStartMonth.text, _leaveStartYear.text]];
        NSDate *endDate = [dateFormat dateFromString:[NSString stringWithFormat:@"%@/%@/%@", _leaveEndDay.text, _leaveEndMonth.text, _leaveEndYear.text]];
        
        NSTimeInterval fromSeconds = [startDate timeIntervalSince1970];
        leaveObj.leaveDtFrom = [NSString stringWithFormat:@"%f", fromSeconds];
        
        NSTimeInterval toSeconds = [endDate timeIntervalSince1970];
        leaveObj.leaveDtTo = [NSString stringWithFormat:@"%f", toSeconds];
        
        leaveObj.leaveNote = _leaveNote.text;
        
        if (_leaveTypeSwitch.isOn) {
            leaveObj.leaveDayType = @"half_day";
        } else {
            leaveObj.leaveDayType = @"full_day";
        }
        
        [EKPLeaveAPI applyLeaveWithObject:leaveObj];
    }
}


#pragma mark UITextFieldDelegate Methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField.tag<106) { // For Dates
        if (([_leaveStartDay.text length]>0) && ([_leaveStartMonth.text length]>0) && ([_leaveStartYear.text length]>0) && ([_leaveEndDay.text length]>0) && ([_leaveEndMonth.text length]>0) && ([_leaveEndYear.text length]>0)) {
            
            NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
            [dateFormat setDateFormat:@"dd/mm/yyyy"];
            
            NSDate *startDate = [dateFormat dateFromString:[NSString stringWithFormat:@"%@/%@/%@", _leaveStartDay.text, _leaveStartMonth.text, _leaveStartYear.text]];
            NSDate *endDate = [dateFormat dateFromString:[NSString stringWithFormat:@"%@/%@/%@", _leaveEndDay.text, _leaveEndMonth.text, _leaveEndYear.text]];
            
            NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
            NSDateComponents *components = [gregorianCalendar components:NSDayCalendarUnit
                                                                fromDate:startDate
                                                                  toDate:endDate
                                                                 options:0];
            if ([components day] == 0) {
                [_leaveTypeLabel setHidden:NO];
                [_leaveTypeSwitch setHidden:NO];
                
            } else if ([components day]>0){
                [_leaveTypeLabel setHidden:NO];
                [_leaveTypeSwitch setHidden:NO];
            }
            
            if ([components day] < 0) {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Enter Valid Dates." message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alertView show];
                
            } else {
                NSDateComponents *componentsToday = [gregorianCalendar components:NSDayCalendarUnit
                                                                         fromDate:[NSDate date]
                                                                           toDate:startDate
                                                                          options:0];
                if (componentsToday < 0) {
                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Enter Valid Dates." message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    [alertView show];
                }
            }
        }
    }
    
    return YES;
}

- (void)doneWithNumberPad:(KDTextField *)textField
{
    NSLog(@"Milala");
    if (textField.tag<106) { // For Dates
        if (([_leaveStartDay.text length]>0) && ([_leaveStartMonth.text length]>0) && ([_leaveStartYear.text length]>0) && ([_leaveEndDay.text length]>0) && ([_leaveEndMonth.text length]>0) && ([_leaveEndYear.text length]>0)) {
            
            NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
            [dateFormat setDateFormat:@"dd/mm/yyyy"];
            
            NSDate *startDate = [dateFormat dateFromString:[NSString stringWithFormat:@"%@/%@/%@", _leaveStartDay.text, _leaveStartMonth.text, _leaveStartYear.text]];
            NSDate *endDate = [dateFormat dateFromString:[NSString stringWithFormat:@"%@/%@/%@", _leaveEndDay.text, _leaveEndMonth.text, _leaveEndYear.text]];
            
            NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
            NSDateComponents *components = [gregorianCalendar components:NSDayCalendarUnit
                                                                fromDate:startDate
                                                                  toDate:endDate
                                                                 options:0];
            
            NSDateComponents *componentsToday = [gregorianCalendar components:NSDayCalendarUnit
                                                                fromDate:[NSDate date]
                                                                  toDate:startDate
                                                                 options:0];
            
            if ([componentsToday day]<0) {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Enter Valid Dates." message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alertView show];
            }
            
            if ([components day] == 0) {
                [_leaveTypeLabel setHidden:NO];
                [_leaveTypeSwitch setHidden:NO];
                
            } else if ([components day]>0){
                [_leaveTypeLabel setHidden:YES];
                [_leaveTypeSwitch setHidden:YES];
            }
            
            if ([components day] < 0) {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Enter Valid Dates." message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alertView show];
                
            } else {
                NSDateComponents *componentsToday = [gregorianCalendar components:NSDayCalendarUnit
                                                                         fromDate:[NSDate date]
                                                                           toDate:startDate
                                                                          options:0];
                if (componentsToday < 0) {
                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Enter Valid Dates." message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    [alertView show];
                }
            }
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
