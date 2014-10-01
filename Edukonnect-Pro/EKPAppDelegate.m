//
//  EKPAppDelegate.m
//  Edukonnect-Pro
//
//  Created by Dinesh Panwar on 29/09/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPAppDelegate.h"

@implementation EKPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    /*********** Change Font for screen title ***********/
//    NSArray *vComp = [[UIDevice currentDevice].systemVersion componentsSeparatedByString:@"."];
    
//    if ([[vComp objectAtIndex:0] intValue] >= 7) { // In case of iOS7 and above
        [[UINavigationBar appearance] setTitleTextAttributes: @{
                                                                NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Bold" size:20.0f]
                                                                }];
//    } else if ([[vComp objectAtIndex:0] intValue] <= 6) { // In case of iOS6 and above
//        [[UINavigationBar appearance] setTitleTextAttributes: @{
//                                                                UITextAttributeFont: [UIFont fontWithName:@"Helvetica-Bold" size:20.0f]
//                                                                }];
//    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end