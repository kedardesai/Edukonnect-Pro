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
        self.studentSchoolAddress = [decoder decodeObjectForKey:@"studentSchoolAddress"];
        self.studentSchoolEmail = [decoder decodeObjectForKey:@"studentSchoolEmail"];
        self.studentSchoolLogo = [decoder decodeObjectForKey:@"studentSchoolLogo"];
        self.studentSchoolName = [decoder decodeObjectForKey:@"studentSchoolName"];
        self.studentAddress = [decoder decodeObjectForKey:@"studentAddress"];
        self.studentBirthday = [decoder decodeObjectForKey:@"studentBirthday"];
        self.studentClass = [decoder decodeObjectForKey:@"studentClass"];
        self.studentGRNo = [decoder decodeObjectForKey:@"studentGRNo"];
        self.studentName = [decoder decodeObjectForKey:@"studentName"];
        self.studentRollNo = [decoder decodeObjectForKey:@"studentRollNo"];
        self.studentSex = [decoder decodeObjectForKey:@"studentSex"];
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
    [encoder encodeObject:self.studentSchoolAddress forKey:@"studentSchoolAddress"];
    [encoder encodeObject:self.studentSchoolEmail forKey:@"studentSchoolEmail"];
    [encoder encodeObject:self.studentSchoolLogo forKey:@"studentSchoolLogo"];
    [encoder encodeObject:self.studentSchoolName forKey:@"studentSchoolName"];
    [encoder encodeObject:self.studentAddress forKey:@"studentAddress"];
    [encoder encodeObject:self.studentBirthday forKey:@"studentBirthday"];
    [encoder encodeObject:self.studentClass forKey:@"studentClass"];
    [encoder encodeObject:self.studentGRNo forKey:@"studentGRNo"];
    [encoder encodeObject:self.studentName forKey:@"studentName"];
    [encoder encodeObject:self.studentRollNo forKey:@"studentRollNo"];
    [encoder encodeObject:self.studentSex forKey:@"studentSex"];
}

@end
