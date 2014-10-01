//
//  EKPLoginViewController.m
//  Edukonnect-Pro
//
//  Created by Dinesh Panwar on 30/09/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPLoginViewController.h"
#import "KDTextField.h"

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
                reUseIdentifier = @"LoginSchoolcodeCell";
                textFieldType = kTextFieldTypeNumber;
                break;
                
            case 1:
                reUseIdentifier = @"LoginUsernameCell";
                textFieldType = kTextFieldTypeDefault;
                break;
                
            case 2:
                reUseIdentifier = @"LoginPasswordCell";
                textFieldType = kTextFieldTypeDefault;
                break;
                
            default:
                reUseIdentifier = @"Cell";
                textFieldType = kTextFieldTypeDefault;
                break;
        }
        
    } else {
        reUseIdentifier = @"LoginSubmitCell";
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


#pragma mark - Navigation

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if ([identifier isEqualToString:@"LoginDashboardSegue"]) {
        // 1. Calidate inputs
        // 2. Call Registration API
        // 3. Get Returned Data
        // 4. Store Returned Data For Future Use
    }
    
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
