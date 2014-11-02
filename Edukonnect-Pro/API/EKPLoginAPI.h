//
//  EKPLoginAPI.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 11/2/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EKPStudent.h"

@interface EKPLoginAPI : NSObject

+ (BOOL)loginUserWith:(EKPStudent *)student;

@end
