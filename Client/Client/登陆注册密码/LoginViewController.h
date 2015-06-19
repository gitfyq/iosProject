//
//  LoginViewController.h
//  fetusMother
//
//  Created by 宫志超 on 15/4/8.
//  Copyright (c) 2015年 张平辉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController



@property(nonatomic,copy)NSString *statusStr;
@property(nonatomic,copy)NSString *info;


@property (nonatomic, copy) void (^backidNameValue)(NSString *name);


@end
