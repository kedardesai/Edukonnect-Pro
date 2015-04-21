//
//  EKPSchoolSupport.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 4/21/15.
//  Copyright (c) 2015 Kedar Desai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EKPSchoolSupport : NSObject

@property (nonatomic, strong) NSString *schoolSupportId;
@property (nonatomic, strong) NSString *schoolSupportQuestion;
@property (nonatomic, strong) NSString *schoolSupportType;
@property (nonatomic, strong) NSString *schoolSupportCreatedDate;
@property (nonatomic, strong) NSString *schoolSupportCreatedBy;
@property (nonatomic) BOOL schoolSupportIsSeen;

- (void)setSchoolSupportDetailsWithDictionary:(NSDictionary *)dict;

@end
