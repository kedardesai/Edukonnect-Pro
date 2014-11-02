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

#pragma mark Saving Themes

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

#pragma mark Saving User

+ (void)saveUserWithName:(NSString *)userName mobile:(NSString *)mobile email:(NSString *)email andDeviceId:(NSString *)deviceId
{
    EKPUser *user = [[EKPUser alloc] init];
    user.userName = userName;
    user.userMobile = mobile;
    user.userEmail = email;
    user.userDeviceId = deviceId;
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:user];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:encodedObject forKey:EKP_USER];
    [defaults synchronize];
}

+ (EKPUser *)loadUser
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *encodedObject = [defaults objectForKey:EKP_USER];
    EKPUser *userObj = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
    return userObj;
}


@end
