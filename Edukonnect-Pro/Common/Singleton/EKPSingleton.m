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

+ (void)saveUserWithUser:(EKPUser *)userObj
{
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:userObj];
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

#pragma mark Saving Student and List

+ (void)addNewStudent:(EKPStudent *)student
{
    
}

+ (NSMutableArray *)loadStudentList
{
    NSMutableArray *studentList = [[NSMutableArray alloc] init];
    return studentList;
}


@end
