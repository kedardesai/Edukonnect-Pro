//
//  EKPDormitoryAPI.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/17/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPDormitoryAPI.h"
#import "EKPDormitory.h"

@implementation EKPDormitoryAPI

+ (NSMutableDictionary *)getDormitoryListWithPageId:(NSInteger)pageId
{
    EKPStudent *currentStudent = [EKPSingleton loadStudent];
    
    //Web Service Call
    NSString *urlString = [NSString stringWithFormat:@"%@%@schoolcode=%@&pageid=%ld", BASE_API_URL, DORMITORIES_API_URL, currentStudent.studentSchoolCode, (long)pageId];
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
    
    NSMutableDictionary *responseDict = [[NSJSONSerialization JSONObjectWithData:webData options:kNilOptions error:&localError] mutableCopy];
    
    if (localError) {
        [EKPUtility showAlertWithTitle:ERROR_TITLE andMessage:[localError localizedDescription]];
        return nil;
    }
    
    return responseDict;
}

@end