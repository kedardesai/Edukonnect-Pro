//
//  EKPAlert.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/20/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EKPAlert : NSObject

@property (nonatomic, strong) NSNumber *noticeId;
@property (nonatomic, strong) NSString *noticeHeading;
@property (nonatomic, strong) NSString *noticeMessage;
@property (nonatomic, strong) NSString *noticeCreatedBy;
@property (nonatomic) BOOL isSeen;

@end
