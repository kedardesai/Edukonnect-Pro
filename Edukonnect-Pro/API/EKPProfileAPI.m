//
//  EKPProfileAPI.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/6/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPProfileAPI.h"

@implementation EKPProfileAPI

+ (BOOL)updateProfile:(EKPProfile *)profile
{
    //Web Service Call
    NSString *urlString = [NSString stringWithFormat:@"%@%@schoolcode=%@&student_id=%@&name=%@&password=%@&relation=%@&mobile=%@&address=%@&profession=%@", BASE_API_URL, EDIT_PROFILE_API_URL, profile.profileSchoolCode, profile.profileGrNo, profile.profileParentName, profile.profilePassword, profile.profileContactNumber, profile.profileAddress, profile.profileAddress, profile.profileProfession];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [theRequest setHTTPMethod:@"GET"];
    
    NSURLResponse* response;
    NSError* error = nil;
    NSMutableData *webData = [NSURLConnection sendSynchronousRequest:theRequest  returningResponse:&response error:&error].mutableCopy;
    
    if (error) {
        NSLog(@"ERROR ::: %@", [error localizedDescription]);
        [EKPUtility showAlertWithTitle:NETWORK_ERROR andMessage:[error localizedDescription]];
        return NO;
    }
    
    NSError *localError = nil;
    
    NSMutableDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:webData options:kNilOptions error:&localError];
    
    if (localError) {
        [EKPUtility showAlertWithTitle:ERROR_TITLE andMessage:[localError localizedDescription]];
        return NO;
    }
    
    BOOL status = [[dictionary objectForKey:STATUS_KEY] boolValue];
    return status;
}

@end
