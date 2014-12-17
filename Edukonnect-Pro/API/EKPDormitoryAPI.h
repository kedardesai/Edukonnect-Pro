//
//  EKPDormitoryAPI.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/17/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EKPDormitoryAPI : NSObject

+ (NSMutableDictionary *)getDormitoryListWithPageId:(NSInteger)pageId;

@end
