//
//  EKPSingleton.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 10/29/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EKPEnums.h"

@interface EKPSingleton : NSObject

+ (void)saveEKPTheme:(kEKPTheme)theme;
+ (kEKPTheme)loadEKPTheme;

@end
