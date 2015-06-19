//
//  AppDelegate.m
//  Client
//
//  Created by apple on 15/6/1.
//  Copyright (c) 2015年 CC. All rights reserved.
//

#import "AppDelegate.h"

#import "RootTabBarViewController.h"

#import "LoginViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    LoginViewController *rvc = [[LoginViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:rvc];
     self.window.rootViewController = nav;
    
    [self setColor];
    //[self createTabbar];
    return YES;
}
//测试用
-(void)createTabbar{
    RootTabBarViewController *rvc=[[RootTabBarViewController alloc] init];
    self.window.rootViewController=rvc;
}
#pragma mark - 设置导航栏的颜色
- (void)setColor
{
    // 设置导航栏颜色
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0/255.0f green:168/255.0f blue:241/255.0f alpha:1.000]];
    
}


+(AppDelegate*)instance//返回系统代理
{
    return (AppDelegate*)[UIApplication sharedApplication].delegate;
}

- (void)waitForTwoSeconds
{
    [NSThread sleepForTimeInterval:1];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
