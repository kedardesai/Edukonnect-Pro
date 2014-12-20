//
//  EKPConstants.h
//  Edukonnect-Pro
//
//  Created by Dinesh Panwar on 30/09/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EKPConstants : NSObject

FOUNDATION_EXPORT NSString *const REGISTRATION_SCREEN_TITLE;
FOUNDATION_EXPORT NSString *const LOGIN_SCREEN_TITLE;
FOUNDATION_EXPORT NSString *const DASHBOARD_SCREEN_TITLE;
FOUNDATION_EXPORT NSString *const SWITCH_USER_SCREEN_TITLE;
FOUNDATION_EXPORT NSString *const SEARCH_BOOK_SCREEN_TITLE;

FOUNDATION_EXPORT NSString *const REGISTRATION_SECCESSFUL;

FOUNDATION_EXPORT NSString *const EKP_THEME;
FOUNDATION_EXPORT NSString *const EKP_USER;
FOUNDATION_EXPORT NSString *const EKP_CURRENT_STUDENT;
FOUNDATION_EXPORT NSString *const EKP_STUDENT_LIST;
FOUNDATION_EXPORT NSString *const EKP_CURRENT_PROFILE;
FOUNDATION_EXPORT NSString *const EKP_NOTICE_LIST;
FOUNDATION_EXPORT NSString *const EKP_EVENT_LIST;
FOUNDATION_EXPORT NSString *const EKP_ALERT_LIST;
FOUNDATION_EXPORT NSString *const EKP_NOTIFICATION_ID;

FOUNDATION_EXPORT NSString *const BASE_API_URL;
FOUNDATION_EXPORT NSString *const REGISTRATION_API_URL;
FOUNDATION_EXPORT NSString *const LOGIN_API_URL;
FOUNDATION_EXPORT NSString *const EDIT_PROFILE_API_URL;
FOUNDATION_EXPORT NSString *const NOTICEBOARD_API_URL;
FOUNDATION_EXPORT NSString *const ALERT_API_URL;
FOUNDATION_EXPORT NSString *const EVENT_API_URL;
FOUNDATION_EXPORT NSString *const EXAM_LIST_API_URL;
FOUNDATION_EXPORT NSString *const RESULT_API_URL;
FOUNDATION_EXPORT NSString *const TIMETABLE_API_URL;
FOUNDATION_EXPORT NSString *const GALLARY_API_URL;
FOUNDATION_EXPORT NSString *const GALLARY_IMAGE_API_URL;
FOUNDATION_EXPORT NSString *const TRANSPORT_LIST_API_URL;
FOUNDATION_EXPORT NSString *const BUS_LOCATION_API_URL;
FOUNDATION_EXPORT NSString *const DORMITORIES_API_URL;
FOUNDATION_EXPORT NSString *const LIBRARY_BOOK_LIST_API_URL;
FOUNDATION_EXPORT NSString *const LIBRARY_BOOK_SEARCH_API_URL;
FOUNDATION_EXPORT NSString *const LIBRARY_MY_BOOKS_API_URL;
FOUNDATION_EXPORT NSString *const LIBRARY_REQUEST_BOOK_API_URL;
FOUNDATION_EXPORT NSString *const LIBRARY_CANCEL_REQUEST_BOOK_API_URL;
FOUNDATION_EXPORT NSString *const LIBRARY_BOOK_AVAILABILITY_API_URL;
FOUNDATION_EXPORT NSString *const PAYMENT_API_URL;
FOUNDATION_EXPORT NSString *const PULL_NOTIFICATION_API_URL;

FOUNDATION_EXPORT NSString *const LOGIN_API_SCHOOL_DETAILS;
FOUNDATION_EXPORT NSString *const LOGIN_API_SCHOOL_ADDRESS;
FOUNDATION_EXPORT NSString *const LOGIN_API_SCHOOL_EMAIL;
FOUNDATION_EXPORT NSString *const LOGIN_API_SCHOOL_LOGO;
FOUNDATION_EXPORT NSString *const LOGIN_API_SCHOOL_NAME;
FOUNDATION_EXPORT NSString *const LOGIN_API_BASE_PATH;
FOUNDATION_EXPORT NSString *const LOGIN_API_FB_PATH;
FOUNDATION_EXPORT NSString *const LOGIN_API_TWITTER_PATH;
FOUNDATION_EXPORT NSString *const LOGIN_API_GOOGLEPLUS_PATH;
FOUNDATION_EXPORT NSString *const LOGIN_API_ABOUT_SCHOOL;
FOUNDATION_EXPORT NSString *const LOGIN_API_STUDENT_DETAILS;
FOUNDATION_EXPORT NSString *const LOGIN_API_STUDENT_ADDRESS;
FOUNDATION_EXPORT NSString *const LOGIN_API_STUDENT_BIRTHDAY;
FOUNDATION_EXPORT NSString *const LOGIN_API_STUDENT_CLASS;
FOUNDATION_EXPORT NSString *const LOGIN_API_STUDENT_GRNO;
FOUNDATION_EXPORT NSString *const LOGIN_API_STUDENT_NAME;
FOUNDATION_EXPORT NSString *const LOGIN_API_STUDENT_ROLLNO;
FOUNDATION_EXPORT NSString *const LOGIN_API_STUDENT_SEX;
FOUNDATION_EXPORT NSString *const LOGIN_API_STUDENT_ID;

FOUNDATION_EXPORT NSString *const NOTICEBOARD_API_NOTICE;
FOUNDATION_EXPORT NSString *const NOTICEBOARD_API_NEXT_PAGE;
FOUNDATION_EXPORT NSString *const NOTICEBOARD_API_NOTICE_ID;
FOUNDATION_EXPORT NSString *const NOTICEBOARD_API_HEADING;
FOUNDATION_EXPORT NSString *const NOTICEBOARD_API_MESSAGE_DETAILS;
FOUNDATION_EXPORT NSString *const NOTICEBOARD_API_TIME_STAMP;

FOUNDATION_EXPORT NSString *const ALERT_API_NOTICE;
FOUNDATION_EXPORT NSString *const ALERT_API_NEXT_PAGE;
FOUNDATION_EXPORT NSString *const ALERT_API_NOTICE_ID;
FOUNDATION_EXPORT NSString *const ALERT_API_HEADING;
FOUNDATION_EXPORT NSString *const ALERT_API_MESSAGE;
FOUNDATION_EXPORT NSString *const ALERT_API_CREATED_BY;
FOUNDATION_EXPORT NSString *const ALERT_API_IS_SEEN;

FOUNDATION_EXPORT NSString *const EVENT_API_EVENT;
FOUNDATION_EXPORT NSString *const EVENT_API_NEXT_PAGE;
FOUNDATION_EXPORT NSString *const EVENT_API_ID;
FOUNDATION_EXPORT NSString *const EVENT_API_NAME;
FOUNDATION_EXPORT NSString *const EVENT_API_CLASS_ID;
FOUNDATION_EXPORT NSString *const EVENT_API_VENUE;
FOUNDATION_EXPORT NSString *const EVENT_API_IMAGE;
FOUNDATION_EXPORT NSString *const EVENT_API_CREATED_BY;
FOUNDATION_EXPORT NSString *const EVENT_API_CREATED_DATE;
FOUNDATION_EXPORT NSString *const EVENT_API_EVENT_DATE;
FOUNDATION_EXPORT NSString *const EVENT_API_EVENT_TIME;

FOUNDATION_EXPORT NSString *const EXAM_ID;
FOUNDATION_EXPORT NSString *const EXAM_NAME;
FOUNDATION_EXPORT NSString *const EXAM_DATE;

FOUNDATION_EXPORT NSString *const RESULT_SUBJECT;
FOUNDATION_EXPORT NSString *const RESULT_MARKS;
FOUNDATION_EXPORT NSString *const RESULT_OUT_OF;
FOUNDATION_EXPORT NSString *const RESULT_ATTENDANCE;
FOUNDATION_EXPORT NSString *const RESULT_COMMENT;

FOUNDATION_EXPORT NSString *const TIMETABLE_API_DAY;
FOUNDATION_EXPORT NSString *const TIMETABLE_API_LECTURE;
FOUNDATION_EXPORT NSString *const TIMETABLE_API_START_TIME;
FOUNDATION_EXPORT NSString *const TIMETABLE_API_END_TIME;
FOUNDATION_EXPORT NSString *const TIMETABLE_API_STATUS;
FOUNDATION_EXPORT NSString *const TIMETABLE_API_MESSAGE;

FOUNDATION_EXPORT NSString *const GALLERY_API_GALLERY;
FOUNDATION_EXPORT NSString *const GALLERY_API_GALLERY_ID;
FOUNDATION_EXPORT NSString *const GALLERY_API_GALLERY_NAME;
FOUNDATION_EXPORT NSString *const GALLERY_API_GALLERY_DESC;
FOUNDATION_EXPORT NSString *const GALLERY_API_GALLERY_NEXT_PAGE;
FOUNDATION_EXPORT NSString *const GALLERY_API_GALLERY_IMAGE_LINK;

FOUNDATION_EXPORT NSString *const TRANSPORT_API_ID;
FOUNDATION_EXPORT NSString *const TRANSPORT_API_ROUTE_NAME;
FOUNDATION_EXPORT NSString *const TRANSPORT_API_DRIVER_NAME;
FOUNDATION_EXPORT NSString *const TRANSPORT_API_DESC;
FOUNDATION_EXPORT NSString *const TRANSPORT_API_ROUTE_FARE;
FOUNDATION_EXPORT NSString *const TRANSPORT_API_MOBILE1;
FOUNDATION_EXPORT NSString *const TRANSPORT_API_MOBILE2;
FOUNDATION_EXPORT NSString *const TRANSPORT_API_LATITUDE;
FOUNDATION_EXPORT NSString *const TRANSPORT_API_LONGITUDE;

FOUNDATION_EXPORT NSString *const DORMITORIES_API_TAG;
FOUNDATION_EXPORT NSString *const DORMITORIES_API_ID;
FOUNDATION_EXPORT NSString *const DORMITORIES_API_NAME;
FOUNDATION_EXPORT NSString *const DORMITORIES_API_ROOMS;
FOUNDATION_EXPORT NSString *const DORMITORIES_API_DESC;
FOUNDATION_EXPORT NSString *const DORMITORIES_API_NEXT_PAGE;

FOUNDATION_EXPORT NSString *const LIBRARY_API_TAG;
FOUNDATION_EXPORT NSString *const LIBRARY_API_ID;
FOUNDATION_EXPORT NSString *const LIBRARY_API_NAME;
FOUNDATION_EXPORT NSString *const LIBRARY_API_CATEGORY;
FOUNDATION_EXPORT NSString *const LIBRARY_API_DESC;
FOUNDATION_EXPORT NSString *const LIBRARY_API_AUTHOR;
FOUNDATION_EXPORT NSString *const LIBRARY_API_CLASS_ID;
FOUNDATION_EXPORT NSString *const LIBRARY_API_STATUS;
FOUNDATION_EXPORT NSString *const LIBRARY_API_NEXT_PAGE;

FOUNDATION_EXPORT NSString *const PAYMENT_API_TAG;
FOUNDATION_EXPORT NSString *const PAYMENT_API_INVOICE_ID;
FOUNDATION_EXPORT NSString *const PAYMENT_API_TITLE;
FOUNDATION_EXPORT NSString *const PAYMENT_API_DESC;
FOUNDATION_EXPORT NSString *const PAYMENT_API_AMOUNT;
FOUNDATION_EXPORT NSString *const PAYMENT_API_STATUS;
FOUNDATION_EXPORT NSString *const PAYMENT_API_DUE_DATE;

FOUNDATION_EXPORT NSString *const NOTIFICATION_API_ID;
FOUNDATION_EXPORT NSString *const NOTIFICATION_API_HEADING;
FOUNDATION_EXPORT NSString *const NOTIFICATION_API_TYPE;

FOUNDATION_EXPORT NSString *const STATUS_KEY;
FOUNDATION_EXPORT NSString *const MESSAGE_KEY;


@end
