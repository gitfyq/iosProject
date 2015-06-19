//
//  JZ_Animations.m
//  AssistiveTouchSY_LW
//
//  Created by wei on 14-9-9.
//  Copyright (c) 2014年 wei. All rights reserved.
//

#import "JZ_Animations.h"
#import "AppDelegate.h"


@interface JZ_Animations()

@property (nonatomic,retain)UIImageView * imageView;
@property (nonatomic,retain) UILabel * lab ;
@property (nonatomic,retain) UIView * superView;

@end


static JZ_Animations *sharedObj = nil; //第一步：静态实例，并初始化。

@implementation JZ_Animations

+ (JZ_Animations*) sharedInstance  //第二步：实例构造检查静态实例是否为nil
{
    @synchronized (self)
    {
        if (sharedObj == nil)
        {
            sharedObj = [[super allocWithZone:nil]init];
        }
    }
    return sharedObj;
}

+(id)allocWithZone:(NSZone *)zone //三步
{
    return [JZ_Animations sharedInstance];
}

-(id)copyWithZone:(NSZone *)zone //第四步
{
    return self;
}
/*
- (id) retain
{
    return self;
}

- (NSUInteger)retainCount
{
    return NSUIntegerMax;
}

- (oneway void) release
{
    
}

- (id) autorelease
{
    return self;
}
 */

- (id)init
{
    if (sharedObj) {
        return sharedObj;
    }
    self = [super init];//往往放一些要初始化的变量.
   
    self.lab.textAlignment = NSTextAlignmentCenter;
    self.lab.backgroundColor = [UIColor clearColor];
    [self addSubview:self.imageView];
    [self addSubview:self.lab];
    [self beginAnimations:self.superView];
    return self;
    
}

-(void)beginAnimations:(UIView *)superview
{
    NSMutableArray * arr1 = [[NSMutableArray alloc] initWithCapacity:1];
    for (int i = 1; i < 6; i++) {
        [arr1 addObject:[NSString stringWithFormat:@"view_loading_%d.png",i]];
    }
    NSMutableArray * arr = [[NSMutableArray alloc] initWithCapacity:1];
    for (int i = 0; i < 5; i++) {
        UIImage * image = [UIImage imageNamed:[arr1 objectAtIndex:i]];
        [arr addObject:image];
    }
    self.imageView.image = [UIImage imageNamed:@"icon01.png"];
    self.imageView.animationImages = arr; //animationImages属性返回一个存放动画图片的数组
    self.imageView.animationDuration = 2.0; //浏览整个图片一次所用的时间
    self.imageView.animationRepeatCount = 0; // 0 = loops forever 动画重复次数
    [self.imageView startAnimating];
    
    
//    self.lab.textAlignment = NSTextAlignmentCenter;
    
//    [superview addSubview:self];
}

+(JZ_Animations *)createAJZ_Animation:(UIView *)superView
{
    if (!sharedObj) {
//        sharedObj.superView = superView;
        sharedObj = [[JZ_Animations alloc] init];
    }
    sharedObj.lab.text = @"加载中";
    [superView addSubview:sharedObj];
    [sharedObj.imageView startAnimating];
    sharedObj.hidden = NO;
    return sharedObj;
}

+(void)AnimationISHun
{
    [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(remove) userInfo:nil repeats:NO];
    return;
}

+(void)remove
{
    sharedObj.hidden = YES;
    [sharedObj.imageView stopAnimating];
    [sharedObj removeFromSuperview];
    return;
}

+(void)LoadingFailure
{
    [sharedObj.imageView stopAnimating];
    sharedObj.lab.text = @"加载失败";
//    [NSTimer scheduledTimerWithTimeInterval:3.0f target:self selector:@selector(AnimationISHun) userInfo:nil repeats:NO];
    return;
}

@end
