//
//  EKPEvent.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/10/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EKPEvent : NSObject

@property (nonatomic, strong) NSString *eventId;
@property (nonatomic, strong) NSString *eventName;
@property (nonatomic, strong) NSString *eventClassId;
@property (nonatomic, strong) NSString *eventVenue;
@property (nonatomic, strong) NSString *eventImage;
@property (nonatomic, strong) NSString *eventCreatedBy;
@property (nonatomic, strong) NSString *eventCreatedDate;
@property (nonatomic, strong) NSString *eventEventDate;
@property (nonatomic, strong) NSString *eventEventTime;
@property (nonatomic, strong) NSString *eventIsGoingControlToShow;

@end
