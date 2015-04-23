//
//  EKPHomework.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 4/22/15.
//  Copyright (c) 2015 Kedar Desai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EKPHomework : NSObject

@property (nonatomic, strong) NSString *homeworkId;
@property (nonatomic, strong) NSString *homeworkHeading;
@property (nonatomic, strong) NSString *homeworkDetails;
@property (nonatomic, strong) NSString *homeworkDate;
@property (nonatomic) BOOL homeworkIsFileUploaded;
@property (nonatomic, strong) NSString *homeworkCreatedBy;
@property (nonatomic, strong) NSString *homeworkFileExt;

- (void)setHomeworkDetailsWithDictionary:(NSDictionary *)dict;

@end
