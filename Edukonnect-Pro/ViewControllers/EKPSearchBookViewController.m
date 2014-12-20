//
//  EKPSearchBookViewController.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/19/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPSearchBookViewController.h"
#import "EKPLibraryAPI.h"
#import "EKPBookListViewController.h"

@interface EKPSearchBookViewController ()

@end

@implementation EKPSearchBookViewController

#pragma mark UIViewLifeCycle Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor loadScreenBackgroundColor]];
    
    [self.keywordLabel setTextColor:[UIColor loadComponentNormalColor]];
    
    [self.keywordTextField setTextFieldtype:kTextFieldTypeCustom];
    [self.keywordTextField setIsAnimated:YES];
    [self.keywordTextField setNormalBorderColor:[UIColor loadComponentNormalColor] errorBorderColor:[UIColor loadComponentAlertColor] normalTextColor:[UIColor blackColor] errorTextColor:[UIColor blackColor] normalBorderWidth:0.6 errorBorderWidth:0.6];
    self.keywordTextField.layer.cornerRadius = 2.0;
    self.keywordTextField.layer.shadowOffset = CGSizeMake(1, 1);
    self.keywordTextField.layer.shadowRadius = 5;
    self.keywordTextField.layer.shadowOpacity = 0.5;
    
    self.searchBtn.layer.cornerRadius = 2.0;
    self.searchBtn.layer.masksToBounds = NO;
    self.searchBtn.layer.shadowOffset = CGSizeMake(2, 2);
    self.searchBtn.layer.shadowRadius = 5;
    self.searchBtn.layer.shadowOpacity = 0.5;
    [self.searchBtn.titleLabel setShadowOffset:CGSizeMake(1.0f, 1.0f)];
    
    self.navigationController.navigationBar.topItem.title = @"";
}

- (void)viewWillAppear:(BOOL)animated
{
    self.title = [NSString stringWithFormat:@"%@", SEARCH_BOOK_SCREEN_TITLE];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark KDTextFieldDelegate Methods

- (void)onError:(NSError *)error withTextField:(KDTextField *)textField
{
    [self.keywordLabel setTextColor:[UIColor loadComponentAlertColor]];
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

#pragma mark IBAction Methods

- (IBAction)searchBtnClicked:(id)sender
{
    [self performSegueWithIdentifier:@"SearchToBookListSegue" sender:self];
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"SearchToBookListSegue"]) {
        NSMutableDictionary *resultDict = [EKPLibraryAPI getBooksForKeyword:self.keywordTextField.text andForPageId:1];
        EKPBookListViewController *bookListVC = (EKPBookListViewController *) segue.destinationViewController;
        bookListVC.bookListDict = [[NSMutableDictionary alloc] initWithDictionary:resultDict];
        bookListVC.bookListType = self.bookListType;
        bookListVC.pageId = 1;
        bookListVC.searchKeyword = self.keywordTextField.text;
    }
}

@end
