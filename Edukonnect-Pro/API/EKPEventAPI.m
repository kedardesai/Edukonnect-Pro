//
//  EKPEventAPI.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/10/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPEventAPI.h"

@implementation EKPEventAPI

+ (NSMutableDictionary *)getEventsForPageId:(NSInteger)pageId
{
    EKPStudent *currentStudent = [EKPSingleton loadStudent];
    
    //Web Service Call
    NSString *urlString;
    
    if ([EKPSingleton loadUserRole] == TEACHER_ROLE) {
        urlString = [NSString stringWithFormat:@"%@%@schoolcode=%@&pageid=%ld", BASE_API_URL, EVENT_TEACHER_API_URL, /*@"SCH002"*/currentStudent.studentSchoolCode, (long)pageId];
    } else {
        urlString = [NSString stringWithFormat:@"%@%@schoolcode=%@&classid=%@&pageid=%ld", BASE_API_URL, EVENT_API_URL, /*@"SCH002"*/currentStudent.studentSchoolCode, /*@"1"*/currentStudent.studentClass, (long)pageId];
    }
    
    
    
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

+ (BOOL)userIsGoingToEvent:(NSString *)eventId
{
    EKPStudent *currentStudent = [EKPSingleton loadStudent];
    
    // schoolcode=sch001&student_id=1&event_id=1
    
    //Web Service Call
    NSString *urlString = [NSString stringWithFormat:@"%@%@schoolcode=%@&student_id=%@&event_id=%@", BASE_API_URL, EVENT_ISGOING_API_URL, /*@"SCH002"*/currentStudent.studentSchoolCode, /*@"1"*/currentStudent.studentId, eventId];
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

+ (BOOL)checkIsGoing:(NSString *)eventId
{
    EKPStudent *currentStudent = [EKPSingleton loadStudent];
    
    // schoolcode=sch001&student_id=1&event_id=1
    
    //Web Service Call
    NSString *urlString = [NSString stringWithFormat:@"%@%@schoolcode=%@&student_id=%@&event_id=%@", BASE_API_URL, EVENT_ISGOING_CHECK_API_URL, /*@"SCH002"*/currentStudent.studentSchoolCode, /*@"1"*/currentStudent.studentId, eventId];
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
