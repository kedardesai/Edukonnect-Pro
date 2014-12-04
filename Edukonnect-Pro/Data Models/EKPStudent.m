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

#pragma mark Public Methods

- (void)setDetailsWithStudent:(EKPStudent *)studentObject andDictionary:(NSDictionary *)detailsDict
{
    // school_details
    NSDictionary *schoolDict = (NSDictionary *)[detailsDict objectForKey:LOGIN_API_SCHOOL_DETAILS];
    if (![[schoolDict objectForKey:LOGIN_API_SCHOOL_ADDRESS] isEqual:[NSNull null]])
        studentObject.studentSchoolAddress = [schoolDict objectForKey:LOGIN_API_SCHOOL_ADDRESS];
    
    if (![[schoolDict objectForKey:LOGIN_API_SCHOOL_EMAIL] isEqual:[NSNull null]])
        studentObject.studentSchoolEmail = [schoolDict objectForKey:LOGIN_API_SCHOOL_EMAIL];
    
    if (![[schoolDict objectForKey:LOGIN_API_SCHOOL_LOGO] isEqual:[NSNull null]])
        studentObject.studentSchoolLogo = [schoolDict objectForKey:LOGIN_API_SCHOOL_LOGO];
    
    if (![[schoolDict objectForKey:LOGIN_API_SCHOOL_NAME] isEqual:[NSNull null]])
        studentObject.studentSchoolName = [schoolDict objectForKey:LOGIN_API_SCHOOL_NAME];
    
    // student_details
    NSDictionary *studentDict = (NSDictionary *)[detailsDict objectForKey:LOGIN_API_STUDENT_DETAILS];
    
    if (![[studentDict objectForKey:LOGIN_API_STUDENT_ADDRESS] isEqual:[NSNull null]])
        studentObject.studentAddress = [studentDict objectForKey:LOGIN_API_STUDENT_ADDRESS];
    
    if (![[studentDict objectForKey:LOGIN_API_STUDENT_BIRTHDAY] isEqual:[NSNull null]])
        studentObject.studentBirthday = [studentDict objectForKey:LOGIN_API_STUDENT_BIRTHDAY];
    
    if (![[studentDict objectForKey:LOGIN_API_STUDENT_CLASS] isEqual:[NSNull null]])
        studentObject.studentClass = [studentDict objectForKey:LOGIN_API_STUDENT_CLASS];
    
    if (![[studentDict objectForKey:LOGIN_API_STUDENT_GRNO] isEqual:[NSNull null]])
        studentObject.studentGRNo = [studentDict objectForKey:LOGIN_API_STUDENT_GRNO];
    
    if (![[studentDict objectForKey:LOGIN_API_STUDENT_NAME] isEqual:[NSNull null]])
        studentObject.studentName = [studentDict objectForKey:LOGIN_API_STUDENT_NAME];
    
    if (![[studentDict objectForKey:LOGIN_API_STUDENT_ROLLNO] isEqual:[NSNull null]])
        studentObject.studentRollNo = [studentDict objectForKey:LOGIN_API_STUDENT_ROLLNO];
    
    if (![[studentDict objectForKey:LOGIN_API_STUDENT_SEX] isEqual:[NSNull null]])
        studentObject.studentSex = [studentDict objectForKey:LOGIN_API_STUDENT_SEX];
}

- (BOOL)isEqualToStudent:(EKPStudent *)studentObject
{
    if (![[self studentSchoolCode] isEqual:[studentObject studentSchoolCode]])
        return NO;
    
    if (![[self studentUsername] isEqual:[studentObject studentUsername]])
        return NO;
    
    if (![[self studentPassword] isEqual:[studentObject studentPassword]])
        return NO;
    
    if (![[self studentSchoolAddress] isEqual:[studentObject studentSchoolAddress]])
        return NO;
    
    if (![[self studentSchoolEmail] isEqual:[studentObject studentSchoolEmail]])
        return NO;
    
    if (![[self studentSchoolLogo] isEqual:[studentObject studentSchoolLogo]])
        return NO;
    
    if (![[self studentSchoolName] isEqual:[studentObject studentSchoolName]])
        return NO;
    
    if (![[self studentAddress] isEqual:[studentObject studentAddress]])
        return NO;
    
    if (![[self studentBirthday] isEqual:[studentObject studentBirthday]])
        return NO;
    
    if (![[self studentClass] isEqual:[studentObject studentClass]])
        return NO;
    
    if (![[self studentGRNo] isEqual:[studentObject studentGRNo]])
        return NO;
    
    if (![[self studentName] isEqual:[studentObject studentName]])
        return NO;
    
    if (![[self studentRollNo] isEqual:[studentObject studentRollNo]])
        return NO;
    
    if (![[self studentSex] isEqual:[studentObject studentSex]])
        return NO;
    
    return YES;
}

@end
