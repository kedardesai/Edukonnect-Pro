//
//  EKPUtility.h
//  Edukonnect-Pro
//
//  Created by Dinesh Panwar on 30/09/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EKPEnums.h"

@interface EKPUtility : NSObject

+ (void)showAlertWithTitle:(NSString *)title andMessage:(NSString *)message;
+ (void)showAlertWithTitle:(NSString *)title andMessage:(NSString *)message withDelegate:(id<UIAlertViewDelegate>)delegate;

+ (EKPUserDeviceType)getUserDeviceType;
+ (UIStoryboard *)getStoryboardForCurrentDevice;

@end
