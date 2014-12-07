//
//  EKPNoticeListViewController.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/7/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPNoticeListViewController.h"

@interface EKPNoticeListViewController ()

@end

@implementation EKPNoticeListViewController

#pragma mark UIViewLifeCycle Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.topItem.title = @"";
    
    [self.noticeListTableView setBackgroundView:nil];
    [self.noticeListTableView setBackgroundColor:[UIColor loadScreenBackgroundColor]];
    [self.noticeListTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.title = [NSString stringWithFormat:@"Notice List"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark UITableViewDelegate and UITableViewDatasource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"noticeCell"];
    
    if (!cell) {
        cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"noticeCell"];
    }
    
//    cell.textLabel.text = @"Hello";
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [cell setBackgroundColor:[UIColor loadScreenBackgroundColor]];
    
    UIView *contentView = [cell.contentView viewWithTag:100];
    
    UILabel *headingLabel = (UILabel *) [contentView viewWithTag:101];
    [headingLabel setText:@"Heading"];
    
    UILabel *dateLabel = (UILabel *) [contentView viewWithTag:102];
    [dateLabel setText:@"Date & Time"];
    
    UITextView *messageTextView = (UITextView *) [contentView viewWithTag:103];
    [messageTextView setText:@"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."];
    [messageTextView setTextColor:[UIColor whiteColor]];
    
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
