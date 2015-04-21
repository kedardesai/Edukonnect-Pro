//
//  EKPSchoolSupportAPI.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 4/20/15.
//  Copyright (c) 2015 Kedar Desai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EKPSchoolSupport.h"

@interface EKPSchoolSupportAPI : NSObject

+ (NSMutableDictionary *)getSchoolSupportQueriesListForPageId:(NSInteger)pageId;

+ (BOOL)submitNewSchoolSupportQuery:(EKPSchoolSupport *)schoolSupportObj;

@end
