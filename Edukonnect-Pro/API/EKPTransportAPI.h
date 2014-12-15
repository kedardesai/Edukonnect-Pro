//
//  EKPTransportAPI.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/15/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EKPTransportAPI : NSObject

+ (NSMutableArray *)getTransportList;

+ (NSMutableDictionary *)getLocationForBus:(NSString *)transportId;

@end
