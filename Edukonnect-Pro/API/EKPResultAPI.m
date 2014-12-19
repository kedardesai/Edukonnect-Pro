//
//  EKPResultAPI.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/11/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPResultAPI.h"
#import "EKPExam.h"
#import "EKPSubjectResult.h"

@implementation EKPResultAPI

+ (NSMutableArray *)getExamList
{
    EKPStudent *currentStudent = [EKPSingleton loadStudent];
    
    //Web Service Call
    NSString *urlString = [NSString stringWithFormat:@"%@%@schoolcode=%@&student_id=%@", BASE_API_URL, EXAM_LIST_API_URL, currentStudent.studentSchoolCode, currentStudent.studentId];
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
    
    NSMutableArray *resultArray = [[NSMutableArray alloc] init];
    
    for (NSDictionary *objDict in responseArray) {
        EKPExam *examObj = [[EKPExam alloc] init];
        examObj.examId = [objDict objectForKey:EXAM_ID];
        examObj.examDate = [objDict objectForKey:EXAM_DATE];
        examObj.examName = [objDict objectForKey:EXAM_NAME];
        [resultArray addObject:examObj];
    }
    
    return resultArray;
}

+ (NSMutableArray *)getResultForExamId:(NSString *)examId
{
    EKPStudent *currentStudent = [EKPSingleton loadStudent];
    
    //Web Service Call
    NSString *urlString = [NSString stringWithFormat:@"%@%@schoolcode=%@&student_id=%@&examid=%@", BASE_API_URL, RESULT_API_URL, currentStudent.studentSchoolCode, currentStudent.studentId, examId];
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
    
    NSMutableArray *resultArray = [[NSMutableArray alloc] init];
    
    for (NSDictionary *objDict in responseArray) {
        EKPSubjectResult *resultObj = [[EKPSubjectResult alloc] init];
        resultObj.resultAttendance = [objDict objectForKey:RESULT_ATTENDANCE];
        resultObj.resultComment = [objDict objectForKey:RESULT_COMMENT];
        resultObj.resultMarks = [objDict objectForKey:RESULT_MARKS];
        resultObj.resultOutof = [objDict objectForKey:RESULT_OUT_OF];
        resultObj.resultSubject = [objDict objectForKey:RESULT_SUBJECT];
        [resultArray addObject:resultObj];
    }
    
    return resultArray;
}

@end
