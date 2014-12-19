//
//  EKPAlert.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/20/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPAlert.h"

@implementation EKPAlert

- (id)init
{
    self = [super init];
    
    if (self) {
        self.noticeId = [NSNumber numberWithInt:-1];
        self.noticeHeading = @"";
        self.noticeMessage = @"";
        self.noticeCreatedBy = @"";
        self.isSeen = YES;
    }
    
    return self;
}

-(id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if (self != nil)
    {
        //decode the properties
        self.noticeId = [decoder decodeObjectForKey:@"noticeId"];
        self.noticeHeading = [decoder decodeObjectForKey:@"noticeHeading"];
        self.noticeMessage = [decoder decodeObjectForKey:@"noticeMessage"];
        self.noticeCreatedBy = [decoder decodeObjectForKey:@"noticeCreatedBy"];
        self.isSeen = [decoder decodeBoolForKey:@"isSeen"];
    }
    return self;
}

#pragma mark Encoding Object

-(void)encodeWithCoder:(NSCoder *)encoder
{
    //Encode the properties of the object
    [encoder encodeObject:self.noticeId forKey:@"noticeId"];
    [encoder encodeObject:self.noticeHeading forKey:@"noticeHeading"];
    [encoder encodeObject:self.noticeMessage forKey:@"noticeMessage"];
    [encoder encodeObject:self.noticeCreatedBy forKey:@"noticeCreatedBy"];
    [encoder encodeBool:self.isSeen forKey:@"isSeen"];
}

@end
