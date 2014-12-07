//
//  EKPEnums.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 10/29/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    
    kEKPThemeRed = 0,
    kEKPThemeGreen,
    kEKPThemeBlue
    
} kEKPTheme;

typedef enum {
    // For Edu Notice
    kEKPDashboardMenuNotice,
    kEKPDashboardMenuEvent,
    kEKPDashboardMenuResult,
    kEKPDashboardMenuTimeTable,
    kEKPDashboardMenuGallary,
    // For Edu Menu
    kEKPDashboardMenuEduSen,
    kEKPDashboardMenuLibrary,
    kEKPDashboardMenuTransport,
    kEKPDashboardMenuBoarding,
    kEKPDashboardMenuPayment
    
} EKPDashboardMenus;

typedef enum {
    kEKPUserDeviceIPad,
    kEKPUserDeviceIPhone,
    
} EKPUserDeviceType;

@interface EKPEnums : NSObject

@end
