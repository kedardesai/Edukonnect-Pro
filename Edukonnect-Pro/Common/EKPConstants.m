//
//  EKPConstants.m
//  Edukonnect-Pro
//
//  Created by Dinesh Panwar on 30/09/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPConstants.h"

@implementation EKPConstants

#pragma mark Screen-Title Constants 
NSString *const REGISTRATION_SCREEN_TITLE = @"Registration";
NSString *const LOGIN_SCREEN_TITLE = @"Login";
NSString *const DASHBOARD_SCREEN_TITLE = @"Dashboard";

#pragma mark Segue Names
NSString *const REGISTRATION_SECCESSFUL = @"RegistrationSuccessfulSegue";

#pragma mark Singleton Keys
NSString *const EKP_THEME = @"selectedTheme";
NSString *const EKP_USER = @"loggedUser";
NSString *const EKP_CURRENT_STUDENT = @"loggedStudent";
NSString *const EKP_STUDENT_LIST = @"studentList";

#pragma API-URL Constants
NSString *const BASE_API_URL = @"http://mainedukonnect.sbminfotech.com/";
NSString *const REGISTRATION_API_URL = @"registration_response.php?";
NSString *const LOGIN_API_URL = @"login_response.php?";
NSString *const EDIT_PROFILE_API_URL = @"editprofile_response.php?";
NSString *const NOTICEBOARD_API_URL = @"noticeboard_response.php?";
NSString *const NOTICE_API_URL = @"notice_list_response.php?";
NSString *const EVENT_API_URL = @"event_class_response.php?";
NSString *const RESULT_API_URL = @"resultlist_response.php?";
NSString *const TIMETABLE_API_URL = @"timetable_response.php?";
NSString *const GALLARY_API_URL = @"gallerylist_response.php?";
NSString *const GALLARY_IMAGE_API_URL = @"gallery_image_response.php?";

#pragma mark Login API Constants
NSString *const LOGIN_API_SCHOOL_DETAILS = @"school_details";
NSString *const LOGIN_API_SCHOOL_ADDRESS = @"address";
NSString *const LOGIN_API_SCHOOL_EMAIL = @"email";
NSString *const LOGIN_API_SCHOOL_LOGO = @"logo";
NSString *const LOGIN_API_SCHOOL_NAME = @"schoolname";
NSString *const LOGIN_API_STUDENT_DETAILS = @"student_details";
NSString *const LOGIN_API_STUDENT_ADDRESS = @"address";
NSString *const LOGIN_API_STUDENT_BIRTHDAY = @"birthday";
NSString *const LOGIN_API_STUDENT_CLASS = @"class";
NSString *const LOGIN_API_STUDENT_GRNO = @"grno";
NSString *const LOGIN_API_STUDENT_NAME = @"name";
NSString *const LOGIN_API_STUDENT_ROLLNO = @"rollno";
NSString *const LOGIN_API_STUDENT_SEX = @"sex";


#pragma mark Response Keys
NSString *const STATUS_KEY = @"status";
NSString *const MESSAGE_KEY = @"message";


@end
