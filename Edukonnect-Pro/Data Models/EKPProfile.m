//
//  EKPProfile.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/6/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPProfile.h"

@implementation EKPProfile

- (id)init
{
    self = [super init];
    
    if (self) {
        self.profileAddress = @"";
        self.profileContactNumber = @"";
        self.profileGrNo = @"";
        self.profileParentName = @"";
        self.profilePassword = @"";
        self.profileProfession = @"";
        self.profileRelation = @"";
        self.profileSchoolCode = @"";
    }
    
    return self;
}

-(id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if ( self != nil )
    {
        //decode the properties
        self.profileAddress = [decoder decodeObjectForKey:@"profileAddress"];
        self.profileContactNumber = [decoder decodeObjectForKey:@"profileContactNumber"];
        self.profileGrNo = [decoder decodeObjectForKey:@"profileGrNo"];
        self.profileParentName = [decoder decodeObjectForKey:@"profileParentName"];
        self.profilePassword = [decoder decodeObjectForKey:@"profilePassword"];
        self.profileProfession = [decoder decodeObjectForKey:@"profileProfession"];
        self.profileRelation = [decoder decodeObjectForKey:@"profileRelation"];
        self.profileSchoolCode = [decoder decodeObjectForKey:@"profileSchoolCode"];
    }
    return self;
}

#pragma mark Encoding Object

-(void)encodeWithCoder:(NSCoder *)encoder
{
    //Encode the properties of the object
    [encoder encodeObject:self.profileAddress forKey:@"profileAddress"];
    [encoder encodeObject:self.profileContactNumber forKey:@"profileContactNumber"];
    [encoder encodeObject:self.profileGrNo forKey:@"profileGrNo"];
    [encoder encodeObject:self.profileParentName forKey:@"profileParentName"];
    [encoder encodeObject:self.profilePassword forKey:@"profilePassword"];
    [encoder encodeObject:self.profileProfession forKey:@"profileProfession"];
    [encoder encodeObject:self.profileRelation forKey:@"profileRelation"];
    [encoder encodeObject:self.profileSchoolCode forKey:@"profileSchoolCode"];
}

@end
