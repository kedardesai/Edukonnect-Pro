//
//  EKPBusLocationViewController.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/16/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPBusLocationViewController.h"
#import "EKPTransportAPI.h"
#import "EKPMapPin.h"

@interface EKPBusLocationViewController ()

@end

@implementation EKPBusLocationViewController

#pragma mark UIViewLifeCycle Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.topItem.title = @"";
    
    [self.view setBackgroundColor:[UIColor loadScreenBackgroundColor]];
    
    self.mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    self.mapView.mapType = MKMapTypeHybrid;
    self.mapView.delegate = self;
    
    NSMutableDictionary *coordinateDict = [EKPTransportAPI getLocationForBus:self.selectedTransportObj.transportId];
    double latitude = [[coordinateDict objectForKey:TRANSPORT_API_LATITUDE] doubleValue];
    double longitude = [[coordinateDict objectForKey:TRANSPORT_API_LONGITUDE] doubleValue];
    
    CLLocationCoordinate2D busLocation;
    busLocation.latitude = latitude;
    busLocation.longitude= longitude;
    EKPMapPin *pin = [[EKPMapPin alloc] initWithCoordinates:busLocation placeName:@"Start" description:@""];
    [self.mapView addAnnotation:pin];
    
    [self.view addSubview:self.mapView];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.title = self.selectedTransportObj.transportRouteName;
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
