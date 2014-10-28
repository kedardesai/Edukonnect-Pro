//
//  EKPSingleton.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 10/29/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPSingleton.h"
#import "EKPConstants.h"

@implementation EKPSingleton

+ (void)saveEKPTheme:(kEKPTheme)theme
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:[NSNumber numberWithInteger:theme] forKey:EKP_THEME];
    [userDefaults synchronize];
}

+ (kEKPTheme)loadEKPTheme
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSNumber *themeNumber = [userDefaults objectForKey:EKP_THEME];
    kEKPTheme theme;
    if (themeNumber) {
        theme = (kEKPTheme)[themeNumber integerValue];
        
    } else {
        theme = kEKPThemeBlue;
    }
    
    return theme;
}

@end
