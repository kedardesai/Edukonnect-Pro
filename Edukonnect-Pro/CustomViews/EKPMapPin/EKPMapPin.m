//
//  EKPMapPin.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/16/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPMapPin.h"

@implementation EKPMapPin

- (id)initWithCoordinates:(CLLocationCoordinate2D)location placeName:placeName description:description
{
    self = [super init];
    if (self != nil) {
        self.coordinate = location;
        self.title = placeName;
    }
    return self;
}

@end
