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
NSString *const SWITCH_USER_SCREEN_TITLE = @"Switch User";
NSString *const SEARCH_BOOK_SCREEN_TITLE = @"Search Book";


#pragma mark Segue Names
NSString *const REGISTRATION_SECCESSFUL = @"RegistrationSuccessfulSegue";

#pragma mark Singleton Keys
NSString *const EKP_THEME = @"selectedTheme";
NSString *const EKP_USER = @"loggedUser";
NSString *const EKP_CURRENT_STUDENT = @"loggedStudent";
NSString *const EKP_STUDENT_LIST = @"studentList";
NSString *const EKP_CURRENT_PROFILE = @"currentProfile";
NSString *const EKP_NOTICE_LIST = @"noticeList";
NSString *const EKP_EVENT_LIST = @"eventList";
NSString *const EKP_ALERT_LIST = @"alertList";
NSString *const EKP_NOTIFICATION_ID = @"notificationId";

#pragma API-URL Constants
//NSString *const BASE_API_URL = @"http://mainedukonnect.sbminfotech.com/";
NSString *const BASE_API_URL = @"http://main.edukonnect.net.in/";
NSString *const REGISTRATION_API_URL = @"registration_response.php?";
NSString *const LOGIN_API_URL = @"login_response.php?";
NSString *const EDIT_PROFILE_API_URL = @"editprofile_response.php?";
NSString *const NOTICEBOARD_API_URL = @"noticeboard_response.php?";
NSString *const ALERT_API_URL = @"notice_list_response.php?";
NSString *const EVENT_API_URL = @"event_class_response.php?";
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

#pragma mark Login-API Constants
NSString *const LOGIN_API_SCHOOL_DETAILS = @"school_details";
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

#pragma mark PULL_NOTIFICATION Constants
NSString *const NOTIFICATION_API_ID = @"id";
NSString *const NOTIFICATION_API_HEADING = @"heading";
NSString *const NOTIFICATION_API_TYPE = @"type";

#pragma mark Response Keys
NSString *const STATUS_KEY = @"status";
NSString *const MESSAGE_KEY = @"message";


@end
