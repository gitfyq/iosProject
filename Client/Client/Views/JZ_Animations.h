//
//  JZ_Animations.h
//  AssistiveTouchSY_LW
//
//  Created by wei on 14-9-9.
//  Copyright (c) 2014年 wei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZ_Animations : UIView
//出现动画
+(JZ_Animations *)createAJZ_Animation:(UIView *)superView;
//隐藏动画
+(void)AnimationISHun;

+(void)LoadingFailure;

@end
