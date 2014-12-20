//
//  EKPPayment.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/20/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EKPPayment : NSObject

@property (nonatomic, strong) NSString *paymentInvoiceId;
@property (nonatomic, strong) NSString *paymentTitle;
@property (nonatomic, strong) NSString *paymentDesc;
@property (nonatomic, strong) NSString *paymentAmount;
@property (nonatomic, strong) NSString *paymentStatus;
@property (nonatomic, strong) NSString *paymentDueDate;

@end
