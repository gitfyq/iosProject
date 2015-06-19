//
//  RootTabBarViewController.m
//  Medical
//
//  Created by apple on 15/5/12.
//  Copyright (c) 2015年 CC. All rights reserved.
//

#import "RootTabBarViewController.h"
#import "HomeViewController.h"
#import "DoctorViewController.h"
#import "SoSViewController.h"
#import "MessageViewController.h"
#import "MineTableViewController.h"

@interface RootTabBarViewController ()

@end

@implementation RootTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     [self addAllViews];
}


#pragma mark - 添加视图控件
- (void)addAllViews
{
    HomeViewController *home = [[HomeViewController alloc] init];
    DoctorViewController *circle = [[DoctorViewController alloc] init];
    SoSViewController *patlents = [[SoSViewController alloc] init];
    MessageViewController *message = [[MessageViewController alloc] init];
    MineTableViewController *mine = [[MineTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    
    // 主页
    UIImage *myServeImage = [UIImage imageNamed:@"首页_01"];
    UIImage *myServeImageSel = [UIImage imageNamed:@"首页_02"];
    myServeImage = [myServeImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    myServeImageSel = [myServeImageSel imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    home.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:myServeImage selectedImage:myServeImageSel];
    
    
    //医生
    
    UIImage *myHealthyImage = [UIImage imageNamed:@"医生_01"];
    UIImage *myHealthyImageSel = [UIImage imageNamed:@"医生_02"];
    
    myHealthyImage = [myHealthyImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    myHealthyImageSel = [myHealthyImageSel imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    circle.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"医生" image:myHealthyImage selectedImage:myHealthyImageSel];
    
    //Sos
    UIImage *myHowEatImage = [UIImage imageNamed:@"SOS_01"];
    UIImage *myHowEatImageSel = [UIImage imageNamed:@"SOS_02"];
    myHowEatImage = [myHowEatImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    myHowEatImageSel = [myHowEatImageSel imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    patlents.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"SOS" image:myHowEatImage selectedImage:myHowEatImageSel];
    
    // 消息
    UIImage *myEminenceImage = [UIImage imageNamed:@"消息_01"];
    UIImage *myEminenceImageSel = [UIImage imageNamed:@"消息_02"];
    myEminenceImage = [myEminenceImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    myEminenceImageSel = [myEminenceImageSel imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    message.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"消息" image:myEminenceImage selectedImage:myEminenceImageSel];
    
    // 我的
    UIImage *myMineImage = [UIImage imageNamed:@"我的_01"];
    UIImage *myMineImageSel = [UIImage imageNamed:@"我的_2"];
    myMineImage = [myMineImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    myMineImageSel = [myMineImageSel imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    mine.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:myMineImage selectedImage:myMineImageSel];
    
    
    UINavigationController *serveNC = [[UINavigationController alloc] initWithRootViewController:home];
    UINavigationController *healthyNC = [[UINavigationController alloc] initWithRootViewController:circle];
    UINavigationController *howEatNC = [[UINavigationController alloc] initWithRootViewController:patlents];
    UINavigationController *eminenceNC = [[UINavigationController alloc] initWithRootViewController:message];
    UINavigationController *mineNC = [[UINavigationController alloc] initWithRootViewController:mine];
    
    
    self.viewControllers = @[serveNC, healthyNC, howEatNC, eminenceNC, mineNC];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
