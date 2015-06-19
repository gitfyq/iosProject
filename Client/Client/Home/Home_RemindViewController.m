//
//  Home_RemindViewController.m
//  Client
//
//  Created by smile_faner on 15/6/4.
//  Copyright (c) 2015年 CC. All rights reserved.
//

#import "Home_RemindViewController.h"

@interface Home_RemindViewController ()

@end

@implementation Home_RemindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addTitleView:self.titleString];
    [self addItem:@"" imageName:@"jiantou" actoion:@selector(backClick) position:LEFT_BAR_BUTTON];
}
-(void)backClick{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark 行的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"remindCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    NSArray *nameArr=@[@"用药提醒",@"测量提醒",@"系统消息推送"];
    cell.textLabel.text = nameArr[indexPath.row];
    cell.textLabel.font=[UIFont systemFontOfSize:14];
    cell.textLabel.textColor=COLOR_SHENHUI;
    if (indexPath.row==2) {
        UISwitch *switchView = [[UISwitch alloc] initWithFrame:CGRectMake(ScreenWidth-15-51, 6, 51, 31.0f)];
        NSLog(@"%f-%f",switchView.frame.size.height,switchView.frame.size.width);
        //设置UISwitch的初始化状态
        switchView.on = YES;//设置初始为ON的一边
        switchView.onTintColor=COLOR_TIANLAN;
        //UISwitch事件的响应
        [switchView addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
        [cell addSubview:switchView];
    }else{
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}
-(void)switchAction:(UISwitch *)UISwitch{
    NSLog(@"开关状态%i",UISwitch.on);
}
#pragma mark 分区数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
#pragma mark 行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
#pragma mark 行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45.0f;
}
#pragma mark Cell点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
#pragma mark - 标题的高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10.0f;
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
