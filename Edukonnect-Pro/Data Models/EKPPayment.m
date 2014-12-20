//
//  EKPPayment.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/20/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPPayment.h"

@implementation EKPPayment

#pragma mark LifeCycle Methods

- (id)init
{
    self = [super init];
    if (self) {
        self.paymentAmount = @"";
        self.paymentDesc = @"";
        self.paymentDueDate = @"";
        self.paymentInvoiceId = @"";
        self.paymentStatus = @"";
        self.paymentTitle = @"";
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if (self != nil)
    {
        //decode the properties
        self.paymentAmount = [decoder decodeObjectForKey:@"paymentAmount"];
        self.paymentDesc = [decoder decodeObjectForKey:@"paymentDesc"];
        self.paymentDueDate = [decoder decodeObjectForKey:@"paymentDueDate"];
        self.paymentInvoiceId = [decoder decodeObjectForKey:@"paymentInvoiceId"];
        self.paymentStatus = [decoder decodeObjectForKey:@"paymentStatus"];
        self.paymentTitle = [decoder decodeObjectForKey:@"paymentTitle"];
    }
    return self;
}

#pragma mark Encoding Object

-(void)encodeWithCoder:(NSCoder *)encoder
{
    //Encode the properties of the object
    [encoder encodeObject:self.paymentAmount forKey:@"paymentAmount"];
    [encoder encodeObject:self.paymentDesc forKey:@"paymentDesc"];
    [encoder encodeObject:self.paymentDueDate forKey:@"paymentDueDate"];
    [encoder encodeObject:self.paymentInvoiceId forKey:@"paymentInvoiceId"];
    [encoder encodeObject:self.paymentStatus forKey:@"paymentStatus"];
    [encoder encodeObject:self.paymentTitle forKey:@"paymentTitle"];
}

@end
