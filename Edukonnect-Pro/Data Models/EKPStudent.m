//
//  EKPStudent.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 11/2/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPStudent.h"

@implementation EKPStudent

- (id)init
{
    self = [super init];
    
    if (self) {
        self.studentSchoolCode = @"";
        self.studentUsername = @"";
        self.studentPassword = @"";
    }
    
    return self;
}

-(id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if ( self != nil )
    {
        //decode the properties
        self.studentSchoolCode = [decoder decodeObjectForKey:@"studentSchoolCode"];
        self.studentUsername = [decoder decodeObjectForKey:@"studentUsername"];
        self.studentPassword = [decoder decodeObjectForKey:@"studentPassword"];
    }
    return self;
}

#pragma mark Encoding Object

-(void)encodeWithCoder:(NSCoder *)encoder
{
    //Encode the properties of the object
    [encoder encodeObject:self.studentSchoolCode forKey:@"studentSchoolCode"];
    [encoder encodeObject:self.studentUsername forKey:@"studentUsername"];
    [encoder encodeObject:self.studentPassword forKey:@"studentPassword"];
}

@end
