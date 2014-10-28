//
//  EKPDashboardViewController.m
//  Edukonnect-Pro
//
//  Created by Dinesh Panwar on 01/10/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPDashboardViewController.h"

@interface EKPDashboardViewController ()

@end

@implementation EKPDashboardViewController

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
}

- (void)viewWillAppear:(BOOL)animated
{
    self.title = [NSString stringWithFormat:@"%@", DASHBOARD_SCREEN_TITLE];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
