//
//  EKPBook.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/20/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EKPBook : NSObject

@property (nonatomic, strong) NSString *bookId;
@property (nonatomic, strong) NSString *bookName;
@property (nonatomic, strong) NSString *bookCategory;
@property (nonatomic, strong) NSString *bookDesc;
@property (nonatomic, strong) NSString *bookAuthor;
@property (nonatomic, strong) NSString *bookClassId;

@end
