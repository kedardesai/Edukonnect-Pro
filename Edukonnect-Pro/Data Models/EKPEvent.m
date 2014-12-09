//
//  EKPEvent.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/10/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPEvent.h"

@implementation EKPEvent

- (id)init
{
    self = [super init];
    if (self) {
        self.eventId = @"";
        self.eventName = @"";
        self.eventClassId = @"";
        self.eventVenue = @"";
        self.eventImage = @"";
        self.eventCreatedBy = @"";
        self.eventCreatedDate = @"";
        self.eventEventDate = @"";
        self.eventEventTime = @"";
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if (self != nil)
    {
        //decode the properties
        self.eventId = [decoder decodeObjectForKey:@"eventId"];
        self.eventName = [decoder decodeObjectForKey:@"eventName"];
        self.eventClassId = [decoder decodeObjectForKey:@"eventClassId"];
        self.eventVenue = [decoder decodeObjectForKey:@"eventVenue"];
        self.eventImage = [decoder decodeObjectForKey:@"eventImage"];
        self.eventCreatedBy = [decoder decodeObjectForKey:@"eventCreatedBy"];
        self.eventCreatedDate = [decoder decodeObjectForKey:@"eventCreatedDate"];
        self.eventEventDate = [decoder decodeObjectForKey:@"eventEventDate"];
        self.eventEventTime = [decoder decodeObjectForKey:@"eventEventTime"];
    }
    return self;
}

#pragma mark Encoding Object

-(void)encodeWithCoder:(NSCoder *)encoder
{
    //Encode the properties of the object
    [encoder encodeObject:self.eventId forKey:@"eventId"];
    [encoder encodeObject:self.eventName forKey:@"eventName"];
    [encoder encodeObject:self.eventClassId forKey:@"eventClassId"];
    [encoder encodeObject:self.eventVenue forKey:@"eventVenue"];
    [encoder encodeObject:self.eventImage forKey:@"eventImage"];
    [encoder encodeObject:self.eventCreatedBy forKey:@"eventCreatedBy"];
    [encoder encodeObject:self.eventCreatedDate forKey:@"eventCreatedDate"];
    [encoder encodeObject:self.eventEventDate forKey:@"eventEventDate"];
    [encoder encodeObject:self.eventEventTime forKey:@"eventEventTime"];
}

@end
