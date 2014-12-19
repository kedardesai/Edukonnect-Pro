//
//  EKPAlertAPI.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/20/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EKPAlertAPI : NSObject

+ (NSMutableDictionary *)getAlertsForPageId:(NSInteger)pageId;

@end
