//
//  EKPGalleryAPI.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/13/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EKPGalleryAPI : NSObject

+ (NSMutableDictionary *)getGalleryFolderListForPageId:(NSInteger)pageId;

+ (NSMutableArray *)getPhotoListForGalleryId:(NSString *)galleryId;

@end
