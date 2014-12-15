//
//  EKPTransport.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/15/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EKPTransport : NSObject

@property (nonatomic, strong) NSString *transportId;
@property (nonatomic, strong) NSString *transportRouteName;
@property (nonatomic, strong) NSString *transportDriverName;
@property (nonatomic, strong) NSString *transportDesc;
@property (nonatomic, strong) NSString *transportRouteFare;
@property (nonatomic, strong) NSString *transportMobile1;
@property (nonatomic, strong) NSString *transportMobile2;

@end
