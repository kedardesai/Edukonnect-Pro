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

@interface EKPSingleton : NSObject

+ (void)saveEKPTheme:(kEKPTheme)theme;
+ (kEKPTheme)loadEKPTheme;

+ (void)saveUserWithName:(NSString *)userName mobile:(NSString *)mobile email:(NSString *)email andDeviceId:(NSString *)deviceId;
+ (EKPUser *)loadUser;

@end
