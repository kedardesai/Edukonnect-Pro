//
//  EKPUtility.m
//  Edukonnect-Pro
//
//  Created by Dinesh Panwar on 30/09/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPUtility.h"

@implementation EKPUtility

#pragma Show-Alert Methods

+ (void)showAlertWithTitle:(NSString *)title andMessage:(NSString *)message
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
}

+ (void)showAlertWithTitle:(NSString *)title andMessage:(NSString *)message withDelegate:(id<UIAlertViewDelegate>)delegate
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:delegate cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
}

+ (EKPUserDeviceType)getUserDeviceType
{
    if ([[UIDevice currentDevice] respondsToSelector:@selector(userInterfaceIdiom)]) {
        //We can test if it's an iPad. Running iOS3.2+
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
            return kEKPUserDeviceIPad; //is an iPad
        else
            return kEKPUserDeviceIPhone; //is an iPhone
        
    } else {
        return kEKPUserDeviceIPhone; //does not respond to selector, therefore must be < iOS3.2, therefore is an iPhone
    }
}

+ (UIStoryboard *)getStoryboardForCurrentDevice
{
    UIStoryboard *storyboard;
    if ([EKPUtility getUserDeviceType] == kEKPUserDeviceIPhone) {
        storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:[NSBundle mainBundle]];
    } else {
        storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPad" bundle:[NSBundle mainBundle]];
    }
    
    return storyboard;
}

@end
