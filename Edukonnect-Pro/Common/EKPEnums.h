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
    
    kEKPDashboardMenuMyChild = 0,
    kEKPDashboardMenuNotice,
    kEKPDashboardMenuEvent,
    kEKPDashboardMenuTimeTable,
    kEKPDashboardMenuGallary,
    kEKPDashboardMenuAboutUs,
    kEKPDashboardMenuTermsNConditions
    
} EKPDashboardMenus;

@interface EKPEnums : NSObject

@end
