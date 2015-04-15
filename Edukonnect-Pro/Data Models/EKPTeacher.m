//
//  EKPTeacher.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 4/12/15.
//  Copyright (c) 2015 Kedar Desai. All rights reserved.
//

#import "EKPTeacher.h"

@implementation EKPTeacher

- (id)init
{
    self = [super init];
    
    if (self) {
        self.teacherAddress = @"";
        self.teacherDOB = @"";
        self.teacherId = @"";
        self.teacherName = @"";
        self.teacherPhone = @"";
        self.teacherSex = @"";
    }
    
    return self;
}

-(id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if ( self != nil )
    {
        //decode the properties
        self.teacherAddress = [decoder decodeObjectForKey:@"teacherAddress"];
        self.teacherDOB = [decoder decodeObjectForKey:@"teacherDOB"];
        self.teacherId = [decoder decodeObjectForKey:@"teacherId"];
        self.teacherName = [decoder decodeObjectForKey:@"teacherName"];
        self.teacherPhone = [decoder decodeObjectForKey:@"teacherPhone"];
        self.teacherSex = [decoder decodeObjectForKey:@"teacherSex"];
    }
    return self;
}

#pragma mark Encoding Object

-(void)encodeWithCoder:(NSCoder *)encoder
{
    //Encode the properties of the object
    [encoder encodeObject:self.teacherAddress forKey:@"teacherAddress"];
    [encoder encodeObject:self.teacherDOB forKey:@"teacherDOB"];
    [encoder encodeObject:self.teacherId forKey:@"teacherId"];
    [encoder encodeObject:self.teacherName forKey:@"teacherName"];
    [encoder encodeObject:self.teacherPhone forKey:@"teacherPhone"];
    [encoder encodeObject:self.teacherSex forKey:@"teacherSex"];
}

#pragma mark Public Methods

- (void)setDetailsWithTeacher:(EKPTeacher *)teacherObject andDictionary:(NSDictionary *)detailsDict
{
    // For Teacher Address
    if (![[detailsDict objectForKey:LOGIN_API_TEACHER_ADDRESS] isKindOfClass:[NSNull class]]) {
        teacherObject.teacherAddress = [detailsDict objectForKey:LOGIN_API_TEACHER_ADDRESS];
    }
    
    // For Teacher DOB
    if (![[detailsDict objectForKey:LOGIN_API_TEACHER_DOB] isKindOfClass:[NSNull class]]) {
        teacherObject.teacherDOB = [[detailsDict objectForKey:LOGIN_API_TEACHER_DOB] stringByReplacingOccurrencesOfString:@"\\" withString:@""];
    }
    
    // For Teacher ID
    if (![[detailsDict objectForKey:LOGIN_API_TEACHER_ID] isKindOfClass:[NSNull class]]) {
        teacherObject.teacherId = [detailsDict objectForKey:LOGIN_API_TEACHER_ID];
    }
    
    // For Teacher Name
    if (![[detailsDict objectForKey:LOGIN_API_TEACHER_NAME] isKindOfClass:[NSNull class]]) {
        teacherObject.teacherName = [detailsDict objectForKey:LOGIN_API_TEACHER_NAME];
    }
    
    // For Teacher Phone
    if (![[detailsDict objectForKey:LOGIN_API_TEACHER_PHONE] isKindOfClass:[NSNull class]]) {
        teacherObject.teacherPhone = [detailsDict objectForKey:LOGIN_API_TEACHER_PHONE];
    }
    
    // For Teacher Sex
    if (![[detailsDict objectForKey:LOGIN_API_TEACHER_SEX] isKindOfClass:[NSNull class]]) {
        teacherObject.teacherSex = [detailsDict objectForKey:LOGIN_API_TEACHER_SEX];
    }
}

@end
