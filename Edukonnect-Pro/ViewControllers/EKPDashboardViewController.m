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

/*
#pragma mark show Navigation bar Option

- (IBAction) showTablePopUp:(id) sender {
    if (self.tablesPopoverController == nil) {
        
        TablesPopOverViewController *tables = [[TablesPopOverViewController alloc]initWithNibName:@"TablesPopOverViewController" bundle:[NSBundle mainBundle]];
        
        UIPopoverController *popover = [[UIPopoverController alloc] initWithContentViewController:tables];
        
        popover.delegate = self;
        popover.popoverContentSize=CGSizeMake(280.0, 327.0);
        [tables release];
        
        self.tablesPopoverController = popover;
        
        [self.tablesPopoverController presentPopoverFromBarButtonItem:sender
                                             permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
        
    } else {
        [self.tablesPopoverController dismissPopoverAnimated: YES];
        self.tablesPopeverController = nil;
    }
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
