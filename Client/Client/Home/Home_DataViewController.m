//
//  Home_DataViewController.m
//  Client
//
//  Created by smile_faner on 15/6/4.
//  Copyright (c) 2015年 CC. All rights reserved.
//

#import "Home_DataViewController.h"

@interface Home_DataViewController ()

@end

@implementation Home_DataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addTitleView:self.titleString];
    [self addItem:@"" imageName:@"jiantou" actoion:@selector(backClick) position:LEFT_BAR_BUTTON];
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"历史资料" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    button.titleLabel.font=[UIFont systemFontOfSize:13];
    button.titleLabel.numberOfLines=0;
    button.frame=CGRectMake(0,0 ,60 ,15 );
    [button addTarget:self action:@selector(rightButtonClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item=[[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem=item;


}
-(void)rightButtonClick{
    NSLog(@"右侧按钮点击");
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
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    
    [Unity lableViewAddsuperview_superView:cell _subViewFrame:CGRectMake(15, 15, ScreenWidth-30, 20) _string:@"请上传病例/检查单/图片" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:COLOR_SHENHUI _textAlignment:NSTextAlignmentLeft];
    UIButton *button= [Unity buttonAddsuperview_superView:cell _subViewFrame:CGRectMake(15, 45, 65, 65) _tag:self _action:@selector(buttonClick) _string:@"添加" _imageName:@""];
    button.backgroundColor=[UIColor grayColor];
    UITextView *textView=[[UITextView alloc] initWithFrame:CGRectMake(15, button.frame.size.height+button.frame.origin.y+10, ScreenWidth-15*2, 160)];
    textView.delegate=self;
    textView.text=@"添加备注信息...";
    [cell addSubview:textView];
    textView.font=[UIFont systemFontOfSize:14];
    textView.backgroundColor=[UIColor grayColor];
    [Unity setControls:textView Radius:4];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}
-(void)buttonClick{
    
}
- (void)textViewDidBeginEditing:(UITextView *)textView{
    textView.text=@"";
}
#pragma mark 分区数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
#pragma mark 行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
#pragma mark 行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 300.0f;
}
#pragma mark Cell点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
#pragma mark - 标题的高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 9.0f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return ScreenHeight-64-10-10-90-300;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view=[[UIView alloc] init];
    view.backgroundColor=[UIColor clearColor];
    UIButton *button=[Unity buttonAddsuperview_superView:view _subViewFrame:CGRectMake(15, 20, ScreenWidth-30, 40) _tag:self _action:@selector(submitButtonClick) _string:@"提交" _imageName:nil];
    button.backgroundColor=COLOR_TIANLAN;
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font=[UIFont systemFontOfSize:16];
    [Unity setControls:button Radius:4];
    return view;
}
-(void)submitButtonClick{
    
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
