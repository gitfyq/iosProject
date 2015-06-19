//
//  Near_PharmacyViewController.m
//  Client
//
//  Created by smile_faner on 15/6/5.
//  Copyright (c) 2015年 CC. All rights reserved.
//

#import "Near_PharmacyViewController.h"
#import "Near_PharmacyTableViewCell.h"
@interface Near_PharmacyViewController ()

@end

@implementation Near_PharmacyViewController
{
    UILabel *mapLabel;
    UILabel *listLable;
    UILabel *wlineLabel;
    UIScrollView *dataScrollView;
    UITableView *mapTableView;
    UITableView *listTableView;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addTitleView:@"附近药店"];
    [self addItem:@"" imageName:@"jiantou" actoion:@selector(backClick) position:LEFT_BAR_BUTTON];
    [self showUI];
    dataScrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 39.5, ScreenWidth, ScreenHeight-64-39.5)];
    dataScrollView.delegate=self;
    dataScrollView.backgroundColor=self.view.backgroundColor;
    // 当值是 YES 会自动滚动到 subview 的边界。默认是NO
    dataScrollView.pagingEnabled = YES;
    //垂直滑动
    dataScrollView.showsVerticalScrollIndicator = NO;
    //水平滑动
    dataScrollView.showsHorizontalScrollIndicator = YES;
    //默认是 yes，就是滚动超过边界会反弹有反弹回来的效果。假如是 NO，那么滚动到达边界会立刻停止。
    dataScrollView.bounces=NO;
    //滚动条颜色
    dataScrollView.indicatorStyle=UIScrollViewIndicatorStyleWhite;
    dataScrollView.contentSize = CGSizeMake(ScreenWidth*2, ScreenHeight-64-39.5-100);
    [self.view addSubview:dataScrollView];
    mapTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, dataScrollView.frame.size.height) style:UITableViewStyleGrouped];
    mapTableView.delegate=self;
    mapTableView.dataSource=self;
    [dataScrollView addSubview:mapTableView];
    listTableView=[[UITableView alloc] initWithFrame:CGRectMake(ScreenWidth, 0, ScreenWidth, dataScrollView.frame.size.height) style:UITableViewStyleGrouped];
    listTableView.delegate=self;
    listTableView.dataSource=self;
    [dataScrollView addSubview:listTableView];
}
#pragma mark 行的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"nearCellIdentifier";
    Near_PharmacyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[Near_PharmacyTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    cell.nameLable.text=@"益丰大药店";
    cell.addressLable.text=@"北京市海淀区中关村大街106号";
    [cell.starView setStarWithFloat:3.5];//数字选择（1-5）
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //cell.backgroundColor=[UIColor clearColor];
    //tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    return cell;
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
    return 96.0f;
}
#pragma mark Cell点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}
#pragma mark - 标题的高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10.0f;
}
-(void)showUI{
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 39.5)];
    view.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:view];
    mapLabel=[Unity lableViewAddsuperview_superView:view _subViewFrame:CGRectMake(0, 0, (ScreenWidth-0.25)/2, 38) _string:@"地图" _lableFont:[UIFont systemFontOfSize:16] _lableTxtColor:COLOR_SUHONG _textAlignment:NSTextAlignmentCenter];
    mapLabel.userInteractionEnabled=YES;
    // 单击的 Recognizer
    UITapGestureRecognizer* mapLabelSingleRecognizer;
    mapLabelSingleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(mapLabelSingleTap)];
    //点击的次数
    mapLabelSingleRecognizer.numberOfTapsRequired = 1; // 单击
    //点击的手指数
    mapLabelSingleRecognizer.numberOfTouchesRequired = 1;
    //给view添加一个手势监测；
    [mapLabel addGestureRecognizer:mapLabelSingleRecognizer];
    
    listLable=[Unity lableViewAddsuperview_superView:view _subViewFrame:CGRectMake((ScreenWidth-0.25)/2+0.25, 0, (ScreenWidth-0.25)/2, 38) _string:@"列表" _lableFont:[UIFont systemFontOfSize:16] _lableTxtColor:COLOR_SHENHUI _textAlignment:NSTextAlignmentCenter];
    listLable.userInteractionEnabled=YES;
    // 单击的 Recognizer
    UITapGestureRecognizer* listLableSingleRecognizer;
    listLableSingleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(listLableSingleTap)];
    //点击的次数
    listLableSingleRecognizer.numberOfTapsRequired = 1; // 单击
    //点击的手指数
    listLableSingleRecognizer.numberOfTouchesRequired = 1;
    //给view添加一个手势监测；
    [listLable addGestureRecognizer:listLableSingleRecognizer];
    UILabel *hlineLable=[[UILabel alloc] initWithFrame:CGRectMake((ScreenWidth-0.5)/2, 9, 0.5, 20)];
    hlineLable.backgroundColor=[UIColor grayColor];
    [view addSubview:hlineLable];
    wlineLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, 38, ScreenWidth/2, 1.5)];
    wlineLabel.backgroundColor=COLOR_SUHONG;
    [view addSubview:wlineLabel];
}
-(void)mapLabelSingleTap{
    [dataScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
}
-(void)listLableSingleTap{
    [dataScrollView setContentOffset:CGPointMake(ScreenWidth, 0) animated:YES];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
{
    //    NSLog(@" scrollViewDidScroll");
    NSLog(@"ContentOffset  x is  %f,yis %f",scrollView.contentOffset.x,scrollView.contentOffset.y);
    wlineLabel.frame=CGRectMake((scrollView.contentOffset.x)/2, 38, ScreenWidth/2, 1.5);
    if (scrollView.contentOffset.x<320) {
        mapLabel.textColor=COLOR_SUHONG;
        listLable.textColor=COLOR_SHENHUI;
    }else{
        mapLabel.textColor=COLOR_SHENHUI;
        listLable.textColor=COLOR_SUHONG;
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
