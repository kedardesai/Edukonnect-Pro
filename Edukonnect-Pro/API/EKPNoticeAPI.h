//
//  EKPNoticeAPI.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/9/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EKPNoticeAPI : NSObject

+ (NSMutableDictionary *)getNoticesForPageId:(NSInteger)pageId;

@end
