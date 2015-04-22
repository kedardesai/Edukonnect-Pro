//
//  EKPConstants.m
//  Edukonnect-Pro
//
//  Created by Dinesh Panwar on 30/09/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPConstants.h"

@implementation EKPConstants


#pragma mark User-Role Constants
NSString *const ADMIN_ROLE = @"Admin";
NSString *const TEACHER_ROLE = @"Teacher";
NSString *const PARENT_ROLE = @"Parent";
NSString *const STUDENT_ROLE = @"Student";
NSString *const GUEST_ROLE = @"Guest";


#pragma mark Version Constants
NSString *const PRO_VERSION = @"pro";


#pragma mark Screen-Title Constants 
NSString *const REGISTRATION_SCREEN_TITLE = @"Select Who You Are!";
NSString *const LOGIN_SCREEN_TITLE = @"Login";
NSString *const DASHBOARD_SCREEN_TITLE = @"Dashboard";
NSString *const SWITCH_USER_SCREEN_TITLE = @"Switch User";
NSString *const SEARCH_BOOK_SCREEN_TITLE = @"Search Book";
NSString *const SCHOOL_SUPORT_SCREEN_TITLE = @"School Support";
NSString *const SCHOOL_SUPORT_QUERY_SCREEN_TITLE = @"Add New Query";


#pragma mark Segue Names
NSString *const REGISTRATION_SECCESSFUL = @"RegistrationSuccessfulSegue";

#pragma mark Singleton Keys
NSString *const EKP_THEME = @"selectedTheme";
NSString *const EKP_USER = @"loggedUser";
NSString *const EKP_CURRENT_STUDENT = @"loggedStudent";
NSString *const EKP_CURRENT_TEACHER = @"loggedTeacher";
NSString *const EKP_STUDENT_LIST = @"studentList";
NSString *const EKP_CURRENT_PROFILE = @"currentProfile";
NSString *const EKP_NOTICE_LIST = @"noticeList";
NSString *const EKP_EVENT_LIST = @"eventList";
NSString *const EKP_ALERT_LIST = @"alertList";
NSString *const EKP_NOTIFICATION_ID = @"notificationId";
NSString *const EKP_USER_ROLE = @"userRole";
NSString *const EKP_VERSION = @"version";

#pragma API-URL Constants
//NSString *const BASE_API_URL = @"http://mainedukonnect.sbminfotech.com/";
NSString *const BASE_API_URL = @"http://main.edukonnect.net.in/";
NSString *const REGISTRATION_API_URL = @"registration_response.php?";
NSString *const LOGIN_API_URL = @"login_responsenew.php?"; // login_response.php // login_responsenew.php
NSString *const SPECIAL_LOGIN_API_URL = @"login_response_type.php?";
NSString *const EDIT_PROFILE_API_URL = @"editprofile_response.php?";
NSString *const NOTICEBOARD_API_URL = @"noticeboard_response.php?";
NSString *const ALERT_API_URL = @"notice_list_response.php?";
NSString *const EVENT_API_URL = @"event_class_response.php?";
NSString *const LEAVE_LIST_API_URL = @"leavelist_response.php?";
NSString *const LEAVE_APPLY_API_URL = @"leaveadd_response.php?";
NSString *const EXAM_LIST_API_URL = @"resultlist_response.php?";
NSString *const RESULT_API_URL = @"result_response.php?";
NSString *const TIMETABLE_API_URL = @"timetable_response.php?";
NSString *const GALLARY_API_URL = @"gallerylist_response.php?";
NSString *const GALLARY_IMAGE_API_URL = @"gallery_image_response.php?";
NSString *const TRANSPORT_LIST_API_URL = @"transport_list.php?";
NSString *const BUS_LOCATION_API_URL = @"transport_details.php?";
NSString *const DORMITORIES_API_URL = @"dormitories.php?";
NSString *const LIBRARY_BOOK_LIST_API_URL = @"lib_BookList.php?";
NSString *const LIBRARY_BOOK_SEARCH_API_URL = @"lib_BookList_Search.php?";
NSString *const LIBRARY_MY_BOOKS_API_URL = @"MyBookList.php?";
NSString *const LIBRARY_REQUEST_BOOK_API_URL = @"RequestBook.php?";
NSString *const LIBRARY_CANCEL_REQUEST_BOOK_API_URL = @"CancelRequestBook.php?";
NSString *const LIBRARY_BOOK_AVAILABILITY_API_URL = @"AvailableBookCount.php?";
NSString *const PAYMENT_API_URL = @"invoice.php?";
NSString *const PULL_NOTIFICATION_API_URL = @"broadcast.php?";
NSString *const EVENT_ISGOING_CHECK_API_URL = @"is_going_check.php?";
NSString *const EVENT_ISGOING_API_URL = @"is_going_response.php?";
NSString *const EFFECTIVE_PARENTING_URL = @"http://4parents.mobi/effective_parenting.php";
NSString *const BEHAVIOURAL_ISSUES_URL = @"http://4parents.mobi/behavioral.php";
NSString *const LOCATOR_URL = @"http://4parents.mobi/locator.php";
NSString *const CAREER_COUNSELING_URL = @"http://4parents.mobi/career.php";
NSString *const KNOWLEDGE_CENTRE_URL = @"http://4parents.mobi/teacherdashboard.php";
NSString *const SCHOOL_SUPPORT_API_URL = @"schoolsupportlist_response.php?";
NSString *const SCHOOL_SUPPORT_QUERY_API_URL = @"schoolsupport_addquestion.php?";


//http://main.edukonnect.net.in/is_going_check.php?schoolcode=sch001&student_id=1&event_id=1
//http://main.edukonnect.net.in/is_going_response.php?schoolcode=SCH001&event_id=1&student_id=1


#pragma mark Login-API Constants
NSString *const LOGIN_API_SCHOOL_DETAILS = @"school_details";
NSString *const LOGIN_API_TEACHER_DETAILS = @"teacher_details";
NSString *const LOGIN_API_SCHOOL_ADDRESS = @"address";
NSString *const LOGIN_API_SCHOOL_EMAIL = @"email";
NSString *const LOGIN_API_SCHOOL_LOGO = @"logo";
NSString *const LOGIN_API_SCHOOL_NAME = @"schoolname";
NSString *const LOGIN_API_BASE_PATH = @"base_path";
NSString *const LOGIN_API_FB_PATH = @"facebook_link";
NSString *const LOGIN_API_TWITTER_PATH = @"twitter_link";
NSString *const LOGIN_API_GOOGLEPLUS_PATH = @"googleplus_link";
NSString *const LOGIN_API_ABOUT_SCHOOL = @"about_school";
NSString *const LOGIN_API_STUDENT_DETAILS = @"student_details";
NSString *const LOGIN_API_STUDENT_ADDRESS = @"address";
NSString *const LOGIN_API_STUDENT_BIRTHDAY = @"birthday";
NSString *const LOGIN_API_STUDENT_CLASS = @"class";
NSString *const LOGIN_API_STUDENT_GRNO = @"grno";
NSString *const LOGIN_API_STUDENT_NAME = @"name";
NSString *const LOGIN_API_STUDENT_ROLLNO = @"rollno";
NSString *const LOGIN_API_STUDENT_SEX = @"sex";
NSString *const LOGIN_API_STUDENT_ID = @"student_id";
NSString *const LOGIN_API_TEACHER_ID = @"teacher_id";
NSString *const LOGIN_API_TEACHER_NAME = @"name";
NSString *const LOGIN_API_TEACHER_DOB = @"birthday";
NSString *const LOGIN_API_TEACHER_SEX = @"sex";
NSString *const LOGIN_API_TEACHER_ADDRESS = @"address";
NSString *const LOGIN_API_TEACHER_PHONE = @"phone";

#pragma mark NOTICEBOARD-API Constants
NSString *const NOTICEBOARD_API_NOTICE = @"notice";
NSString *const NOTICEBOARD_API_NEXT_PAGE = @"nextpage";
NSString *const NOTICEBOARD_API_NOTICE_ID = @"noticeid";
NSString *const NOTICEBOARD_API_HEADING = @"heading";
NSString *const NOTICEBOARD_API_MESSAGE_DETAILS = @"msg_details";
NSString *const NOTICEBOARD_API_TIME_STAMP = @"timestamp";

#pragma mark ALERTS-API Constants
NSString *const ALERT_API_NOTICE = @"notice";
NSString *const ALERT_API_NEXT_PAGE = @"nextpage";
NSString *const ALERT_API_NOTICE_ID = @"notice_id";
NSString *const ALERT_API_HEADING = @"heading";
NSString *const ALERT_API_MESSAGE = @"message";
NSString *const ALERT_API_CREATED_BY = @"createdby";
NSString *const ALERT_API_IS_SEEN = @"isseen";

#pragma mark EVENTS-API Constants
NSString *const EVENT_API_EVENT = @"event";
NSString *const EVENT_API_NEXT_PAGE = @"nextpage";
NSString *const EVENT_API_ID = @"eventid";
NSString *const EVENT_API_NAME = @"event_name";
NSString *const EVENT_API_CLASS_ID = @"class_id";
NSString *const EVENT_API_VENUE = @"venue";
NSString *const EVENT_API_IMAGE = @"image";
NSString *const EVENT_API_CREATED_BY = @"createdby";
NSString *const EVENT_API_CREATED_DATE = @"createddate";
NSString *const EVENT_API_EVENT_DATE = @"eventdate";
NSString *const EVENT_API_EVENT_TIME = @"eventtime";
NSString *const EVENT_API_ISGOINGCONTROL = @"is_going_control_to_show";

#pragma mark EXAM_LIST-API Constants
NSString *const EXAM_ID = @"exam_id";
NSString *const EXAM_NAME = @"name";
NSString *const EXAM_DATE = @"date";

#pragma mark RESULT-API Constants
NSString *const RESULT_SUBJECT = @"subject";
NSString *const RESULT_MARKS = @"marks";
NSString *const RESULT_OUT_OF = @"outof";
NSString *const RESULT_ATTENDANCE = @"attendance";
NSString *const RESULT_COMMENT = @"comment";

#pragma mark TIMETABLE-API Constants
NSString *const TIMETABLE_API_DAY = @"day";
NSString *const TIMETABLE_API_LECTURE = @"lecture";
NSString *const TIMETABLE_API_START_TIME = @"start_time";
NSString *const TIMETABLE_API_END_TIME = @"end_time";
NSString *const TIMETABLE_API_STATUS = @"status";
NSString *const TIMETABLE_API_MESSAGE = @"message";

#pragma mark GALLERY-API Constants
NSString *const GALLERY_API_GALLERY = @"gallery";
NSString *const GALLERY_API_GALLERY_ID = @"gallery_id";
NSString *const GALLERY_API_GALLERY_NAME = @"gallery_name";
NSString *const GALLERY_API_GALLERY_DESC = @"description";
NSString *const GALLERY_API_GALLERY_NEXT_PAGE = @"nextpage";
NSString *const GALLERY_API_GALLERY_IMAGE_LINK = @"imagelink";

#pragma mark TRANSPORT-API Constants
NSString *const TRANSPORT_API_ID = @"transport_id";
NSString *const TRANSPORT_API_ROUTE_NAME = @"route_name";
NSString *const TRANSPORT_API_DRIVER_NAME = @"driver_name";
NSString *const TRANSPORT_API_DESC = @"description";
NSString *const TRANSPORT_API_ROUTE_FARE = @"route_fare";
NSString *const TRANSPORT_API_MOBILE1 = @"mobile1";
NSString *const TRANSPORT_API_MOBILE2 = @"mobile2";
NSString *const TRANSPORT_API_LATITUDE = @"latitude";
NSString *const TRANSPORT_API_LONGITUDE = @"longitude";

#pragma mark DORMITORY-API Constants
NSString *const DORMITORIES_API_TAG = @"Dormitories";
NSString *const DORMITORIES_API_ID = @"dormitory_id";
NSString *const DORMITORIES_API_NAME = @"name";
NSString *const DORMITORIES_API_ROOMS = @"number_of_room";
NSString *const DORMITORIES_API_DESC = @"description";
NSString *const DORMITORIES_API_NEXT_PAGE = @"nextpage";

#pragma mark LIBRARY-API Constants
NSString *const LIBRARY_API_TAG = @"book";
NSString *const LIBRARY_API_ID = @"book_id";
NSString *const LIBRARY_API_NAME = @"name";
NSString *const LIBRARY_API_CATEGORY = @"category";
NSString *const LIBRARY_API_DESC = @"description";
NSString *const LIBRARY_API_AUTHOR = @"author";
NSString *const LIBRARY_API_CLASS_ID = @"class_id";
NSString *const LIBRARY_API_STATUS = @"status";
NSString *const LIBRARY_API_NEXT_PAGE = @"nextpage";

#pragma mark PAYMENT-API Constants
NSString *const PAYMENT_API_TAG = @"invoice";
NSString *const PAYMENT_API_INVOICE_ID = @"invoice_id";
NSString *const PAYMENT_API_TITLE = @"title";
NSString *const PAYMENT_API_DESC = @"description";
NSString *const PAYMENT_API_AMOUNT = @"amount";
NSString *const PAYMENT_API_STATUS = @"status";
NSString *const PAYMENT_API_DUE_DATE = @"duedate";

#pragma mark LEAVE-API Constants
NSString *const LEAVE_API_TAG = @"leaves";
NSString *const LEAVE_API_ID = @"leave_id";
NSString *const LEAVE_API_NOTE = @"leave_note";
NSString *const LEAVE_API_START_DT = @"start_date";
NSString *const LEAVE_API_END_DT = @"end_date";
NSString *const LEAVE_API_DAY_TYPE = @"full_half_day";
NSString *const LEAVE_API_STATUS = @"status";
NSString *const LEAVE_API_DAYS = @"days";

#pragma mark SHOOL_SUPPORT-API Constants
NSString *const SCHOOL_SUPPORT_API_TAG = @"school_support";
NSString *const SCHOOL_SUPPORT_API_ID = @"id";
NSString *const SCHOOL_SUPPORT_API_QUESTION = @"question";
NSString *const SCHOOL_SUPPORT_API_TYPE = @"type";
NSString *const SCHOOL_SUPPORT_API_CREATED_DT = @"created_date";
NSString *const SCHOOL_SUPPORT_API_CREATED_BY = @"created_by";
NSString *const SCHOOL_SUPPORT_API_IS_SEEN = @"is_seen";
NSString *const SCHOOL_SUPPORT_API_NEXT_PAGE = @"nextpage";

#pragma mark HOMEWORK Constants
NSString *const HOMEWORK_API_TAG = @"homework";
NSString *const HOMEWORK_API_ID = @"id";
NSString *const HOMEWORK_API_HEADING = @"heading";
NSString *const HOMEWORK_API_DETAILS = @"details";
NSString *const HOMEWORK_API_DT = @"date";
NSString *const HOMEWORK_API_IS_FILE_UPLOADED = @"is_file_uploaded";
NSString *const HOMEWORK_API_CREATED_BY = @"created_by";
NSString *const HOMEWORK_API_FILE_EXT = @"fileExt";


#pragma mark PULL_NOTIFICATION Constants
NSString *const NOTIFICATION_API_ID = @"id";
NSString *const NOTIFICATION_API_HEADING = @"heading";
NSString *const NOTIFICATION_API_TYPE = @"type";

#pragma mark Response Keys
NSString *const STATUS_KEY = @"status";
NSString *const MESSAGE_KEY = @"message";


@end
