//
//  EKPEduResourceAPI.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 4/25/15.
//  Copyright (c) 2015 Kedar Desai. All rights reserved.
//

#import "EKPEduResourceAPI.h"

@implementation EKPEduResourceAPI

+ (BOOL)pushLeadForEduResources:(NSString *)menuString
{
    EKPStudent *currentStudent = [EKPSingleton loadStudent];
    
    NSDateFormatter *dateformate=[[NSDateFormatter alloc]init];
    [dateformate setDateFormat:@"dd/MM/yyyy"]; // Date formater
//    [dateformate setDateStyle:NSDateFormatterShortStyle];
    NSLog(@"date :%@",[NSDate date]);
    NSString *dateString = [dateformate stringFromDate:[NSDate date]]; // Convert date to string
    NSLog(@"date :%@",dateString);
    
    //Web Service Call
    NSString *urlString = [NSString stringWithFormat:@"%@%@type=%@&student_id=%@&schoolcode=%@&date=%@&deviceid=%@", BASE_API_URL, EDU_RESOURCE_PUSH_LEAD, menuString, currentStudent.studentId, currentStudent.studentSchoolCode, dateString, [[[UIDevice currentDevice] identifierForVendor] UUIDString]];
    
    NSURL *url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
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
    
    return [[dictionary objectForKey:STATUS_KEY] boolValue];
}

@end
