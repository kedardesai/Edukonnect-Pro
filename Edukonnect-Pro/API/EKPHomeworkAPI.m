//
//  EKPHomeworkAPI.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 4/22/15.
//  Copyright (c) 2015 Kedar Desai. All rights reserved.
//

#import "EKPHomeworkAPI.h"

@implementation EKPHomeworkAPI

+ (NSMutableDictionary *)getHomeworkListForPageId:(NSInteger)pageId
{
    {
        EKPStudent *currentStudent = [EKPSingleton loadStudent];
        
        //Web Service Call
        NSString *urlString = [NSString stringWithFormat:@"%@%@schoolcode=%@&class_id=%@&pageid=%ld", BASE_API_URL, HOMEWORK_API_URL, currentStudent.studentSchoolCode, currentStudent.studentClass, (long)pageId];
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
}

@end