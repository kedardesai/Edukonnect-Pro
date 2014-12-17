//
//  EKPDormitory.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/17/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPDormitory.h"

@implementation EKPDormitory

#pragma mark LifeCycle Methods

- (id)init
{
    self = [super init];
    if (self) {
        self.dormitoryId = @"";
        self.dormitoryName = @"";
        self.dormitoryNumberOfRooms = @"";
        self.dormitoryDesc = @"";
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if (self != nil)
    {
        //decode the properties
        self.dormitoryId = [decoder decodeObjectForKey:@"dormitoryId"];
        self.dormitoryName = [decoder decodeObjectForKey:@"dormitoryName"];
        self.dormitoryNumberOfRooms = [decoder decodeObjectForKey:@"dormitoryNumberOfRooms"];
        self.dormitoryDesc = [decoder decodeObjectForKey:@"dormitoryDesc"];
    }
    return self;
}

#pragma mark Encoding Object

-(void)encodeWithCoder:(NSCoder *)encoder
{
    //Encode the properties of the object
    [encoder encodeObject:self.dormitoryId forKey:@"dormitoryId"];
    [encoder encodeObject:self.dormitoryName forKey:@"dormitoryName"];
    [encoder encodeObject:self.dormitoryNumberOfRooms forKey:@"dormitoryNumberOfRooms"];
    [encoder encodeObject:self.dormitoryDesc forKey:@"dormitoryDesc"];
}

@end
