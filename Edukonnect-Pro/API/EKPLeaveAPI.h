//
//  EKPLeaveAPI.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 4/12/15.
//  Copyright (c) 2015 Kedar Desai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EKPLeaveAPI : NSObject

+ (NSMutableArray *)listOfLeavesForPageId:(NSInteger)pageId;

@end
