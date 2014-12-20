//
//  EKPAppDelegate.m
//  Edukonnect-Pro
//
//  Created by Dinesh Panwar on 29/09/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPAppDelegate.h"
#import "EKPUser.h"
#import "EKPStudent.h"
#import "EKPBackgroundFetchAPI.h"
//#import "EKPLoginViewController.h"
//#import "EKPDashboardViewController.h"

@implementation EKPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[UINavigationBar appearance] setTitleTextAttributes: @{
                                                            NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Bold" size:20.0f], NSForegroundColorAttributeName : [UIColor whiteColor]
                                                            }];
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor loadNavigationBarColor]];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTranslucent:YES];
    
    [self.window setBackgroundColor:[UIColor loadScreenBackgroundColor]];

    
    // To navigate direct to Dashboard or Login if needed
    
    UIStoryboard *storyboard = [EKPUtility getStoryboardForCurrentDevice];
    
    EKPUser *currentUser = [EKPSingleton loadUser];
    if (currentUser) { // Already Registered
        
        EKPStudent *currentStudent = [EKPSingleton loadStudent];
        if (currentStudent) { // Already LoggedIn
            [(UINavigationController*)self.window.rootViewController pushViewController:[storyboard instantiateViewControllerWithIdentifier:@"EKPDashboardViewController"] animated:NO];
        } else {
            [(UINavigationController*)self.window.rootViewController pushViewController:[storyboard instantiateViewControllerWithIdentifier:@"EKPLoginViewController"] animated:NO];
        }
    }
    
    [application setMinimumBackgroundFetchInterval:UIApplicationBackgroundFetchIntervalMinimum];
    
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

#pragma mark Background-Fetch Data Methods

-(void)application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
    UIApplication* app = [UIApplication sharedApplication];
    NSArray *oldNotifications = [app scheduledLocalNotifications];
    
    // Clear out the old notification before scheduling a new one.
    if ([oldNotifications count] > 0)
        [app cancelAllLocalNotifications];
    
    NSMutableArray *studentList = [EKPSingleton loadStudentList];
    
    for (EKPStudent *student in studentList) {
        // Create a new notification.
        NSMutableDictionary *responseDictionary = [EKPBackgroundFetchAPI checkForBackgroundUpdatesForSchoolCode:student.studentSchoolCode andStudentId:student.studentId].mutableCopy;
        if (responseDictionary) {
            NSString *currentNotificationId = [responseDictionary objectForKey:NOTIFICATION_API_ID];
            NSString *previousNotificationId = [EKPSingleton loadLastNotificationId];
            
            if (![currentNotificationId isEqualToString:previousNotificationId]) {
                NSDate *now = [NSDate date];
                UILocalNotification *instantAlarm = [[UILocalNotification alloc] init];
                if (instantAlarm)
                {
                    instantAlarm.fireDate = now;
                    instantAlarm.timeZone = [NSTimeZone defaultTimeZone];
                    instantAlarm.repeatInterval = 0;
                    instantAlarm.alertBody = [responseDictionary objectForKey:NOTIFICATION_API_HEADING];
                    [app scheduleLocalNotification:instantAlarm];
                    [EKPSingleton saveLastNotificationId:currentNotificationId];
                }
            }
            completionHandler(UIBackgroundFetchResultNewData);
            
        } else {
            completionHandler(UIBackgroundFetchResultNoData);
        }
    }
    
}

@end
