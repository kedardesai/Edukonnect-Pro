//
//  EKPExam.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/11/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPExam.h"

@implementation EKPExam

#pragma mark LifeCycle Methods

- (id)init
{
    self = [super init];
    if (self) {
        self.examId = @"";
        self.examName = @"";
        self.examDate = @"";
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if (self != nil)
    {
        //decode the properties
        self.examId = [decoder decodeObjectForKey:@"examId"];
        self.examName = [decoder decodeObjectForKey:@"examName"];
        self.examDate = [decoder decodeObjectForKey:@"examDate"];
    }
    return self;
}

#pragma mark Encoding Object

-(void)encodeWithCoder:(NSCoder *)encoder
{
    //Encode the properties of the object
    [encoder encodeObject:self.examId forKey:@"examId"];
    [encoder encodeObject:self.examName forKey:@"examName"];
    [encoder encodeObject:self.examDate forKey:@"examDate"];
}

@end
