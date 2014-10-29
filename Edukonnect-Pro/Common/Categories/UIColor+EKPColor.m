//
//  UIColor+EKPColor.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 10/29/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "UIColor+EKPColor.h"

@implementation UIColor (EKPColor)

+ (UIColor *)loadScreenBackgroundColor
{
    return [UIColor colorWithRed:223.0f/255.0f green:223.0f/255.0f blue:223.0f/255.0f alpha:1.0f];
}

+ (UIColor *)loadComponentNormalColor
{
    return [UIColor colorWithRed:74.0f/255.0f green:162.0f/255.0f blue:218.0f/255.0f alpha:1.0f];
//    return [UIColor colorWithRed:45.0f/255.0f green:125.0f/255.0f blue:176.0f/255.0f alpha:1.0f];
//    return [UIColor colorWithRed:223.0f/255.0f green:223.0f/255.0f blue:223.0f/255.0f alpha:1.0f];
}

+ (UIColor *)loadComponentAlertColor
{
    return [UIColor colorWithRed:135.0f/255.0f green:0.0f/255.0f blue:0.0f/255.0f alpha:1.0f];
}

@end
