//
//  AppDelegate.h
//  Client
//
//  Created by apple on 15/6/1.
//  Copyright (c) 2015年 CC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,MBProgressHUDDelegate>

@property (strong, nonatomic) UIWindow *window;



@property (nonatomic, retain) MBProgressHUD *HUD;


+(AppDelegate*)instance;

@end

