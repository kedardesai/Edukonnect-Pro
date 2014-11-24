//
//  UIColor+EKPColor.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 10/29/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (EKPColor)

+ (UIColor *)loadScreenBackgroundColor;

+ (UIColor *)loadNavigationBarColor;

+ (UIColor *)loadComponentNormalColor;

+ (UIColor *)loadComponentAlertColor;

+ (UIColor *)loadComponentNormalBackgroundColor;

+ (UIColor *)loadComponentErrorBackgroundColor;

@end
