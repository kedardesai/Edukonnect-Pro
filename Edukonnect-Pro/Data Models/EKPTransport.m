//
//  EKPTransport.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/15/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPTransport.h"

@implementation EKPTransport
#pragma mark LifeCycle Methods

- (id)init
{
    self = [super init];
    if (self) {
        self.transportDesc = @"";
        self.transportDriverName = @"";
        self.transportId = @"";
        self.transportMobile1 = @"";
        self.transportMobile2 = @"";
        self.transportRouteFare = @"";
        self.transportRouteName = @"";
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if (self != nil)
    {
        //decode the properties
        self.transportDesc = [decoder decodeObjectForKey:@"transportDesc"];
        self.transportDriverName = [decoder decodeObjectForKey:@"transportDriverName"];
        self.transportId = [decoder decodeObjectForKey:@"transportId"];
        self.transportMobile1 = [decoder decodeObjectForKey:@"transportMobile1"];
        self.transportMobile2 = [decoder decodeObjectForKey:@"transportMobile2"];
        self.transportRouteFare = [decoder decodeObjectForKey:@"transportRouteFare"];
        self.transportRouteName = [decoder decodeObjectForKey:@"transportRouteName"];
    }
    return self;
}

#pragma mark Encoding Object

-(void)encodeWithCoder:(NSCoder *)encoder
{
    //Encode the properties of the object
    [encoder encodeObject:self.transportDesc forKey:@"transportDesc"];
    [encoder encodeObject:self.transportDriverName forKey:@"transportDriverName"];
    [encoder encodeObject:self.transportId forKey:@"transportId"];
    [encoder encodeObject:self.transportMobile1 forKey:@"transportMobile1"];
    [encoder encodeObject:self.transportMobile2 forKey:@"transportMobile2"];
    [encoder encodeObject:self.transportRouteFare forKey:@"transportRouteFare"];
    [encoder encodeObject:self.transportRouteName forKey:@"transportRouteName"];
}

@end
