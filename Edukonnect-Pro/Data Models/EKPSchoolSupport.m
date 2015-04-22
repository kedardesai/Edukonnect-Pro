//
//  EKPSchoolSupport.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 4/21/15.
//  Copyright (c) 2015 Kedar Desai. All rights reserved.
//

#import "EKPSchoolSupport.h"

@implementation EKPSchoolSupport

- (id)init
{
    self = [super init];
    
    if (self) {
        _schoolSupportId = @"";
        _schoolSupportQuestion = @"";
        _schoolSupportType = @"";
        _schoolSupportCreatedDate = @"";
        _schoolSupportCreatedBy = @"";
        _schoolSupportIsSeen = NO;
    }
    
    return self;
}

-(id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if ( self != nil )
    {
        //decode the properties
        _schoolSupportId = [decoder decodeObjectForKey:@"schoolSupportId"];
        _schoolSupportQuestion = [decoder decodeObjectForKey:@"schoolSupportQuestion"];
        _schoolSupportType = [decoder decodeObjectForKey:@"schoolSupportType"];
        _schoolSupportCreatedDate = [decoder decodeObjectForKey:@"schoolSupportCreatedDate"];
        _schoolSupportCreatedBy = [decoder decodeObjectForKey:@"schoolSupportCreatedBy"];
        _schoolSupportIsSeen = [decoder decodeBoolForKey:@"schoolSupportIsSeen"];
    }
    return self;
}

#pragma mark Encoding Object

-(void)encodeWithCoder:(NSCoder *)encoder
{
    //Encode the properties of the object
    [encoder encodeObject:_schoolSupportId forKey:@"schoolSupportId"];
    [encoder encodeObject:_schoolSupportQuestion forKey:@"schoolSupportQuestion"];
    [encoder encodeObject:_schoolSupportType forKey:@"schoolSupportType"];
    [encoder encodeObject:_schoolSupportCreatedDate forKey:@"schoolSupportCreatedDate"];
    [encoder encodeObject:_schoolSupportCreatedBy forKey:@"schoolSupportCreatedBy"];
    [encoder encodeBool:_schoolSupportIsSeen forKey:@"schoolSupportIsSeen"];
}

#pragma mark Public Methods

- (void)setSchoolSupportDetailsWithDictionary:(NSDictionary *)dict
{
    if (![[dict objectForKey:SCHOOL_SUPPORT_API_ID] isKindOfClass:[NSNull class]]) {
        _schoolSupportId = [dict objectForKey:SCHOOL_SUPPORT_API_ID];
    }
    
    if (![[dict objectForKey:SCHOOL_SUPPORT_API_QUESTION] isKindOfClass:[NSNull class]]) {
        _schoolSupportQuestion = [dict objectForKey:SCHOOL_SUPPORT_API_QUESTION];
    }
    
    if (![[dict objectForKey:SCHOOL_SUPPORT_API_TYPE] isKindOfClass:[NSNull class]]) {
        _schoolSupportType = [dict objectForKey:SCHOOL_SUPPORT_API_TYPE];
    }
    
    if (![[dict objectForKey:SCHOOL_SUPPORT_API_CREATED_DT] isKindOfClass:[NSNull class]]) {
        _schoolSupportCreatedDate = [dict objectForKey:SCHOOL_SUPPORT_API_CREATED_DT];
    }
    
    if (![[dict objectForKey:SCHOOL_SUPPORT_API_CREATED_BY] isKindOfClass:[NSNull class]]) {
        _schoolSupportCreatedBy = [dict objectForKey:SCHOOL_SUPPORT_API_CREATED_BY];
    }
    
    if (![[dict objectForKey:SCHOOL_SUPPORT_API_IS_SEEN] isKindOfClass:[NSNull class]]) {
        _schoolSupportIsSeen = [[dict objectForKey:SCHOOL_SUPPORT_API_IS_SEEN] boolValue];
    }
}


@end
