//
//  EKPTimetableAPI.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/13/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPTimetableAPI.h"
#import "EKPTeacher.h"

@implementation EKPTimetableAPI

+ (NSMutableArray *)getTimetable
{
    EKPStudent *currentStudent = [EKPSingleton loadStudent];
    
    //Web Service Call
    NSString *urlString;
    
    if ([EKPSingleton loadUserRole] == TEACHER_ROLE) {
        
        EKPTeacher *currentTeacher = [EKPSingleton loadTeacher];
        urlString = [NSString stringWithFormat:@"%@%@schoolcode=%@&teacher_id=%@", BASE_API_URL, TIMETABLE_TEACHER_API_URL, currentStudent.studentSchoolCode, currentTeacher.teacherId];
        
    } else {
        urlString = [NSString stringWithFormat:@"%@%@schoolcode=%@&classid=%@", BASE_API_URL, TIMETABLE_API_URL, currentStudent.studentSchoolCode, currentStudent.studentClass];
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
    
    NSMutableArray *responseArray = [[NSJSONSerialization JSONObjectWithData:webData options:kNilOptions error:&localError] mutableCopy];
    
    if (localError) {
        [EKPUtility showAlertWithTitle:ERROR_TITLE andMessage:[localError localizedDescription]];
        return nil;
    }
    
    NSMutableArray *marrApartmentsByRoomType = [NSMutableArray arrayWithCapacity:10];
    
    NSMutableArray *arrRoomTypes = [responseArray valueForKeyPath:@"@distinctUnionOfObjects.day"];
    
    NSArray * daysOfTheWeek = [NSArray arrayWithObjects:@"sunday", @"monday", @"tuesday", @"wednesday", @"thursday", @"friday", @"saturday", nil];
    
    arrRoomTypes = [[daysOfTheWeek filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF in (%@)", arrRoomTypes]] mutableCopy];
    
    
    for(NSString *strRoomType in arrRoomTypes) {
        NSPredicate *predicateRoomType = [NSPredicate predicateWithFormat:@"day=%@", strRoomType];
        
        NSArray *arrApartmentsThatMatchRoomType = [responseArray filteredArrayUsingPredicate:predicateRoomType];  // TAKES A LONG TIME EACH LOOP-ROUND
        
        [marrApartmentsByRoomType addObject:arrApartmentsThatMatchRoomType];
    }
    
    return marrApartmentsByRoomType;
}

@end
