//
//  EKPLeave.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 4/13/15.
//  Copyright (c) 2015 Kedar Desai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EKPLeave : NSObject

@property (nonatomic, strong) NSString *leaveId;
@property (nonatomic, strong) NSString *leaveNote;
@property (nonatomic, strong) NSString *leaveDtFrom;
@property (nonatomic, strong) NSString *leaveDtTo;
@property (nonatomic, strong) NSString *leaveDayType;
@property (nonatomic, strong) NSString *leaveStatus;
@property (nonatomic, strong) NSString *leaveDays;

- (void)setLeaveDetailsWithDictionary:(NSDictionary *)dict;

@end
