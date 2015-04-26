//
//  EKPProfileAPI.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/6/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EKPProfileAPI : NSObject

+ (BOOL)updateProfile:(EKPProfile *)profile;

+ (BOOL)changePassword:(NSString *)newPassword with:(NSString *)oldPassword;

@end
