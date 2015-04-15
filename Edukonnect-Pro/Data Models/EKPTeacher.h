//
//  EKPTeacher.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 4/12/15.
//  Copyright (c) 2015 Kedar Desai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EKPTeacher : NSObject

@property (nonatomic, strong) NSString *teacherId;
@property (nonatomic, strong) NSString *teacherName;
@property (nonatomic, strong) NSString *teacherDOB;
@property (nonatomic, strong) NSString *teacherSex;
@property (nonatomic, strong) NSString *teacherAddress;
@property (nonatomic, strong) NSString *teacherPhone;

- (void)setDetailsWithTeacher:(EKPTeacher *)teacherObject andDictionary:(NSDictionary *)detailsDict;

@end
