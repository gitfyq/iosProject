//
//  HomeViewController.m
//  Client
//
//  Created by apple on 15/6/1.
//  Copyright (c) 2015年 CC. All rights reserved.
//
#define iPhone5ScreenWidth 320
#define iPhone6ScreenWidth 375
#define iPhone6PScreenWidth 414
#import "HomeViewController.h"
#import "Home_DataViewController.h"
#import "Home_MeasureViewController.h"
#import "Home_MedicineViewController.h"
#import "Home_NearViewController.h"
#import "Home_RemindViewController.h"
#import "Home_OrderViewController.h"
#import "HomeTableViewCell.h"
@interface HomeViewController ()

@end

@implementation HomeViewController
{
    NSArray *nameArr;
    UITableView *homeTableView;
    UIView *homeHeadView;
    CGFloat HeadViewFloat;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"首页";
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor colorWithRed:245/255.0f green:245/255.0f blue:245/255.0f alpha:1   ];
    if (ScreenWidth==iPhone5ScreenWidth) {
        HeadViewFloat=235.0f;
    }else if(ScreenWidth==iPhone6ScreenWidth){
        HeadViewFloat=275.0f;
    }else if(ScreenWidth==iPhone6PScreenWidth){
        HeadViewFloat=305.0f;
    }
    homeTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, HeadViewFloat+1, ScreenWidth, ScreenHeight-64-HeadViewFloat+1) style:UITableViewStyleGrouped];
    homeTableView.delegate=self;
    homeTableView.dataSource=self;
    [self.view addSubview:homeTableView];
    
    homeHeadView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, HeadViewFloat+1)];
    homeHeadView.backgroundColor=[UIColor colorWithRed:225/255.0f green:225/255.0f  blue:225/255.0f  alpha:1];
    [Unity imageviewAddsuperview_superView:homeHeadView _subViewFrame:CGRectMake(0, 0, ScreenWidth, HeadViewFloat+1) _imageName:@"bg01" _backgroundColor:nil];
    [self.view addSubview:homeHeadView];
    CGFloat imageViewWidth=(ScreenWidth-2)/3;
    CGFloat imageViewHeight=(HeadViewFloat-1)/2;
    nameArr=@[@"预约医生",@"测量输入",@"附近",@"资料上传",@"服药记录",@"提醒"];
    NSArray *imageArr=@[@"预约医生1",@"测量",@"附近",@"上传资料1",@"服药记录",@"提醒1"];
    for (int i=0; i<nameArr.count; i++) {
        UIImageView *imageView=[Unity imageviewAddsuperview_superView:homeHeadView _subViewFrame:CGRectMake(0+(imageViewWidth+1)*(i%3), 0+(imageViewHeight+1)*(i/3), imageViewWidth, imageViewHeight) _imageName:@"" _backgroundColor:[UIColor clearColor]];
        imageView.tag=1000+i;
        imageView.userInteractionEnabled=YES;
        // 单击的 Recognizer
        UITapGestureRecognizer* singleRecognizer;
        singleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(homeImageViewSingleTap:)];
        //点击的次数
        singleRecognizer.numberOfTapsRequired = 1; // 单击
        //点击的手指数
        singleRecognizer.numberOfTouchesRequired = 1;
        //给view添加一个手势监测；
        [imageView addGestureRecognizer:singleRecognizer];
        [Unity imageviewAddsuperview_superView:imageView _subViewFrame:CGRectMake((imageView.frame.size.width-75)/2, (imageView.frame.size.width-75)/2, 75, 75) _imageName:imageArr[i] _backgroundColor:nil];
        [Unity lableViewAddsuperview_superView:imageView _subViewFrame:CGRectMake(0, imageView.frame.size.height-18-10+5, imageView.frame.size.width, 18) _string:nameArr[i] _lableFont:[UIFont boldSystemFontOfSize:14] _lableTxtColor:[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1] _textAlignment:NSTextAlignmentCenter];
    }
}
-(void)homeImageViewSingleTap:(UITapGestureRecognizer*)recognizer{
    
    switch (recognizer.view.tag) {
            //预约医生
        case 1000:
        {
            Home_OrderViewController *ovc=[[Home_OrderViewController alloc] init];
            ovc.titleString=nameArr[recognizer.view.tag-1000];
            ovc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:ovc animated:YES];
        }
            break;
            //测量输入
        case 1001:
        {
            Home_MeasureViewController *ovc=[[Home_MeasureViewController alloc] init];
            ovc.titleString=nameArr[recognizer.view.tag-1000];
            ovc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:ovc animated:YES];
        }
            break;
            //附近
        case 1002:
        {
            Home_NearViewController *ovc=[[Home_NearViewController alloc] init];
            ovc.titleString=nameArr[recognizer.view.tag-1000];
            ovc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:ovc animated:YES];
        }
            break;
            //资料上传
        case 1003:
        {
            Home_DataViewController *ovc=[[Home_DataViewController alloc] init];
            ovc.titleString=nameArr[recognizer.view.tag-1000];
            ovc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:ovc animated:YES];
        }
            break;
            //服药记录
        case 1004:
        {
            Home_MedicineViewController *ovc=[[Home_MedicineViewController alloc] init];
            ovc.titleString=nameArr[recognizer.view.tag-1000];
            ovc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:ovc animated:YES];
        }
            break;
            //提醒
        case 1005:
        {
            Home_RemindViewController *ovc=[[Home_RemindViewController alloc] init];
            ovc.titleString=nameArr[recognizer.view.tag-1000];
            ovc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:ovc animated:YES];
        }
            break;
            
        default:
            break;
    }
    
}
#pragma mark 行的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"yoyoCellIdentifier";
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[HomeTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    if (indexPath.row==0) {
        cell.lineLabel.frame=CGRectMake(21.5, 20, 2, 80-20);
    }else{
        cell.lineLabel.frame=CGRectMake(21.5, 0, 2,80);
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    cell.backgroundColor=tableView.backgroundColor;
    return cell;
}
#pragma mark 分区数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
#pragma mark 行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
#pragma mark 行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
#pragma mark Cell点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}
#pragma mark - 标题的高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01f;
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
