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

+ (UIColor *)loadNavigationBarColor
{
    return [UIColor colorWithRed:0.0f/255.0f green:62.0f/255.0f blue:96.0f/255.0f alpha:1.0f];
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

+ (UIColor *)loadComponentNormalBackgroundColor
{
    return [UIColor whiteColor];
}

+ (UIColor *)loadComponentErrorBackgroundColor
{
    return [UIColor colorWithRed:255.0f/255.0f green:255.0f/250.0f blue:224.0f/255.0f alpha:1.0f];
}

+ (UIColor *)loadDarkGrayBorderColor
{
    return [UIColor colorWithRed:70.0f/255.0f green:70.0f/255.0f blue:70.0f/255.0f alpha:1.0f];
}

@end
