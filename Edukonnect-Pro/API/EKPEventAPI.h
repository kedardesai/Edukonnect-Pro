//
//  EKPEventAPI.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/10/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EKPEventAPI : NSObject

+ (NSMutableDictionary *)getEventsForPageId:(NSInteger)pageId;
+ (BOOL)userIsGoingToEvent:(NSString *)eventId;
+ (BOOL)checkIsGoing:(NSString *)eventId;

@end
