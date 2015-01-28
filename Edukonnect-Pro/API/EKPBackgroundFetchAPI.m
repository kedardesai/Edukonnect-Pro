//
//  EKPBackgroundFetchAPI.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/21/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPBackgroundFetchAPI.h"

@implementation EKPBackgroundFetchAPI

+ (NSMutableDictionary *)checkForBackgroundUpdatesForSchoolCode:(NSString *)schoolCode andStudentId:(NSString *)studentId
{
    //Web Service Call
    NSString *urlString = [NSString stringWithFormat:@"%@%@schoolcode=%@&student_id=%@", BASE_API_URL, PULL_NOTIFICATION_API_URL, schoolCode, studentId];
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
        return nil;
    }
    
    NSError *localError = nil;
    
    NSMutableDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:webData options:kNilOptions error:&localError];
    
    if (localError) {
        [EKPUtility showAlertWithTitle:ERROR_TITLE andMessage:[localError localizedDescription]];
        return nil;
    }
    
    return dictionary;
}

@end
