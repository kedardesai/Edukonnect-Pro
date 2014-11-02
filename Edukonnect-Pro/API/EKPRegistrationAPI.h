//
//  EKPRegistrationAPI.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 10/29/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EKPUser.h"

@interface EKPRegistrationAPI : NSObject

+ (BOOL)registerUserWith:(EKPUser *)user;

@end
