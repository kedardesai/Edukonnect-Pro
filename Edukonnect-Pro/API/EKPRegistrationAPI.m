//
//  EKPRegistrationAPI.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 10/29/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPRegistrationAPI.h"

@implementation EKPRegistrationAPI

+ (BOOL)registerUserWith:(EKPUser *)user
{
    BOOL result = NO;
    
    //Web Service Call
    NSString *urlString = [NSString stringWithFormat:@"%@%@name=%@&deviceid=%@&email=%@&mobile=%@", BASE_API_URL, REGISTRATION_API_URL, user.userName, user.userDeviceId, user.userEmail, user.userMobile];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [theRequest setHTTPMethod:@"GET"];
    
    NSURLResponse* response;
    NSError* error = nil;
    NSMutableData *webData = [NSURLConnection sendSynchronousRequest:theRequest  returningResponse:&response error:&error].mutableCopy;
    
    if (error) {
        NSLog(@"ERROR ::: %@", [error localizedDescription]);
        [EKPUtility showAlertWithTitle:@"Network Error" andMessage:[error localizedDescription]];
        return NO;
    }
    
    NSError *localError = nil;
    
    NSMutableDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:webData options:kNilOptions error:&localError];
    
    if (localError) {
        [EKPUtility showAlertWithTitle:@"Error" andMessage:[localError localizedDescription]];
        return NO;
    }
    
    result = [[dictionary objectForKey:@"status"] boolValue];
    
    return result;
}

@end
