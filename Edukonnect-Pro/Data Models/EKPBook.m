//
//  EKPBook.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/20/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPBook.h"

@implementation EKPBook

#pragma mark LifeCycle Methods

- (id)init
{
    self = [super init];
    if (self) {
        self.bookAuthor = @"";
        self.bookCategory = @"";
        self.bookClassId = @"";
        self.bookDesc = @"";
        self.bookId = @"";
        self.bookName = @"";
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if (self != nil)
    {
        //decode the properties
        self.bookAuthor = [decoder decodeObjectForKey:@"bookAuthor"];
        self.bookCategory = [decoder decodeObjectForKey:@"bookCategory"];
        self.bookClassId = [decoder decodeObjectForKey:@"bookClassId"];
        self.bookDesc = [decoder decodeObjectForKey:@"bookDesc"];
        self.bookId = [decoder decodeObjectForKey:@"bookId"];
        self.bookName = [decoder decodeObjectForKey:@"bookName"];
    }
    return self;
}

#pragma mark Encoding Object

-(void)encodeWithCoder:(NSCoder *)encoder
{
    //Encode the properties of the object
    [encoder encodeObject:self.bookAuthor forKey:@"bookAuthor"];
    [encoder encodeObject:self.bookCategory forKey:@"bookCategory"];
    [encoder encodeObject:self.bookClassId forKey:@"bookClassId"];
    [encoder encodeObject:self.bookDesc forKey:@"bookDesc"];
    [encoder encodeObject:self.bookId forKey:@"bookId"];
    [encoder encodeObject:self.bookName forKey:@"bookName"];
}

@end
