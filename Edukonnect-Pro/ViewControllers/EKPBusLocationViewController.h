//
//  EKPBusLocationViewController.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/16/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "EKPTransport.h"

@interface EKPBusLocationViewController : UIViewController <MKMapViewDelegate, MKAnnotation>

@property (nonatomic, strong) EKPTransport *selectedTransportObj;

@property (nonatomic, strong) MKMapView *mapView;

@end
