//
//  HomeBaseViewController.m
//  Client
//
//  Created by smile_faner on 15/6/4.
//  Copyright (c) 2015年 CC. All rights reserved.
//

#import "HomeBaseViewController.h"

@interface HomeBaseViewController ()

@end

@implementation HomeBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.translucent=NO;
    self.view.backgroundColor = [UIColor colorWithRed:245/255.0f green:245/255.0f blue:245/255.0f alpha:1];
    
    dataArray=[[NSMutableArray alloc] init];
    dataTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-64) style:UITableViewStyleGrouped];
    dataTableView.dataSource=self;
    dataTableView.delegate=self;
    //    dataTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    //
    [self.view addSubview:dataTableView];

}
-(void)addItem:(NSString *)title imageName:(NSString *)imageName actoion:(SEL)action position:(NSInteger)position
{
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    button.titleLabel.font=[UIFont systemFontOfSize:14];
    
    if (position==LEFT_BAR_BUTTON) {
        button.frame=CGRectMake(0,0 ,10 ,15 );
    }else{
        button.frame=CGRectMake(0,5 ,40 ,15 );
    }
    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item=[[UIBarButtonItem alloc] initWithCustomView:button];
    
    if (position==LEFT_BAR_BUTTON) {
        self.navigationItem.leftBarButtonItem=item;
    }
    else{
        self.navigationItem.rightBarButtonItem=item;
    }
}
-(void)addTitleView:(NSString *)title
{
    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(0 ,0 ,120 ,30 )];
    label.backgroundColor=[UIColor clearColor];
    label.textAlignment=NSTextAlignmentCenter;
    label.font=[UIFont systemFontOfSize:17];
    label.textColor=[UIColor whiteColor];
    label.text=title;
    self.navigationItem.titleView=label;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"子类需要重载此方法");
    return 0;
}
-(void)viewDidLayoutSubviews
{
    if ([dataTableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [dataTableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([dataTableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [dataTableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"子类需要重载此方法");
    return nil;
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
