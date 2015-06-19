//
//  Measure_HistoryListViewController.m
//  Client
//
//  Created by smile_faner on 15/6/12.
//  Copyright (c) 2015年 CC. All rights reserved.
//

#import "Measure_HistoryListViewController.h"
#import "Measure_HistoryThreeCell.h"
#import "Measure_HistoryTwoCell.h"
#import "Measure_HistoryFourCell.h"
@interface Measure_HistoryListViewController ()

@end

@implementation Measure_HistoryListViewController
{
    NSArray *titleArr;
    UIView *backHeadView;
    UIView *whiteHeadView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addTitleView:self.titleString];
    [self addItem:@"" imageName:@"jiantou" actoion:@selector(backClick) position:LEFT_BAR_BUTTON];
    titleArr=@[@"心情",@"体重",@"睡眠",@"运动",@"血糖",@"血压",@"血脂"];
    backHeadView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 55)];
    backHeadView.backgroundColor=dataTableView.backgroundColor;
    [self.view addSubview:backHeadView];
    whiteHeadView=[[UIView alloc] initWithFrame:CGRectMake(0, 10, ScreenWidth, 45)];
    whiteHeadView.backgroundColor=[UIColor whiteColor];
    UILabel *lineLable=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 1)];
    lineLable.backgroundColor=[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1];
    lineLable.alpha=0.8;
    [whiteHeadView addSubview:lineLable];
    [backHeadView addSubview:whiteHeadView];
    if (self.titleString==titleArr[0]) {
        [self createMoodHeadView];
    }else if(self.titleString==titleArr[1]){
        [self createWeightHeadView];
    }else if(self.titleString==titleArr[2]){
        [self createSleepHeadView];
    }else if(self.titleString==titleArr[3]){
        [self createSportHeadView];
    }else if(self.titleString==titleArr[4]){
        [self createBloodSugarHeadView];
    }else if(self.titleString==titleArr[5]){
        [self createBloodPressureHeadView];
    }else if(self.titleString==titleArr[6]){
        [self createLipidHeadView];
    }
    dataTableView.frame=CGRectMake(0, 55, ScreenWidth, ScreenHeight);
}
#pragma mark 行的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *dateArr=@[@"2015-05-05",@"2015-05-06",@"2015-05-07"];
    NSString *cellIdentifier = @"historyCellIdentifier";
    
    if (self.titleString==titleArr[0]) {
        Measure_HistoryTwoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        if (!cell) {
            cell = [[Measure_HistoryTwoCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        }
        cell.dateLable.text=dateArr[indexPath.row];
        cell.lable1.text=@"高兴";
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;

    }else if(self.titleString==titleArr[1]){
        Measure_HistoryTwoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        if (!cell) {
            cell = [[Measure_HistoryTwoCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        }
        cell.dateLable.text=dateArr[indexPath.row];
        cell.lable1.text=@"60kg";
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;

    }else if(self.titleString==titleArr[2]){
        Measure_HistoryTwoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        if (!cell) {
            cell = [[Measure_HistoryTwoCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        }
        cell.dateLable.text=dateArr[indexPath.row];
        cell.lable1.text=@"7-8";
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;

    }else if(self.titleString==titleArr[3]){
        Measure_HistoryThreeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        if (!cell) {
            cell = [[Measure_HistoryThreeCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        }
        cell.dateLable.text=dateArr[indexPath.row];
        cell.lable1.text=@"跑步";
        cell.lable2.text=@"1小时";
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;

    }else if(self.titleString==titleArr[4]){
        Measure_HistoryFourCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        if (!cell) {
            cell = [[Measure_HistoryFourCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        }
        cell.dateLable.text=dateArr[indexPath.row];
        cell.lable1.text=@"4.8";
        cell.lable2.text=@"4.8";
        cell.lable3.text=@"4.8";
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if(self.titleString==titleArr[5]){
        Measure_HistoryTwoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        if (!cell) {
            cell = [[Measure_HistoryTwoCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        }
        cell.dateLable.text=dateArr[indexPath.row];
        cell.lable1.text=@"高兴";
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;

    }else{
        Measure_HistoryTwoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        if (!cell) {
            cell = [[Measure_HistoryTwoCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        }
        cell.dateLable.text=dateArr[indexPath.row];
        cell.lable1.text=@"高兴";
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
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
    return 40.0f;
}
#pragma mark Cell点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}
#pragma mark - 标题的高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01f;
}
-(void)createMoodHeadView{
    NSArray *arr=@[@"日期",@"心情"];
    for (int i=0; i<arr.count; i++) {
        [Unity lableViewAddsuperview_superView:whiteHeadView _subViewFrame:CGRectMake(0+ScreenWidth/2*i, 10, ScreenWidth/2, 25) _string:arr[i] _lableFont:[UIFont systemFontOfSize:16] _lableTxtColor:[UIColor grayColor] _textAlignment:NSTextAlignmentCenter];
    }
}
-(void)createWeightHeadView{
    NSArray *arr=@[@"日期",@"体重"];
    for (int i=0; i<arr.count; i++) {
        [Unity lableViewAddsuperview_superView:whiteHeadView _subViewFrame:CGRectMake(0+ScreenWidth/2*i, 10, ScreenWidth/2, 25) _string:arr[i] _lableFont:[UIFont systemFontOfSize:16] _lableTxtColor:[UIColor grayColor]  _textAlignment:NSTextAlignmentCenter];
    }
}
-(void)createSleepHeadView{
    NSArray *arr=@[@"日期",@"睡眠时长"];
    for (int i=0; i<arr.count; i++) {
        [Unity lableViewAddsuperview_superView:whiteHeadView _subViewFrame:CGRectMake(0+ScreenWidth/2*i, 10, ScreenWidth/2, 25) _string:arr[i] _lableFont:[UIFont systemFontOfSize:16] _lableTxtColor:[UIColor grayColor] _textAlignment:NSTextAlignmentCenter];
    }
}
-(void)createSportHeadView{
    NSArray *arr=@[@"日期",@"类型",@"时长"];
    for (int i=0; i<arr.count; i++) {
        [Unity lableViewAddsuperview_superView:whiteHeadView _subViewFrame:CGRectMake(0+ScreenWidth/3*i, 10, ScreenWidth/3, 25) _string:arr[i] _lableFont:[UIFont systemFontOfSize:16] _lableTxtColor:[UIColor grayColor] _textAlignment:NSTextAlignmentCenter];
    }
}
-(void)createBloodSugarHeadView{
    NSArray *arr=@[@"日期",@"早餐",@"午餐",@"晚餐"];
    for (int i=0; i<arr.count; i++) {
        if (i==0) {
            [Unity lableViewAddsuperview_superView:whiteHeadView _subViewFrame:CGRectMake(0, 10, ScreenWidth/3, 25) _string:arr[i] _lableFont:[UIFont systemFontOfSize:16] _lableTxtColor:[UIColor grayColor] _textAlignment:NSTextAlignmentCenter];
        }else{
            [Unity lableViewAddsuperview_superView:whiteHeadView _subViewFrame:CGRectMake(ScreenWidth/3+ScreenWidth/3*2/3*(i-1), 10, ScreenWidth/3*2/3, 25) _string:arr[i] _lableFont:[UIFont systemFontOfSize:16] _lableTxtColor:[UIColor grayColor] _textAlignment:NSTextAlignmentCenter];
        }
    }
}
-(void)createBloodPressureHeadView{
    NSArray *arr=@[@"日期",@"血压"];
    for (int i=0; i<arr.count; i++) {
        [Unity lableViewAddsuperview_superView:whiteHeadView _subViewFrame:CGRectMake(0+ScreenWidth/2*i, 10, ScreenWidth/2, 25) _string:arr[i] _lableFont:[UIFont systemFontOfSize:16] _lableTxtColor:[UIColor grayColor] _textAlignment:NSTextAlignmentCenter];
    }
}
-(void)createLipidHeadView{
    NSArray *arr=@[@"日期",@"血脂"];
    for (int i=0; i<arr.count; i++) {
        [Unity lableViewAddsuperview_superView:whiteHeadView _subViewFrame:CGRectMake(0+ScreenWidth/2*i, 10, ScreenWidth/2, 25) _string:arr[i] _lableFont:[UIFont systemFontOfSize:16] _lableTxtColor:[UIColor grayColor] _textAlignment:NSTextAlignmentCenter];
    }
}
-(void)backClick{
    [self.navigationController popViewControllerAnimated:YES];
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
