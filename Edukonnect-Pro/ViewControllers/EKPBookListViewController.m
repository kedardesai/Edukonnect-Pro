//
//  EKPBookListViewController.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/19/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPBookListViewController.h"

@interface EKPBookListViewController ()

- (void)callAPI;
- (void)parseData;

@end

@implementation EKPBookListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.topItem.title = @"";
    
    self.bookListArray = [[NSMutableArray alloc] init];
    
    [self.bookListTableView setBackgroundView:nil];
    [self.bookListTableView setBackgroundColor:[UIColor loadScreenBackgroundColor]];
    [self.bookListTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.isNextPageAvailable = YES;
    self.isFirstLoad = YES;
    [self parseData];
}

- (void)viewWillAppear:(BOOL)animated
{
    switch (self.bookListType) {
        case 0:
            self.title = @"Hello";
            break;
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
