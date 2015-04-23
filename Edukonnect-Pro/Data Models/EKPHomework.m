//
//  EKPHomework.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 4/22/15.
//  Copyright (c) 2015 Kedar Desai. All rights reserved.
//

#import "EKPHomework.h"

@implementation EKPHomework

- (id)init
{
    self = [super init];
    
    if (self) {
        _homeworkCreatedBy = @"";
        _homeworkDate = @"";
        _homeworkDetails = @"";
        _homeworkFileExt = @"";
        _homeworkHeading = @"";
        _homeworkId = @"";
        _homeworkIsFileUploaded = NO;
    }
    
    return self;
}

-(id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if ( self != nil )
    {
        //decode the properties
        _homeworkCreatedBy = [decoder decodeObjectForKey:@"homeworkCreatedBy"];
        _homeworkDate = [decoder decodeObjectForKey:@"homeworkDate"];
        _homeworkDetails = [decoder decodeObjectForKey:@"homeworkDetails"];
        _homeworkFileExt = [decoder decodeObjectForKey:@"homeworkFileExt"];
        _homeworkHeading = [decoder decodeObjectForKey:@"homeworkHeading"];
        _homeworkId = [decoder decodeObjectForKey:@"homeworkId"];
        _homeworkIsFileUploaded = [decoder decodeBoolForKey:@"homeworkIsFileUploaded"];
    }
    return self;
}

#pragma mark Encoding Object

-(void)encodeWithCoder:(NSCoder *)encoder
{
    //Encode the properties of the object
    [encoder encodeObject:_homeworkCreatedBy forKey:@"homeworkCreatedBy"];
    [encoder encodeObject:_homeworkDate forKey:@"homeworkDate"];
    [encoder encodeObject:_homeworkDetails forKey:@"homeworkDetails"];
    [encoder encodeObject:_homeworkFileExt forKey:@"homeworkFileExt"];
    [encoder encodeObject:_homeworkHeading forKey:@"homeworkHeading"];
    [encoder encodeObject:_homeworkId forKey:@"homeworkId"];
    [encoder encodeBool:_homeworkIsFileUploaded forKey:@"homeworkIsFileUploaded"];
}

#pragma mark Public Methods

- (void)setHomeworkDetailsWithDictionary:(NSDictionary *)dict
{
    if (![[dict objectForKey:HOMEWORK_API_CREATED_BY] isKindOfClass:[NSNull class]]) {
        _homeworkCreatedBy = [dict objectForKey:HOMEWORK_API_CREATED_BY];
    }
    
    if (![[dict objectForKey:HOMEWORK_API_DT] isKindOfClass:[NSNull class]]) {
        _homeworkDate = [dict objectForKey:HOMEWORK_API_DT];
    }
    
    if (![[dict objectForKey:HOMEWORK_API_DETAILS] isKindOfClass:[NSNull class]]) {
        _homeworkDetails = [dict objectForKey:HOMEWORK_API_DETAILS];
    }
    
    if (![[dict objectForKey:HOMEWORK_API_FILE_EXT] isKindOfClass:[NSNull class]]) {
        _homeworkFileExt = [dict objectForKey:HOMEWORK_API_FILE_EXT];
    }
    
    if (![[dict objectForKey:HOMEWORK_API_HEADING] isKindOfClass:[NSNull class]]) {
        _homeworkHeading = [dict objectForKey:HOMEWORK_API_HEADING];
    }
    
    if (![[dict objectForKey:HOMEWORK_API_ID] isKindOfClass:[NSNull class]]) {
        _homeworkId = [dict objectForKey:HOMEWORK_API_ID];
    }
    
    if (![[dict objectForKey:HOMEWORK_API_IS_FILE_UPLOADED] isKindOfClass:[NSNull class]]) {
        _homeworkIsFileUploaded = [[dict objectForKey:HOMEWORK_API_IS_FILE_UPLOADED] boolValue];
    }
}

@end
