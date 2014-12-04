//
//  EKPStudent.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 11/2/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EKPStudent : NSObject

@property (nonatomic, strong) NSString *studentSchoolCode;
@property (nonatomic, strong) NSString *studentUsername;
@property (nonatomic, strong) NSString *studentPassword;
@property (nonatomic, strong) NSString *studentSchoolAddress;
@property (nonatomic, strong) NSString *studentSchoolEmail;
@property (nonatomic, strong) NSString *studentSchoolLogo;
@property (nonatomic, strong) NSString *studentSchoolName;
@property (nonatomic, strong) NSString *studentAddress;
@property (nonatomic, strong) NSString *studentBirthday;
@property (nonatomic, strong) NSString *studentClass;
@property (nonatomic, strong) NSString *studentGRNo;
@property (nonatomic, strong) NSString *studentName;
@property (nonatomic, strong) NSString *studentRollNo;
@property (nonatomic, strong) NSString *studentSex;

- (void)setDetailsWithStudent:(EKPStudent *)studentObject andDictionary:(NSDictionary *)detailsDict;
- (BOOL)isEqualToStudent:(EKPStudent *)studentObject;

@end
