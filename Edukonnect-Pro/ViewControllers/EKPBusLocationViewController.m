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

@property (nonatomic, strong) EKPMapPin *pin;

- (void)showBusLocation:(id)sender;

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
    
    [NSTimer scheduledTimerWithTimeInterval:2.0
                                     target:self
                                   selector:@selector(showBusLocation:)
                                   userInfo:nil
                                    repeats:YES];
    
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


#pragma mark Code-Reusable Methods

- (void)showBusLocation:(id)sender
{
    NSMutableDictionary *coordinateDict = [EKPTransportAPI getLocationForBus:self.selectedTransportObj.transportId];
    double latitude = [[coordinateDict objectForKey:TRANSPORT_API_LATITUDE] doubleValue];
    double longitude = [[coordinateDict objectForKey:TRANSPORT_API_LONGITUDE] doubleValue];
    
    CLLocationCoordinate2D busLocation;
    busLocation.latitude = latitude;
    busLocation.longitude= longitude;
    _pin = [[EKPMapPin alloc] initWithCoordinates:busLocation placeName:@"Start" description:@""];
    [self.mapView addAnnotation:_pin];
    [self.mapView setMapType:MKMapTypeStandard];
    
    MKCoordinateRegion region = { {0.0, 0.0 }, { 0.0, 0.0 } };
    region.center.latitude = latitude ;
    region.center.longitude = longitude;
    region.span.longitudeDelta = 0.015f;
    region.span.latitudeDelta = 0.015f;
    [self.mapView setRegion:region animated:YES];
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
