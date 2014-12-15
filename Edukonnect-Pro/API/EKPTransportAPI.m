//
//  EKPTransportAPI.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/15/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPTransportAPI.h"
#import "EKPTransport.h"

@implementation EKPTransportAPI

+ (NSMutableArray *)getTransportList
{
    EKPStudent *currentStudent = [EKPSingleton loadStudent];
    
    //Web Service Call
    NSString *urlString = [NSString stringWithFormat:@"%@%@schoolcode=%@", BASE_API_URL, TRANSPORT_LIST_API_URL, currentStudent.studentSchoolCode];
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
    
    for (NSDictionary *transportDict in responseArray) {
        EKPTransport *transportObj = [[EKPTransport alloc] init];
        transportObj.transportDesc = [transportDict objectForKey:TRANSPORT_API_DESC];
        transportObj.transportDriverName = [transportDict objectForKey:TRANSPORT_API_DRIVER_NAME];
        transportObj.transportId = [transportDict objectForKey:TRANSPORT_API_ID];
        transportObj.transportMobile1 = [transportDict objectForKey:TRANSPORT_API_MOBILE1];
        transportObj.transportMobile2 = [transportDict objectForKey:TRANSPORT_API_MOBILE2];
        transportObj.transportRouteFare = [transportDict objectForKey:TRANSPORT_API_ROUTE_FARE];
        transportObj.transportRouteName = [transportDict objectForKey:TRANSPORT_API_ROUTE_NAME];
        
        [resultArray addObject:transportObj];
    }
    
    return resultArray;
}

+ (NSMutableDictionary *)getLocationForBus:(NSString *)transportId
{
    EKPStudent *currentStudent = [EKPSingleton loadStudent];
    
    //Web Service Call
    NSString *urlString = [NSString stringWithFormat:@"%@%@schoolcode=%@&transport_id=%@", BASE_API_URL, BUS_LOCATION_API_URL, currentStudent.studentSchoolCode, transportId];
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
    
    return [[responseArray objectAtIndex:0] mutableCopy];
}

@end
