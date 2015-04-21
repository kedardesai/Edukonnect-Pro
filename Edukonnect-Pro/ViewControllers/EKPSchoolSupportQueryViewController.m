//
//  EKPSchoolSupportQueryViewController.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 4/19/15.
//  Copyright (c) 2015 Kedar Desai. All rights reserved.
//

#import "EKPSchoolSupportQueryViewController.h"
#import "EKPSchoolSupport.h"
#import "EKPSchoolSupportAPI.h"
#import "EKPStudent.h"

@interface EKPSchoolSupportQueryViewController ()

@end

@implementation EKPSchoolSupportQueryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.questionTextField setTextFieldtype:kTextFieldTypeString];
    [self.questionTextField setIsAnimated:YES];
    [self.questionTextField setDelegate:self];
    [self.questionTextField setNormalBorderColor:[UIColor loadComponentNormalColor] errorBorderColor:[UIColor loadComponentAlertColor] normalTextColor:[UIColor blackColor] errorTextColor:[UIColor blackColor] normalBorderWidth:0.6 errorBorderWidth:0.6];
    self.questionTextField.layer.cornerRadius = 2.0;
    self.questionTextField.layer.shadowOffset = CGSizeMake(1, 1);
    self.questionTextField.layer.shadowRadius = 5;
    self.questionTextField.layer.shadowOpacity = 0.5;
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.topItem.title = @"";
    self.title = [NSString stringWithFormat:@"%@", SCHOOL_SUPORT_QUERY_SCREEN_TITLE];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark IBAction Methods

- (IBAction)submitBtnClicked:(id)sender
{
    [_questionTextField validateTextFieldAnimated:YES];
    if (_questionTextField.isValid) {
        EKPSchoolSupport *schoolSupportObj = [[EKPSchoolSupport alloc] init];
        EKPStudent *studentObj = [EKPSingleton loadStudent];
        schoolSupportObj.schoolSupportCreatedBy = studentObj.studentName;
        schoolSupportObj.schoolSupportCreatedDate = [NSString stringWithFormat:@"%f", [[NSDate date] timeIntervalSince1970]];
        schoolSupportObj.schoolSupportQuestion = _questionTextField.text;
        BOOL result = [EKPSchoolSupportAPI submitNewSchoolSupportQuery:schoolSupportObj];
        if (result) {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Query Submitted Successfully" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
        }
    }
}

#pragma mark KDTextFieldDelegate Methods

- (void)onSucess:(KDTextField *)textField
{
    NSLog(@"Successful.");
}

- (void)onError:(NSError *)error withTextField:(KDTextField *)textField
{
    NSLog(@"ERROR ::: %@",[error localizedDescription]);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
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
