//
//  ViewController.m
//  Client
//
//  Created by apple on 15/6/1.
//  Copyright (c) 2015年 CC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"首页_bt01"] forBarMetrics:UIBarMetricsDefault];
    
    UIImageView *leftImageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 16, 15)];
    leftImageView.image=[UIImage imageNamed:@""];
    
    UIBarButtonItem *leftImageItem = [[UIBarButtonItem alloc] initWithCustomView:leftImageView];
    
    UIButton *rightButton= [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame=CGRectMake(0, 0, 10, 10);
    [rightButton addTarget:self action:@selector(leftButton:) forControlEvents:UIControlEventTouchUpInside];
    [rightButton setBackgroundImage:[UIImage imageNamed:@"jiantou"] forState:UIControlStateNormal];
    [rightButton setTitle:@"" forState:UIControlStateNormal];
    rightButton.titleLabel.font=[UIFont systemFontOfSize:14];
    rightButton.titleLabel.textAlignment=NSTextAlignmentRight;
    UIBarButtonItem *rightbutItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.leftBarButtonItems=@[rightbutItem,leftImageItem];
    
    
    
}

-(void)leftButton:(UIButton *)btn{
    //     [self.navigationController popToRootViewControllerAnimated:NO];
    [self . navigationController  popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
