//
//  EKPTransportViewController.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/16/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPTransportViewController.h"
#import "EKPTransportAPI.h"
#import "EKPBusLocationViewController.h"

@interface EKPTransportViewController ()

- (void)tapGestureRecognized:(UITapGestureRecognizer *)tapGesture;

@end

@implementation EKPTransportViewController

#pragma mark UIViewLifeCycle Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.transportListArray = [[NSMutableArray alloc] init];
    self.transportListArray = [EKPTransportAPI getTransportList];
    
    [self.transportListTableView setBackgroundView:nil];
    [self.transportListTableView setBackgroundColor:[UIColor loadScreenBackgroundColor]];
    [self.transportListTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    self.navigationController.navigationBar.topItem.title = @"";
}

- (void)viewWillAppear:(BOOL)animated
{
    self.title = @"Transport List";
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
    return [self.transportListArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reuseIdentifier = @"transportCell";
    
    UITableViewCell *cell = [self.transportListTableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    EKPTransport *transportObj = [self.transportListArray objectAtIndex:indexPath.row];
    
    UIView *cotentView = [cell.contentView viewWithTag:100];
    [cotentView setUserInteractionEnabled:YES];
    
    UILabel *routeNameLabel = (UILabel *) [cotentView viewWithTag:101];
    [routeNameLabel setText:transportObj.transportRouteName];
    
    UILabel *routeFareLabel = (UILabel *) [cotentView viewWithTag:102];
    [routeFareLabel setText:[NSString stringWithFormat:@"\u20B9 %@",transportObj.transportRouteFare]];
    
    UILabel *routeDescLabel = (UILabel *) [cotentView viewWithTag:103];
    [routeDescLabel setText:transportObj.transportDesc];
    
    UILabel *driverNameLabel = (UILabel *) [cotentView viewWithTag:105];
    [driverNameLabel setText:transportObj.transportDriverName];
    
    UILabel *mobile1Label = (UILabel *) [cotentView viewWithTag:107];
    [mobile1Label setText:transportObj.transportMobile1];
    [mobile1Label setUserInteractionEnabled:YES];
    UITapGestureRecognizer *mobile1TapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognized:)];
    mobile1TapGesture.numberOfTapsRequired=1;
    mobile1TapGesture.delegate=self;
    mobile1TapGesture.delaysTouchesBegan=YES;
    mobile1TapGesture.cancelsTouchesInView=YES;
    [mobile1Label addGestureRecognizer:mobile1TapGesture];
    
    UILabel *mobile2Label = (UILabel *) [cotentView viewWithTag:109];
    [mobile2Label setText:transportObj.transportMobile2];
    [mobile2Label setUserInteractionEnabled:YES];
    UITapGestureRecognizer *mobile2TapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognized:)];
    mobile2TapGesture.numberOfTapsRequired=1;
    mobile2TapGesture.delegate=self;
    mobile2TapGesture.delaysTouchesBegan=YES;
    mobile2TapGesture.cancelsTouchesInView=YES;
    [mobile2Label addGestureRecognizer:mobile2TapGesture];
    
    return cell;
}


#pragma mark UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedTransportObj = [self.transportListArray objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"TransportToBusLocationSegue" sender:self];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"TransportToBusLocationSegue"]) {
        EKPBusLocationViewController *busLocVC = (EKPBusLocationViewController *) segue.destinationViewController;
        busLocVC.selectedTransportObj = self.selectedTransportObj;
    }
}


#pragma mark Code-Reusable Methods

- (void)tapGestureRecognized:(UITapGestureRecognizer *)tapGesture
{
    UILabel *mobileLabel = (UILabel *) tapGesture.view;
    NSURL *telURL = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", mobileLabel.text]];
    [[UIApplication sharedApplication] openURL:telURL];
}


@end
