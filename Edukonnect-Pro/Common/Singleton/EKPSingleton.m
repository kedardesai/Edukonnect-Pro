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

#pragma mark Saving Current Student

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
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *dataRepresentingSavedArray = [defaults objectForKey:EKP_STUDENT_LIST];
    
    NSMutableArray *studentListArray;
    if (dataRepresentingSavedArray != nil)
    {
        NSArray *oldSavedArray = [NSKeyedUnarchiver unarchiveObjectWithData:dataRepresentingSavedArray];
        if (oldSavedArray != nil)
            studentListArray = [[NSMutableArray alloc] initWithArray:oldSavedArray];
        else
            studentListArray = [[NSMutableArray alloc] init];
    }
    
    BOOL isAddedPreviously = NO;
    for (EKPStudent *studentTemp in studentListArray) {
        if ([studentTemp.studentGRNo isEqualToString:student.studentGRNo]) {
            isAddedPreviously = YES;
            break;
        }
    }
    if (!isAddedPreviously) {
        [studentListArray addObject:student];
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:studentListArray];
        [defaults setObject:data forKey:EKP_STUDENT_LIST];
        [defaults synchronize];
    }
}

+ (NSMutableArray *)loadStudentList
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *dataRepresentingSavedArray = [defaults objectForKey:EKP_STUDENT_LIST];
    NSMutableArray *studentListArray;
    if (dataRepresentingSavedArray != nil)
    {
        NSArray *oldSavedArray = [NSKeyedUnarchiver unarchiveObjectWithData:dataRepresentingSavedArray];
        if (oldSavedArray != nil)
            studentListArray = [[NSMutableArray alloc] initWithArray:oldSavedArray];
        else
            studentListArray = [[NSMutableArray alloc] init];
    }
    
    return studentListArray;
}

#pragma mark Saving Current Profile

+ (void)saveCurrentProfile:(EKPProfile *)profile
{
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:profile];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:encodedObject forKey:EKP_CURRENT_PROFILE];
    [defaults synchronize];
}

+ (EKPProfile *)loadCurrentProfile
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *encodedObject = [defaults objectForKey:EKP_CURRENT_PROFILE];
    EKPProfile *profileObj = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
    return profileObj;
}

#pragma mark Saving Notice List

+ (void)saveNoticeList:(NSMutableArray *)noticeList
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:noticeList];
    [defaults setObject:data forKey:EKP_NOTICE_LIST];
    [defaults synchronize];
}

+ (NSMutableArray *)loadNoticeList
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *dataRepresentingSavedArray = [defaults objectForKey:EKP_NOTICE_LIST];
    NSMutableArray *noticeListArray;
    if (dataRepresentingSavedArray != nil)
    {
        NSArray *oldSavedArray = [NSKeyedUnarchiver unarchiveObjectWithData:dataRepresentingSavedArray];
        if (oldSavedArray != nil)
            noticeListArray = [[NSMutableArray alloc] initWithArray:oldSavedArray];
        else
            noticeListArray = [[NSMutableArray alloc] init];
    }
    
    return noticeListArray;
}

#pragma mark Saving ALERT List

+ (void)saveAlertList:(NSMutableArray *)alertList
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:alertList];
    [defaults setObject:data forKey:EKP_ALERT_LIST];
    [defaults synchronize];
}

+ (NSMutableArray *)loadAlertList
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *dataRepresentingSavedArray = [defaults objectForKey:EKP_ALERT_LIST];
    NSMutableArray *noticeListArray;
    if (dataRepresentingSavedArray != nil)
    {
        NSArray *oldSavedArray = [NSKeyedUnarchiver unarchiveObjectWithData:dataRepresentingSavedArray];
        if (oldSavedArray != nil)
            noticeListArray = [[NSMutableArray alloc] initWithArray:oldSavedArray];
        else
            noticeListArray = [[NSMutableArray alloc] init];
    }
    
    return noticeListArray;
}

#pragma mark Saving Event List

+ (void)saveEventList:(NSMutableArray *)eventList
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:eventList];
    [defaults setObject:data forKey:EKP_EVENT_LIST];
    [defaults synchronize];
}

+ (NSMutableArray *)loadEventList
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *dataRepresentingSavedArray = [defaults objectForKey:EKP_EVENT_LIST];
    NSMutableArray *eventListArray;
    if (dataRepresentingSavedArray != nil)
    {
        NSArray *oldSavedArray = [NSKeyedUnarchiver unarchiveObjectWithData:dataRepresentingSavedArray];
        if (oldSavedArray != nil)
            eventListArray = [[NSMutableArray alloc] initWithArray:oldSavedArray];
        else
            eventListArray = [[NSMutableArray alloc] init];
    }
    
    return eventListArray;
}


@end
