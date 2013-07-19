//
//  ETAppDelegate.m
//  CrashReportAssert
//
//  Created by Esteban Torres on 6/5/13.
//  Copyright (c) 2013 estebantorres. All rights reserved.
//

#import "ETAppDelegate.h"

#ifdef USE_LUMBERJACK
#import "DDFileLogger.h"
#endif

@implementation ETAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    // If we want to use Lumberjack for logging we set up and configure it
#ifdef USE_LUMBERJACK
    DDFileLogger *fileLogger = [[DDFileLogger alloc] init];
    [DDLog addLogger:[DDASLLogger sharedInstance]];
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    [DDLog addLogger:fileLogger]; // This will output the assertion to "iPhone Simulator/<Version>/<AppID>/Library/Caches/Logs/log-<####>.txt"
#endif
    
    // We are surrounding this in a try/catch block because we set the macro kSHOULD_THROW_EXCEPTION to 1
    @try {
        // Obviously this is going to cause a failure and we are going to get the failure.
        ETAssert(1==3, @"Don't know why 1 is different than 3!!");
    }
    @catch (NSException *exception) {
#ifdef USE_LUMBERJACK
        DDLogError(@"User Info: %@", exception.userInfo);
#else
        NSlog(@"User Info: %@", exception.userInfo);
#endif
    }
    abort(); // We abort here because the app doesn't need to run. This is as far as the example goes.
    
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
