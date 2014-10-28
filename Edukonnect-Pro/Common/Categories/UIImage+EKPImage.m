//
//  UIImage+EKPImage.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 10/29/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "UIImage+EKPImage.h"
#import "EKPEnums.h"
#import "EKPSingleton.h"

@implementation UIImage (EKPImage)

+ (UIImage *)loadScreenBackgroundImage
{
    kEKPTheme theme = [EKPSingleton loadEKPTheme];
    UIImage *image = [[UIImage alloc] init];
    switch (theme) {
        case kEKPThemeRed:
            image = [UIImage imageNamed:@"BackgroundImage-Red"];
            break;
            
        case kEKPThemeGreen:
            image = [UIImage imageNamed:@"BackgroundImage-Green"];
            break;
            
        case kEKPThemeBlue:
            image = [UIImage imageNamed:@"BackgroundImage-Blue"];
            break;
            
        default:
            image = [UIImage imageNamed:@"BackgroundImage-Blue"];
            break;
    }
    
    return image;
}

+ (UIImage *)loadBackButtonImage
{
    kEKPTheme theme = [EKPSingleton loadEKPTheme];
    switch (theme) {
        case kEKPThemeRed:
            return [UIImage imageNamed:@"BackButton-Red"];
            break;
            
        case kEKPThemeGreen:
            return [UIImage imageNamed:@"BackButton-Green"];
            break;
            
        case kEKPThemeBlue:
            return [UIImage imageNamed:@"BackButton-Blue"];
            break;
            
        default:
            return [UIImage imageNamed:@"BackButton-Blue"];
            break;
    }
}

+ (UIImage *)loadNavigationBarImage
{
    kEKPTheme theme = [EKPSingleton loadEKPTheme];
    switch (theme) {
        case kEKPThemeRed:
            return [UIImage imageNamed:@"NavigationBar-Red"];
            break;
            
        case kEKPThemeGreen:
            return [UIImage imageNamed:@"NavigationBar-Green"];
            break;
            
        case kEKPThemeBlue:
            return [UIImage imageNamed:@"NavigationBar-Blue"];
            break;
            
        default:
            return [UIImage imageNamed:@"NavigationBar-Blue"];
            break;
    }
}

+ (UIImage *)loadSettingsImage
{
    kEKPTheme theme = [EKPSingleton loadEKPTheme];
    switch (theme) {
        case kEKPThemeRed:
            return [UIImage imageNamed:@"Settings-Red"];
            break;
            
        case kEKPThemeGreen:
            return [UIImage imageNamed:@"Settings-Green"];
            break;
            
        case kEKPThemeBlue:
            return [UIImage imageNamed:@"Settings-Blue"];
            break;
            
        default:
            return [UIImage imageNamed:@"Settings-Blue"];
            break;
    }
}

+ (UIImage *)loadUserIconImage
{
    kEKPTheme theme = [EKPSingleton loadEKPTheme];
    switch (theme) {
        case kEKPThemeRed:
            return [UIImage imageNamed:@"UserIcon-Red"];
            break;
            
        case kEKPThemeGreen:
            return [UIImage imageNamed:@"UserIcon-Green"];
            break;
            
        case kEKPThemeBlue:
            return [UIImage imageNamed:@"UserIcon-Blue"];
            break;
            
        default:
            return [UIImage imageNamed:@"UserIcon-Blue"];
            break;
    }
}

+ (UIImage *)loadEmailIconImage
{
    kEKPTheme theme = [EKPSingleton loadEKPTheme];
    switch (theme) {
        case kEKPThemeRed:
            return [UIImage imageNamed:@"EmailIcon-Red"];
            break;
            
        case kEKPThemeGreen:
            return [UIImage imageNamed:@"EmailIcon-Green"];
            break;
            
        case kEKPThemeBlue:
            return [UIImage imageNamed:@"EmailIcon-Blue"];
            break;
            
        default:
            return [UIImage imageNamed:@"EmailIcon-Blue"];
            break;
    }
}

+ (UIImage *)loadMobileIconImage
{
    kEKPTheme theme = [EKPSingleton loadEKPTheme];
    switch (theme) {
        case kEKPThemeRed:
            return [UIImage imageNamed:@"MobileIcon-Red"];
            break;
            
        case kEKPThemeGreen:
            return [UIImage imageNamed:@"MobileIcon-Green"];
            break;
            
        case kEKPThemeBlue:
            return [UIImage imageNamed:@"MobileIcon-Blue"];
            break;
            
        default:
            return [UIImage imageNamed:@"MobileIcon-Blue"];
            break;
    }
}

+ (UIImage *)loadPasswordIconImage
{
    kEKPTheme theme = [EKPSingleton loadEKPTheme];
    switch (theme) {
        case kEKPThemeRed:
            return [UIImage imageNamed:@"PasswordIcon-Red"];
            break;
            
        case kEKPThemeGreen:
            return [UIImage imageNamed:@"PasswordIcon-Green"];
            break;
            
        case kEKPThemeBlue:
            return [UIImage imageNamed:@"PasswordIcon-Blue"];
            break;
            
        default:
            return [UIImage imageNamed:@"PasswordIcon-Blue"];
            break;
    }
}

@end
