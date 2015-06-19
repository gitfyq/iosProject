//
//  Order_TimeViewController.h
//  Client
//
//  Created by smile_faner on 15/6/5.
//  Copyright (c) 2015年 CC. All rights reserved.
//

#import "HomeBaseViewController.h"

@interface Order_TimeViewController : HomeBaseViewController
@property(nonatomic,copy) void(^timeBlock)(NSString *timeString,NSString *timeIds);
@end
