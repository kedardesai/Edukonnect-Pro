//
//  EKPFeesAPI.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/20/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPFeesAPI.h"
#import "EKPPayment.h"

@implementation EKPFeesAPI

+ (NSMutableArray *)getPaymentList
{
    EKPStudent *currentStudent = [EKPSingleton loadStudent];
    
    //Web Service Call
    NSString *urlString = [NSString stringWithFormat:@"%@%@schoolcode=%@&student_id=%@", BASE_API_URL, PAYMENT_API_URL, currentStudent.studentSchoolCode, currentStudent.studentId];
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
    
    NSMutableArray *responseArray = [[responseDict objectForKey:PAYMENT_API_TAG] mutableCopy];
    
    NSMutableArray *resultArray = [[NSMutableArray alloc] init];
    
    for (NSDictionary *paymentDict in responseArray) {
        EKPPayment *paymentObj = [[EKPPayment alloc] init];
        paymentObj.paymentAmount = [paymentDict objectForKey:PAYMENT_API_AMOUNT];
        paymentObj.paymentDesc = [paymentDict objectForKey:PAYMENT_API_DESC];
        paymentObj.paymentDueDate = [paymentDict objectForKey:PAYMENT_API_DUE_DATE];
        paymentObj.paymentInvoiceId = [paymentDict objectForKey:PAYMENT_API_INVOICE_ID];
        paymentObj.paymentStatus = [paymentDict objectForKey:PAYMENT_API_STATUS];
        paymentObj.paymentTitle = [paymentDict objectForKey:PAYMENT_API_TITLE];
        [resultArray addObject:paymentObj];
    }
    
    return resultArray;
}

@end
