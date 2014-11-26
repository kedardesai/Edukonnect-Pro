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
    
}

+ (EKPUser *)loadUser
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *encodedObject = [defaults objectForKey:EKP_USER];
    EKPUser *userObj = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
    return userObj;
}

#pragma mark Saving Student

+ (void)saveStudent:(EKPStudent *)student
{
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:student];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:encodedObject forKey:EKP_CURRENT_STUDENT];
    [defaults synchronize];
}

+ (EKPStudent *)loadStudent
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *encodedObject = [defaults objectForKey:EKP_CURRENT_STUDENT];
    EKPStudent *studentObj = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
    return studentObj;
}

#pragma mark Student List

+ (void)addStudentToList:(EKPStudent *)student
{
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:student];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSMutableArray *studentList = [[NSMutableArray alloc] init];
    if ([defaults objectForKey:EKP_CURRENT_STUDENT]) {
        studentList = [[defaults objectForKey:EKP_CURRENT_STUDENT] mutableCopy];
    }
    
    [studentList addObject:encodedObject];
    [defaults setObject:studentList forKey:EKP_STUDENT_LIST];
    [defaults synchronize];
}

+ (NSMutableArray *)loadStudentList
{
    NSMutableArray *decodedStudentList = [[NSMutableArray alloc] init];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSMutableArray *studentList = [[NSMutableArray alloc] initWithArray:[defaults objectForKey:EKP_CURRENT_STUDENT]];
    for (NSData *encodedObj in studentList) {
        EKPStudent *studentObj = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObj];
        [decodedStudentList addObject:studentObj];
    }
    
    return studentList;
}


@end
