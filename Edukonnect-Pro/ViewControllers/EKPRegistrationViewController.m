//
//  EKPRegistrationViewController.m
//  Edukonnect-Pro
//
//  Created by Dinesh Panwar on 29/09/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPRegistrationViewController.h"
#import "KDTextField.h"

@interface EKPRegistrationViewController ()

@end

@implementation EKPRegistrationViewController

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
    NSLog(@"%@",[UIImage loadScreenBackgroundImage]);
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage loadScreenBackgroundImage]]];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage loadNavigationBarImage] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.title = [NSString stringWithFormat:@"%@", REGISTRATION_SCREEN_TITLE];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
