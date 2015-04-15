//
//  EKPLeaveAPI.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 4/12/15.
//  Copyright (c) 2015 Kedar Desai. All rights reserved.
//

#import "EKPLeaveAPI.h"
#import "EKPLeave.h"

@implementation EKPLeaveAPI

+ (NSMutableArray *)listOfLeavesForPageId:(NSInteger)pageId
{
    EKPStudent *currentStudent = [EKPSingleton loadStudent];
    EKPTeacher *currentTeacher = [EKPSingleton loadTeacher];
    
    //Web Service Call
    NSString *urlString = [NSString stringWithFormat:@"%@%@schoolcode=%@&teacher_id=%@&pageid=%ld", BASE_API_URL, LEAVE_LIST_API_URL, /*@"SCH002"*/currentStudent.studentSchoolCode, /*@"1"*/currentTeacher.teacherId, (long)pageId];
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
    
    NSArray *dataArray = [dictionary objectForKey:LEAVE_API_TAG];
    NSMutableArray *leavesArray = [[NSMutableArray alloc] init];
    
    for (NSDictionary *leaveDict in dataArray) {
        EKPLeave *leaveObj = [[EKPLeave alloc] init];
        [leaveObj setLeaveDetailsWithDictionary:leaveDict];
        [leavesArray addObject:leaveObj];
    }
    
    return leavesArray;
}

@end
