//
//  EKPResultAPI.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/11/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EKPResultAPI : NSObject

+ (NSMutableArray *)getExamList;

+ (NSMutableArray *)getResultForExamId:(NSString *)examId;

@end
