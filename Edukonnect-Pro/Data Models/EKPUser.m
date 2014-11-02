//
//  EKPUser.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 11/2/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPUser.h"

@implementation EKPUser

- (id)init
{
    self = [super init];
    
    if (self) {
        self.userName = @"";
        self.userDeviceId = @"";
        self.userEmail = @"";
        self.userMobile = @"";
    }
    
    return self;
}

-(id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if ( self != nil )
    {
        //decode the properties
        self.userName = [decoder decodeObjectForKey:@"userName"];
        self.userDeviceId = [decoder decodeObjectForKey:@"userDeviceId"];
        self.userEmail = [decoder decodeObjectForKey:@"userEmail"];
        self.userMobile = [decoder decodeObjectForKey:@"userMobile"];
    }
    return self;
}

#pragma mark Encoding Object

-(void)encodeWithCoder:(NSCoder *)encoder
{
    //Encode the properties of the object
    [encoder encodeObject:self.userName forKey:@"userName"];
    [encoder encodeObject:self.userDeviceId forKey:@"userDeviceId"];
    [encoder encodeObject:self.userEmail forKey:@"userEmail"];
    [encoder encodeObject:self.userMobile forKey:@"userMobile"];
}

@end
