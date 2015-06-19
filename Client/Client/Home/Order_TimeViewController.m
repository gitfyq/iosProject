//
//  Order_TimeViewController.m
//  Client
//
//  Created by smile_faner on 15/6/5.
//  Copyright (c) 2015年 CC. All rights reserved.
//

#import "Order_TimeViewController.h"

@interface Order_TimeViewController ()

@end

@implementation Order_TimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addTitleView:@"选择预约时间"];
    [self addItem:@"" imageName:@"jiantou" actoion:@selector(backClick) position:LEFT_BAR_BUTTON];
    [self loadData];
}
-(void)backClick{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)loadData{
    [dataArray removeAllObjects];
    [SE_Request get_MyDoctorTimetoken:[SGSaveFile getObjectFromSystemWithKey:CLIENT_TOKEN] ids:@"1" finish:^(AFHTTPRequestOperation *operation, id responseObject) {
        [dataArray addObject:dataArray=responseObject[@"data"][@"list"]];
        [dataTableView reloadData];
        
    } error:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}
#pragma mark 行的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"nearCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    UIView *backView=[[UIView alloc] initWithFrame:CGRectMake(9, 9, ScreenWidth-18, 231)];
    backView.backgroundColor=[UIColor colorWithRed:224.0f/255.0f green:226.0f/255.0f blue:228.0f/255.0f alpha:1];
    [cell addSubview:backView];
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(10, 10, ScreenWidth-20, 45)];
    view.backgroundColor=[UIColor colorWithRed:217.0f/255.0f green:241.0f/255.0f blue:255.0f/255.0f alpha:1];
    [cell addSubview:view];
    [Unity imageviewAddsuperview_superView:view _subViewFrame:CGRectMake(10, 16, 6, 13) _imageName:@"left" _backgroundColor:nil];
    [Unity imageviewAddsuperview_superView:view _subViewFrame:CGRectMake(view.frame.size.width-10-6, 16, 6, 13) _imageName:@"right" _backgroundColor:nil];
    UIButton *left=[Unity buttonAddsuperview_superView:view _subViewFrame:CGRectMake(0, 0, 45, 45) _tag:self _action:@selector(leftButtonClick) _string:@"" _imageName:@""];
    left.backgroundColor=[UIColor clearColor];
    UIButton *right=[Unity buttonAddsuperview_superView:view _subViewFrame:CGRectMake(view.frame.size.width-45, 0, 45, 45) _tag:self _action:@selector(rightButtonClick) _string:@"" _imageName:@""];
    right.backgroundColor=[UIColor clearColor];
    [Unity lableViewAddsuperview_superView:view _subViewFrame:CGRectMake(45, 12.5, view.frame.size.width-90, 20) _string:dataArray[0][@"date"] _lableFont:[UIFont systemFontOfSize:16] _lableTxtColor:COLOR_SHENHUI _textAlignment:NSTextAlignmentCenter];
    NSInteger nums;
    if ([dataArray[0][@"times"] count]%3==0) {
        nums=[dataArray[0][@"times"] count]/3+1;
    }else{
        nums=[dataArray[0][@"times"] count]/3+2;
    }
    backView.frame=CGRectMake(9, 9, ScreenWidth-18, nums*46+1);
    for (int i=0; i<[dataArray[0][@"times"] count]; i++) {
        UIButton *button=[Unity buttonAddsuperview_superView:cell _subViewFrame:CGRectMake(view.frame.origin.x+(((ScreenWidth-20-2)/3)+1)*(i%3), view.frame.size.height+view.frame.origin.y+1+46*(i/3), (ScreenWidth-20-2)/3, 45) _tag:self _action:@selector(timeButtonClick:) _string:dataArray[0][@"times"][i][@"start_t"] _imageName:nil];
        if ([dataArray[0][@"times"][i][@"is_empty"] isEqualToString:@"1"]) {
            button.backgroundColor=[UIColor colorWithRed:227.0f/255.0f green:242.0f/255.0f blue:250.0f/255.0f alpha:1];
            button.userInteractionEnabled=YES;
        }else{
            button.backgroundColor=[UIColor clearColor];
            button.userInteractionEnabled=NO;
        }
        button.tag=1100+i;
        [button setTitleColor:COLOR_TIANLAN forState:UIControlStateNormal];
        button.titleLabel.font=[UIFont systemFontOfSize:16];
        
    }
    cell.backgroundColor=[UIColor clearColor];
//    NSArray *nameArr=@[@"附近药店",@"附近病人",@"附近医院"];
//    NSArray *imageArr=@[@"发现_附近药店",@"发现_附近药店",@"发现_附近药店"];
//    cell.textLabel.text = nameArr[indexPath.row];
//    cell.textLabel.font=[UIFont systemFontOfSize:14];
//    cell.textLabel.textColor=COLOR_SHENHUI;
//    cell.imageView.image = [UIImage imageNamed:imageArr[indexPath.section]];
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    //cell.backgroundColor=[UIColor clearColor];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    return cell;
}
-(void)timeButtonClick:(UIButton *)button{
    NSString *st=[NSString stringWithFormat:@"%@ %@",dataArray[0][@"date"],dataArray[0][@"times"][button.tag-1100][@"start_t"]];
    self.timeBlock(st,dataArray[0][@"times"][button.tag-1100][@"id"]);
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)leftButtonClick{
    NSLog(@"左侧时间按钮");
}
-(void)rightButtonClick{
    NSLog(@"右侧时间按钮");
}
#pragma mark 分区数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
#pragma mark 行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (dataArray.count) {
        return 1;
    }else{
        return 0;
    }
}
#pragma mark 行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return ScreenHeight-100;
}
#pragma mark Cell点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
#pragma mark - 标题的高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01f;
}
//-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section{
//    return 0.01f;
//}
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
