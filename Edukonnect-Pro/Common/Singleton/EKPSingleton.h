//
//  EKPSingleton.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 10/29/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EKPEnums.h"
#import "EKPUser.h"
#import "EKPStudent.h"
#import "EKPProfile.h"
#import "EKPNotice.h"

@interface EKPSingleton : NSObject

+ (void)saveEKPTheme:(kEKPTheme)theme;
+ (kEKPTheme)loadEKPTheme;

+ (void)saveUserWithUser:(EKPUser *)user;
+ (EKPUser *)loadUser;

+ (void)saveStudent:(EKPStudent *)student;
+ (EKPStudent *)loadStudent;
+ (void)removeStudent;

+ (void)addStudentToList:(EKPStudent *)student;
+ (NSMutableArray *)loadStudentList;

+ (void)saveCurrentProfile:(EKPProfile *)profile;
+ (EKPProfile *)loadCurrentProfile;

+ (void)saveNoticeList:(NSMutableArray *)noticeList;
+ (NSMutableArray *)loadNoticeList;

+ (void)saveAlertList:(NSMutableArray *)alertList;
+ (NSMutableArray *)loadAlertList;

+ (void)saveEventList:(NSMutableArray *)eventList;
+ (NSMutableArray *)loadEventList;

+ (void)saveLastNotificationId:(NSString *)notificationId;
+ (NSString *)loadLastNotificationId;

+ (void)saveUserRole:(NSString *)userRole;
+ (NSString *)loadUserRole;
+ (void)removeUserRole;

+ (void)saveVersion:(NSString *)version;
+ (NSString *)loadVersion;

@end
