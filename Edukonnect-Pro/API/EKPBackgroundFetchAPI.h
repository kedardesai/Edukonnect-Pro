//
//  EKPBackgroundFetchAPI.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/21/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EKPBackgroundFetchAPI : NSObject

+ (NSMutableDictionary *)checkForBackgroundUpdatesForSchoolCode:(NSString *)schoolCode andStudentId:(NSString *)studentId;

@end
