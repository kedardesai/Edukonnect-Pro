//
//  EKPHomeworkAPI.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 4/22/15.
//  Copyright (c) 2015 Kedar Desai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EKPHomeworkAPI : NSObject

+ (NSMutableDictionary *)getHomeworkListForPageId:(NSInteger)pageId;

@end
