//
//  EKPSubjectResult.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/11/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPSubjectResult.h"

@implementation EKPSubjectResult

#pragma mark LifeCycle Methods

- (id)init
{
    self = [super init];
    if (self) {
        self.resultAttendance = @"";
        self.resultComment = @"";
        self.resultMarks = @"";
        self.resultOutof = @"";
        self.resultSubject = @"";
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if (self != nil)
    {
        //decode the properties
        self.resultAttendance = [decoder decodeObjectForKey:@"resultAttendance"];
        self.resultComment = [decoder decodeObjectForKey:@"resultComment"];
        self.resultMarks = [decoder decodeObjectForKey:@"resultMarks"];
        self.resultOutof = [decoder decodeObjectForKey:@"resultOutof"];
        self.resultSubject = [decoder decodeObjectForKey:@"resultSubject"];
    }
    return self;
}

#pragma mark Encoding Object

-(void)encodeWithCoder:(NSCoder *)encoder
{
    //Encode the properties of the object
    [encoder encodeObject:self.resultAttendance forKey:@"resultAttendance"];
    [encoder encodeObject:self.resultComment forKey:@"resultComment"];
    [encoder encodeObject:self.resultMarks forKey:@"resultMarks"];
    [encoder encodeObject:self.resultOutof forKey:@"resultOutof"];
    [encoder encodeObject:self.resultSubject forKey:@"resultSubject"];
}

@end
