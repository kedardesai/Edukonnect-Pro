//
//  EKPLeave.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 4/13/15.
//  Copyright (c) 2015 Kedar Desai. All rights reserved.
//

#import "EKPLeave.h"

@implementation EKPLeave

- (id)init
{
    self = [super init];
    
    if (self) {
        self.leaveDays = @"";
        self.leaveDayType = @"";
        self.leaveDtFrom = @"";
        self.leaveDtTo = @"";
        self.leaveId = @"";
        self.leaveNote = @"";
        self.leaveStatus = @"";
    }
    
    return self;
}

-(id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if ( self != nil )
    {
        //decode the properties
        self.leaveDays = [decoder decodeObjectForKey:@"leaveDays"];
        self.leaveDayType = [decoder decodeObjectForKey:@"leaveDayType"];
        self.leaveDtFrom = [decoder decodeObjectForKey:@"leaveDtFrom"];
        self.leaveDtTo = [decoder decodeObjectForKey:@"leaveDtTo"];
        self.leaveId = [decoder decodeObjectForKey:@"leaveId"];
        self.leaveNote = [decoder decodeObjectForKey:@"leaveNote"];
        self.leaveStatus = [decoder decodeObjectForKey:@"leaveStatus"];
    }
    return self;
}

#pragma mark Encoding Object

-(void)encodeWithCoder:(NSCoder *)encoder
{
    //Encode the properties of the object
    [encoder encodeObject:self.leaveDays forKey:@"leaveDays"];
    [encoder encodeObject:self.leaveDayType forKey:@"leaveDayType"];
    [encoder encodeObject:self.leaveDtFrom forKey:@"leaveDtFrom"];
    [encoder encodeObject:self.leaveDtTo forKey:@"leaveDtTo"];
    [encoder encodeObject:self.leaveId forKey:@"leaveId"];
    [encoder encodeObject:self.leaveNote forKey:@"leaveNote"];
    [encoder encodeObject:self.leaveStatus forKey:@"leaveStatus"];
}

#pragma mark Public Methods

- (void)setLeaveDetailsWithDictionary:(NSDictionary *)dict
{
    if (![[dict objectForKey:LEAVE_API_DAY_TYPE] isKindOfClass:[NSNull class]]) {
        self.leaveDayType = [dict objectForKey:LEAVE_API_DAY_TYPE];
    }
    
    if (![[dict objectForKey:LEAVE_API_DAYS] isKindOfClass:[NSNull class]]) {
        self.leaveDays = [dict objectForKey:LEAVE_API_DAYS];
    }
    
    if (![[dict objectForKey:LEAVE_API_END_DT] isKindOfClass:[NSNull class]]) {
        self.leaveDtTo = [dict objectForKey:LEAVE_API_END_DT];
    }
    
    if (![[dict objectForKey:LEAVE_API_ID] isKindOfClass:[NSNull class]]) {
        self.leaveId = [dict objectForKey:LEAVE_API_ID];
    }
    
    if (![[dict objectForKey:LEAVE_API_NOTE] isKindOfClass:[NSNull class]]) {
        self.leaveNote = [dict objectForKey:LEAVE_API_NOTE];
    }
    
    if (![[dict objectForKey:LEAVE_API_START_DT] isKindOfClass:[NSNull class]]) {
        self.leaveDtFrom = [dict objectForKey:LEAVE_API_START_DT];
    }
    
    if (![[dict objectForKey:LEAVE_API_STATUS] isKindOfClass:[NSNull class]]) {
        self.leaveStatus = [dict objectForKey:LEAVE_API_STATUS];
    }
}

@end
