//
//  EKPLibraryAPI.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/18/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EKPLibraryAPI : NSObject

+ (NSMutableDictionary *)getAllBooksForPageId:(NSInteger)pageId;

+ (NSMutableDictionary *)getBooksForKeyword:(NSString *)keyword andForPageId:(NSInteger)pageId;

+ (NSMutableDictionary *)getMyBooksForPageId:(NSInteger)pageId;

+ (BOOL)requestBook:(NSString *)bookId;

+ (BOOL)cancelRequestBook:(NSString *)bookId;

+ (BOOL)getAvailibility:(NSString *)bookId;

@end
