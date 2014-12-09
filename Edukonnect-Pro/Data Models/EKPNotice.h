//
//  EKPNotice.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/9/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EKPNotice : NSObject

@property (nonatomic, strong) NSNumber *noticeId;
@property (nonatomic, strong) NSString *noticeHeading;
@property (nonatomic, strong) NSString *noticeMessage;
@property (nonatomic, strong) NSString *noticeTimeStamp;

@end
