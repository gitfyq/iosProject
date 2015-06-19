//
//  Home_OrderViewController.m
//  Client
//
//  Created by smile_faner on 15/6/4.
//  Copyright (c) 2015年 CC. All rights reserved.
//

#import "Home_OrderViewController.h"
#import "Order_TimeViewController.h"
#import "DoctorViewController.h"
@interface Home_OrderViewController ()

@end

@implementation Home_OrderViewController
{
    NSString *timeString;
    NSString *timeId;
    UITextView *textView;
}
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
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            cell.textLabel.text=@"朱小亮医生";
            cell.textLabel.textColor=COLOR_TIANLAN;
            cell.textLabel.font=[UIFont systemFontOfSize:14];
            //cell.detailTextLabel.text=@"咨询价:60元";
            UILabel *label=[Unity lableViewAddsuperview_superView:cell _subViewFrame:CGRectMake(0, 0, 0, 0) _string:@"咨询价:60元" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor colorWithRed:249/255.0f green:144/255.0f blue:161/255.0f alpha:1] _textAlignment:NSTextAlignmentRight];
            CGFloat f=[Unity getLabelWidthWithLabel:label Text:@"咨询价:60元" andFont:[UIFont systemFontOfSize:14]];
            label.frame=CGRectMake(ScreenWidth-15-f, 12.5, f, 20);
//            cell.detailTextLabel.font=[UIFont systemFontOfSize:14];
//            cell.detailTextLabel.textColor=[UIColor colorWithRed:249/255.0f green:144/255.0f blue:161/255.0f alpha:1];
//            NSLog(@"%f---%f",cell.detailTextLabel.frame.origin.x,cell.detailTextLabel.frame.origin.y);
            [Unity imageviewAddsuperview_superView:cell _subViewFrame:CGRectMake(label.frame.origin.x-20, label.frame.origin.y, 17, 17) _imageName:@"2医生_预约_咨询价" _backgroundColor:nil];
        }else{
            cell.textLabel.text=@"预约时间";
            cell.textLabel.textColor=COLOR_SHENHUI;
            cell.textLabel.font=[UIFont systemFontOfSize:14];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.detailTextLabel.text=timeString;
            cell.detailTextLabel.font=[UIFont systemFontOfSize:14];
        }
        
    }else{
        [Unity lableViewAddsuperview_superView:cell _subViewFrame:CGRectMake(15, 10, 100, 20) _string:@"问题描述" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:COLOR_SHENHUI _textAlignment:NSTextAlignmentLeft];
        textView=[[UITextView alloc] initWithFrame:CGRectMake(15, 40, ScreenWidth-15*2, 150)];
        textView.delegate=self;
        textView.text=@"请描述你的问题,包括身体状况,疾病和状况...";
        [cell addSubview:textView];
        textView.font=[UIFont systemFontOfSize:14];
        textView.backgroundColor=[UIColor grayColor];
        [Unity setControls:textView Radius:4];
       UIButton *button= [Unity buttonAddsuperview_superView:cell _subViewFrame:CGRectMake(15, textView.frame.size.height+textView.frame.origin.y+10, 65, 65) _tag:self _action:@selector(buttonClick) _string:@"添加" _imageName:@""];
        button.backgroundColor=[UIColor grayColor];
        [Unity lableViewAddsuperview_superView:cell _subViewFrame:CGRectMake(15, button.frame.origin.y+button.frame.size.height+8, ScreenWidth-30, 20) _string:@"提示:上传病例/检查单/图片" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor grayColor] _textAlignment:NSTextAlignmentLeft];
        
        
    }
//    NSArray *nameArr=@[@"用药提醒",@"测量提醒",@"系统消息推送"];
//    cell.textLabel.text = nameArr[indexPath.row];
//    cell.textLabel.font=[UIFont systemFontOfSize:14];
//    cell.textLabel.textColor=COLOR_SHENHUI;
//    
//  
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
    return 2;
}
#pragma mark 行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 2;
    }else{
        return 1;
    }
}
#pragma mark 行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return 45.0f;
    }else{
        return 300.0f;
    }
}
#pragma mark Cell点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            DoctorViewController *dvc = [[DoctorViewController alloc] init];
            [self.navigationController pushViewController:dvc animated:YES];
            
            }else if (indexPath.row == 1){
                        Order_TimeViewController *tvc=[[Order_TimeViewController alloc] init];
                        tvc.timeBlock=^(NSString *timeStr,NSString *timeIdStr){
                            timeString=timeStr;
                            timeId=timeIdStr;
                            [dataTableView reloadData];
                        };
                        [self.navigationController pushViewController:tvc animated:YES];

        }
    }
    
}
#pragma mark - 标题的高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 10.0f;
    }else{
        return 9.0f;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section==0) {
        return 1.0f;
    }else{
        return ScreenHeight-64-10-10-90-300;
    }
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section==1) {
        UIView *view=[[UIView alloc] init];
        view.backgroundColor=[UIColor clearColor];
        UIButton *button=[Unity buttonAddsuperview_superView:view _subViewFrame:CGRectMake(15, 20, ScreenWidth-30, 40) _tag:self _action:@selector(submitButtonClick) _string:@"提交预约" _imageName:nil];
        button.backgroundColor=[UIColor colorWithRed:248.0f/255.0f green:95.0f/255.0f blue:82.0f/255.0f alpha:1];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.titleLabel.font=[UIFont systemFontOfSize:16];
        [Unity setControls:button Radius:4];
        return view;
    }else{
        return nil;
    }
}
-(void)submitButtonClick{
    if (timeId.length==0) {
        [Unity showErrorAlert:self.view message:@"请选择预约时间"];
    }else{
        [SE_Request add_OrderMlotoken:[SGSaveFile getObjectFromSystemWithKey:CLIENT_TOKEN] oid:timeId memo:textView.text finish:^(AFHTTPRequestOperation *operation, id responseObject) {
            [Unity showErrorAlert:self.view message:responseObject[@"info"]];
        } error:^(AFHTTPRequestOperation *operation, NSError *error) {
            
        }];
    }
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
