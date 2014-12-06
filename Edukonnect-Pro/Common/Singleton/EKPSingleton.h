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

@interface EKPSingleton : NSObject

+ (void)saveEKPTheme:(kEKPTheme)theme;
+ (kEKPTheme)loadEKPTheme;

+ (void)saveUserWithUser:(EKPUser *)user;
+ (EKPUser *)loadUser;

+ (void)saveStudent:(EKPStudent *)student;
+ (EKPStudent *)loadStudent;

+ (void)addStudentToList:(EKPStudent *)student;
+ (NSMutableArray *)loadStudentList;

+ (void)saveCurrentProfile:(EKPProfile *)profile;
+ (EKPProfile *)loadCurrentProfile;

@end
