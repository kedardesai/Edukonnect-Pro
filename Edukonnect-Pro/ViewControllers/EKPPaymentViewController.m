//
//  EKPPaymentViewController.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/20/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPPaymentViewController.h"
#import "EKPFeesAPI.h"
#import "EKPPayment.h"

@interface EKPPaymentViewController ()

@end

@implementation EKPPaymentViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.navigationController.navigationBar.topItem.title = @"";
    
    self.paymentListArray = [[NSMutableArray alloc] init];
    
    [self.paymentListTableView setBackgroundView:nil];
    [self.paymentListTableView setBackgroundColor:[UIColor loadScreenBackgroundColor]];
    [self.paymentListTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        // Do something...
        
        self.paymentListArray = [EKPFeesAPI getPaymentList];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            [self.paymentListTableView reloadData];
        });
    });
    
}

- (void)viewWillAppear:(BOOL)animated
{
    self.title = [NSString stringWithFormat:@"Fees"];
    self.paymentListTableView.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.paymentListTableView.delegate = nil;
//    self.paymentListTableView = nil;
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
    return [self.paymentListArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reuseIdentifier = @"paymentCell";
    
    UITableViewCell *cell = [self.paymentListTableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setBackgroundColor:[UIColor loadScreenBackgroundColor]];
    
    EKPPayment *paymentTemp = [self.paymentListArray objectAtIndex:indexPath.row];
    
    UIView *contentView = [cell.contentView viewWithTag:100];
    
    UILabel *nameLabel = (UILabel *) [contentView viewWithTag:101];
    [nameLabel setText:paymentTemp.paymentTitle];
    
    UILabel *priceLabel = (UILabel *) [contentView viewWithTag:102];
    [priceLabel setText:[NSString stringWithFormat:@"\u20B9 %@", paymentTemp.paymentAmount]];
    
    UILabel *dueDateLabel = (UILabel *) [contentView viewWithTag:104];
    [dueDateLabel setText:[EKPUtility getDateForTimeStamp:paymentTemp.paymentDueDate]];
    
    UILabel *statusLabel = (UILabel *) [contentView viewWithTag:106];
    [statusLabel setText:paymentTemp.paymentStatus];
    
    UITextView *descTextView = (UITextView *) [contentView viewWithTag:107];
    [descTextView setText:paymentTemp.paymentDesc];
    [descTextView setTextColor:[UIColor whiteColor]];
    
    return cell;
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
