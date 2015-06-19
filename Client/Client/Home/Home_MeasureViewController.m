//
//  Home_MeasureViewController.m
//  Client
//
//  Created by smile_faner on 15/6/4.
//  Copyright (c) 2015年 CC. All rights reserved.
//
/*tag
 心情1110
 体重1120
 睡眠1130
 运动1140
 血糖1150
 血压1160
 血脂1170
 */
#define Mood_Tag 1110
#define Weight_Tag 1120
#define Sleep_Tag 1130
#define Sport_Tag 1140
#define BloodSugar_Tag 1150
#define BloodPressure_Tag 1160
#define Lipid_Tag 1170
//刻度尺的lable的tag1200
//PickerView_tag 1300开始
#define PickerView_Date_Tag 1300//日期
#define PickerView_Time_Tag 1301//时间
#define PickerView_Mood_Tag 1302//心情
#define PickerView_Weight_Tag 1303//体重
#define PickerView_MovementTime_Tag 1304//运动时长
#define PickerView_MovementType_Tag 1305//运动类型BloodSugarPicker
#define PickerView_BloodSugar1_Tag 1306//血糖餐前
#define PickerView_BloodSugar2_Tag 1307//血糖餐后
#define PickerView_SleepTime1_Tag 1308//睡眠睡觉
#define PickerView_SleepTime2_Tag 1309//睡眠起床
#define PickerView_BloodPressure_Tag 1310//血压
#define PickerView_Lipid_Tag 1311//血脂
#define BloodSugarBreakfast_Tag 1401//早餐按钮
#define BloodSugarLunch_Tag 1402//午餐按钮
#define BloodSugarDinner_Tag 1403//晚餐按钮

#import "Home_MeasureViewController.h"
#import "Measure_HistoryListViewController.h"
#import "HcCustomKeyboard.h"
@interface Home_MeasureViewController ()

@end

@implementation Home_MeasureViewController
{
    NSArray *titleArr;
    UIScrollView *titleScrollView;
    UIScrollView *dataScrollView;
    UIView *lineView;
    //日期
    UILabel *dateLable;
    //体重
    UILabel *weightLable;
    UIScrollView *weightScrollView;
    CGPoint touchPoint;
    UILabel *tianlanLabel;
    //各个界面的button
    UIButton *moodButton;
    //识别dataScrollView处于那个视图
    NSString *stateString;
    UILabel *sportLable1;
    UILabel *sportLable2;
    UILabel *sleepLable1;
    UILabel *sleepLable2;
    NSString *bloodSugarBreakfastString1;//早餐餐前
    NSString *bloodSugarBreakfastString2;//早餐餐后
    NSString *bloodSugarLunchString1;//午餐餐前
    NSString *bloodSugarLunchString2;//午餐餐后
    NSString *bloodSugarDinnerString1;//晚餐餐前
    NSString *bloodSugarDinnerString2;//晚餐餐后
    NSString *foodString;//早餐午餐晚餐识别
    UILabel *beforeFoodLabel;
    UILabel *afterFoodLabel;
    UIButton *okButton;//保存或者修改按钮
    UIView *okView;
    //备注label
    UILabel *noteMoodLable;
    UILabel *noteWeighLable;
    UILabel *noteSleepLable;
    UILabel *noteSportLable;
    UILabel *noteBloodSugarLable;
    UILabel *noteBloodPressureLable;
    UILabel *noteLipidLable;
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addTitleView:self.titleString];
    [self addItem:@"" imageName:@"jiantou" actoion:@selector(backClick) position:LEFT_BAR_BUTTON];
    [self addItem:@"历史" imageName:@"" actoion:@selector(historyButtonClick) position:RIGHT_BAR_BUTTON];
    titleArr=@[@"心情",@"体重",@"睡眠",@"运动",@"血糖",@"血压",@"血脂"];
    stateString=titleArr[0];
    [self createTitleScrollView];
    [self createDataScrollView];
    [[HcCustomKeyboard customKeyboard]textViewShowView:self customKeyboardDelegate:self];
}
-(void)historyButtonClick{
    Measure_HistoryListViewController *mvc=[[Measure_HistoryListViewController alloc] init];
    if (stateString==titleArr[0]) {
        mvc.titleString=stateString;
        [self.navigationController pushViewController:mvc animated:YES];
    }else if(stateString==titleArr[1]){
        mvc.titleString=stateString;
        [self.navigationController pushViewController:mvc animated:YES];
    }else if(stateString==titleArr[2]){
        mvc.titleString=stateString;
        [self.navigationController pushViewController:mvc animated:YES];
    }else if(stateString==titleArr[3]){
        mvc.titleString=stateString;
        [self.navigationController pushViewController:mvc animated:YES];
    }else if(stateString==titleArr[4]){
        mvc.titleString=stateString;
        [self.navigationController pushViewController:mvc animated:YES];
    }else if(stateString==titleArr[5]){
        mvc.titleString=stateString;
        [self.navigationController pushViewController:mvc animated:YES];
    }else if(stateString==titleArr[6]){
        mvc.titleString=stateString;
        [self.navigationController pushViewController:mvc animated:YES];
    }
}
-(void)createTitleScrollView{
    titleScrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 37)];
    titleScrollView.delegate=self;
    titleScrollView.backgroundColor=[UIColor colorWithRed:19/255.0f green:173/255.0f blue:215/255.0f alpha:1];
    // 当值是 YES 会自动滚动到 subview 的边界。默认是NO
    titleScrollView.pagingEnabled = YES;
    //垂直滑动
    titleScrollView.showsVerticalScrollIndicator = NO;
    //水平滑动
    titleScrollView.showsHorizontalScrollIndicator = YES;
    //默认是 yes，就是滚动超过边界会反弹有反弹回来的效果。假如是 NO，那么滚动到达边界会立刻停止。
    titleScrollView.bounces=NO;
    //滚动条颜色
    titleScrollView.indicatorStyle=UIScrollViewIndicatorStyleDefault;
    [titleScrollView setShowsHorizontalScrollIndicator:NO];
    titleScrollView.contentSize = CGSizeMake((ScreenWidth/5)*titleArr.count, 0);
    [self.view addSubview:titleScrollView];
    for (int i=0; i<titleArr.count; i++) {
        UILabel *linelable=[[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/5-1+(ScreenWidth/5)*i, 10, 2, 20)];
        linelable.backgroundColor=[UIColor colorWithRed:19/255.0f green:162/255.0f blue:200/255.0f alpha:1];
        [titleScrollView addSubview:linelable];
        UIButton *button=[Unity buttonAddsuperview_superView:titleScrollView _subViewFrame:CGRectMake(0+(ScreenWidth/5)*i, 1, ScreenWidth/5, 35) _tag:self _action:@selector(buttonClick:) _string:titleArr[i] _imageName:@""];
        button.tag=1100+i;
        button.backgroundColor=[UIColor clearColor];
        button.titleLabel.font=[UIFont systemFontOfSize:16];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    lineView=[[UIView alloc] initWithFrame:CGRectMake(15, 34, ScreenWidth/5-30, 2)];
    lineView.backgroundColor=[UIColor whiteColor];
    [titleScrollView addSubview:lineView];
}
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    CGPoint p = scrollView.contentOffset;
    if([scrollView class]==titleScrollView){
        if (p.x<=0) {
            [scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
        }else if(p.x>0&&p.x<=ScreenWidth/5){
            [scrollView setContentOffset:CGPointMake(ScreenWidth/5, 0) animated:NO];
        }else{
            [scrollView setContentOffset:CGPointMake(ScreenWidth/5*2, 0) animated:NO];
        }
    }
}

-(void)buttonClick:(UIButton *)button{
    [dataScrollView setContentOffset:CGPointMake(ScreenWidth*(button.tag-1100), 0) animated:YES];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
{
    //    NSLog(@" scrollViewDidScroll");
//    NSLog(@"ContentOffset  x is  %f,yis %f",scrollView.contentOffset.x/ScreenWidth,scrollView.contentOffset.y);
    if (scrollView==dataScrollView) {
        NSInteger ssss=scrollView.contentOffset.x/ScreenWidth;
        stateString=titleArr[ssss];
        lineView.frame=CGRectMake(15+scrollView.contentOffset.x/ScreenWidth*ScreenWidth/5, 34, ScreenWidth/5-30, 2);
        if (scrollView.contentOffset.x/ScreenWidth==5) {
            [titleScrollView setContentOffset:CGPointMake(ScreenWidth/5, 0) animated:YES];
        }else if (scrollView.contentOffset.x/ScreenWidth==6){
            [titleScrollView setContentOffset:CGPointMake((ScreenWidth/5)*2, 0) animated:YES];
        }else if(scrollView.contentOffset.x/ScreenWidth<=4){
            [titleScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
        }
    }
    
}
-(void)createDataScrollView{
    dataScrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 37, ScreenWidth, ScreenHeight-64-37)];
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
    dataScrollView.indicatorStyle=UIScrollViewIndicatorStyleDefault;
    [dataScrollView setShowsHorizontalScrollIndicator:NO];
    dataScrollView.contentSize = CGSizeMake(ScreenWidth*titleArr.count, 0);
    [self.view addSubview:dataScrollView];
    //心情
    [self createMoodView];
    //体重
    [self createWeightView];
    //睡眠
    [self createSleepView];
    //运动
    [self createSportView];
    //血糖
    [self createBloodSugarView];
    //血压
    [self createBloodPressureView];
    //血脂
    [self createLipidView];
    [self createOKButton];
}
-(void)createOKButton{
    okView=[[UIView alloc] initWithFrame:CGRectMake(0, ScreenHeight-64-70, ScreenWidth, 70)];
    okView.backgroundColor=[UIColor clearColor];
    [self.view addSubview:okView];
    okButton=[Unity buttonAddsuperview_superView:okView _subViewFrame:CGRectMake(10, 10, ScreenWidth-20, 42) _tag:self _action:@selector(okButtonClick) _string:@"保 存" _imageName:@""];
    okButton.titleLabel.font=[UIFont systemFontOfSize:16];
    [okButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [Unity setControls:okButton Radius:4];
    okButton.backgroundColor=COLOR_SUHONG;
}
-(void)okButtonClick{
    
}
#pragma mark dataScroButton点击事件
-(void)dataScrolButtonClick:(UIButton *)button{
    switch (button.tag) {
            //日期
        case Mood_Tag:
        {
            [self showDatePickerView];
        }
            break;
            //时间
        case Mood_Tag+1:
        {
            [self showTimePickerView];
        }
            break;
            //添加
        case Mood_Tag+2:
        {
            [self showMoodPickerView];
        }
            break;
            //日期
        case Weight_Tag:
        {
            [self showDatePickerView];
        }
            break;
            //时间
        case Weight_Tag+1:
        {
            [self showTimePickerView];
        }
            break;
            //体重
        case Weight_Tag+2:
        {
            [self showWeightPickerView];
        }
            break;
            //日期
        case Sleep_Tag:
        {
            [self showDatePickerView];
        }
           break;
            //睡觉
        case Sleep_Tag+1:
        {
            [self showSleepTimePickerView1];
        }
            break;
            //起床
        case Sleep_Tag+2:
        {
            [self showSleepTimePickerView2];
        }
            break;
            //日期
        case Sport_Tag:
        {
            [self showDatePickerView];
        }
            break;
            //时间
        case Sport_Tag+1:
        {
            [self showTimePickerView];
        }
            break;
            //运动类型
        case Sport_Tag+2:
        {
            [self showMovementTypePickerView];
        }
            break;
            //运动时长
        case Sport_Tag+3:
        {
            [self showMovementTimePickerView];
        }
            break;
            //血糖日期
        case BloodSugar_Tag:
        {
            [self showDatePickerView];
        }
            break;
            //血糖餐前
        case BloodSugar_Tag+1:
        {
            [self showBloodSugarPickerView1];
        }
            break;
            //血糖餐后
        case BloodSugar_Tag+2:
        {
            [self showBloodSugarPickerView2];
        }
            break;
            //血压日期
        case BloodPressure_Tag:
        {
            [self showDatePickerView];
        }
            break;
            //血压时间
        case BloodPressure_Tag+1:
        {
            [self showTimePickerView];
        }
            break;
            //血压
        case BloodPressure_Tag+2:
        {
            [self showBloodPressurePickerView];
        }
            break;
            //血脂日期
        case Lipid_Tag:
        {
            [self showDatePickerView];
        }
            break;
            //血脂时间
        case Lipid_Tag+1:
        {
            [self showTimePickerView];
        }
            break;
            //血脂
        case Lipid_Tag+2:
        {
            [self showLipidPickerView];
        }
            break;
        default:
            break;
    }
}
-(void)showMoodPickerView{
    NSArray *arr=@[@"开心",@"高兴",@"生气",@"暴躁",@"狂怒",@"愤怒"];
    IQActionSheetPickerView *picker = [[IQActionSheetPickerView alloc] initWithTitle:@"心情" FirstButton:@"取消" SecondButton:@"确定" delegate:self];
    [picker setTag:PickerView_Mood_Tag];
    [picker setTitlesForComponenets:@[arr]];
    [picker show];
}
-(void)showDatePickerView{
    NSArray *yearArr=@[@"2015年",@"2016年",@"2017年",@"2018年",@"2019年",@"2020年",@"2021年",@"2022年",@"2023年",@"2024年",@"2025年"];
    NSArray *monthArr=@[@"1月",@"2月",@"3月",@"4月",@"5月",@"6月",@"7月",@"8月",@"9月",@"10月",@"11月",@"12月"];
    NSArray *dayArr=@[@"1日",@"2日",@"3日",@"4日",@"5",@"6",@"7日",@"8日",@"9日",@"10日",@"11日",@"12日",@"13日",@"14日",@"15日",@"16日",@"17日",@"18日",@"19日",@"20日",@"21日",@"22日",@"23日",@"24日",@"25日",@"26日",@"27日",@"28日",@"29日",@"30日",@"31日"];
    IQActionSheetPickerView *picker = [[IQActionSheetPickerView alloc] initWithTitle:@"日期" FirstButton:@"取消" SecondButton:@"确定" delegate:self];
    [picker setTag:PickerView_Date_Tag];
    [picker setTitlesForComponenets:@[yearArr,monthArr,dayArr]];
    //设置各行宽度
    CGFloat f=ScreenWidth/3;
    NSNumber *n=[NSNumber numberWithFloat:f];
    [picker setWidthsForComponents:@[n,
                                     n,
                                     n]];
    [picker show];
}
-(void)showTimePickerView{
    NSArray *arr=@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23"];
    NSMutableArray *arr1=[[NSMutableArray alloc] init];
    for (int i=0;i<60; i++) {
        [arr1 addObject:[NSString stringWithFormat:@"%i",i]];
    }
    IQActionSheetPickerView *picker = [[IQActionSheetPickerView alloc] initWithTitle:@"时间" FirstButton:@"取消" SecondButton:@"确定" delegate:self];
    [picker setTag:PickerView_Time_Tag];
    [picker setTitlesForComponenets:@[arr,@[@"小时"],arr1,@[@"分钟"]]];
    [picker show];
}
-(void)showSleepTimePickerView1{
    NSArray *arr=@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23"];
    NSMutableArray *arr1=[[NSMutableArray alloc] init];
    for (int i=0;i<60; i++) {
        [arr1 addObject:[NSString stringWithFormat:@"%i",i]];
    }
    IQActionSheetPickerView *picker = [[IQActionSheetPickerView alloc] initWithTitle:@"时间" FirstButton:@"取消" SecondButton:@"确定" delegate:self];
    [picker setTag:PickerView_SleepTime1_Tag];
    [picker setTitlesForComponenets:@[arr,@[@"小时"],arr1,@[@"分钟"]]];
    [picker show];
}
-(void)showSleepTimePickerView2{
    NSArray *arr=@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23"];
    NSMutableArray *arr1=[[NSMutableArray alloc] init];
    for (int i=0;i<60; i++) {
        [arr1 addObject:[NSString stringWithFormat:@"%i",i]];
    }
    IQActionSheetPickerView *picker = [[IQActionSheetPickerView alloc] initWithTitle:@"时间" FirstButton:@"取消" SecondButton:@"确定" delegate:self];
    [picker setTag:PickerView_SleepTime2_Tag];
    [picker setTitlesForComponenets:@[arr,@[@"小时"],arr1,@[@"分钟"]]];
    [picker show];
}
-(void)showWeightPickerView{
    NSMutableArray *arr=[[NSMutableArray alloc] init];
    for (int i=0;i<10; i++) {
        [arr addObject:[NSString stringWithFormat:@"%i",i]];
    }
    IQActionSheetPickerView *picker = [[IQActionSheetPickerView alloc] initWithTitle:@"体重" FirstButton:@"取消" SecondButton:@"确定" delegate:self];
    [picker setTag:PickerView_Weight_Tag];
    [picker setTitlesForComponenets:@[arr,arr,@[@"."],arr,@[@"kg"]]];
    [picker show];
}
#pragma mark -运动时长PickerView
-(void)showMovementTimePickerView{
    NSMutableArray *arr=[[NSMutableArray alloc] init];
    for (int i=1;i<=18; i++) {
        if (i%6==0) {
            [arr addObject:[NSString stringWithFormat:@"%i小时",i/6]];
        }else{
            if (i<=6) {
                [arr addObject:[NSString stringWithFormat:@"%i分钟",i*10]];
            }else if (i>6&&i<=12){
                [arr addObject:[NSString stringWithFormat:@"1小时%i分钟",i%6*10]];
            }else{
                [arr addObject:[NSString stringWithFormat:@"2小时%i分钟",i%6*10]];
            }
        }
    }
    IQActionSheetPickerView *picker = [[IQActionSheetPickerView alloc] initWithTitle:@"运动时长" FirstButton:@"取消" SecondButton:@"确定" delegate:self];
    [picker setTag:PickerView_MovementTime_Tag];
    [picker setTitlesForComponenets:@[arr]];
    [picker show];
}
#pragma mark -运动类型PickerView
-(void)showMovementTypePickerView{
    NSArray *arr=@[@"跑步",@"慢跑",@"跳绳",@"散步",@"爬楼梯",@"骑自行车"];
    IQActionSheetPickerView *picker = [[IQActionSheetPickerView alloc] initWithTitle:@"运动类型" FirstButton:@"取消" SecondButton:@"确定" delegate:self];
    [picker setTag:PickerView_MovementType_Tag];
    [picker setTitlesForComponenets:@[arr]];
    [picker show];
}
#pragma mark -血糖PickerView餐前
-(void)showBloodSugarPickerView1{
    NSMutableArray *arr=[[NSMutableArray alloc] init];
    for (int i=0; i<10; i++) {
        [arr addObject:[NSString stringWithFormat:@"%i",i]];
    }
    NSArray *arr1=@[@"mmol/L",@"mg/dL"];
    IQActionSheetPickerView *picker = [[IQActionSheetPickerView alloc] initWithTitle:@"血糖" FirstButton:@"取消" SecondButton:@"确定" delegate:self];
    [picker setTag:PickerView_BloodSugar1_Tag];
    [picker setTitlesForComponenets:@[arr,arr,@[@"."],arr,arr1]];
    [picker show];
}
#pragma mark -血糖PickerView餐后
-(void)showBloodSugarPickerView2{
    NSMutableArray *arr=[[NSMutableArray alloc] init];
    for (int i=0; i<10; i++) {
        [arr addObject:[NSString stringWithFormat:@"%i",i]];
    }
    NSArray *arr1=@[@"mmol/L",@"mg/dL"];
    IQActionSheetPickerView *picker = [[IQActionSheetPickerView alloc] initWithTitle:@"血糖" FirstButton:@"取消" SecondButton:@"确定" delegate:self];
    [picker setTag:PickerView_BloodSugar2_Tag];
    [picker setTitlesForComponenets:@[arr,arr,@[@"."],arr,arr1]];
    [picker show];
}

#pragma mark -血压PickerView
-(void)showBloodPressurePickerView{
    NSMutableArray *arr=[[NSMutableArray alloc] init];
    for (int i=50; i<=200; i++) {
        [arr addObject:[NSString stringWithFormat:@"%i",i]];
    }
    NSArray *arr1=@[@"mmHg"];
    IQActionSheetPickerView *picker = [[IQActionSheetPickerView alloc] initWithTitle:@"血压" FirstButton:@"取消" SecondButton:@"确定" delegate:self];
    [picker setTag:PickerView_BloodPressure_Tag];
    [picker setTitlesForComponenets:@[arr,@[@"/"],arr,arr1]];
    [picker show];
}
#pragma mark -血脂PickerView
-(void)showLipidPickerView{
    NSMutableArray *arr=[[NSMutableArray alloc] init];
    for (int i=50; i<=200; i++) {
        [arr addObject:[NSString stringWithFormat:@"%i",i]];
    }
    NSArray *arr1=@[@"mmHg"];
    IQActionSheetPickerView *picker = [[IQActionSheetPickerView alloc] initWithTitle:@"血脂" FirstButton:@"取消" SecondButton:@"确定" delegate:self];
    [picker setTag:PickerView_Lipid_Tag];
    [picker setTitlesForComponenets:@[arr,@[@"/"],arr,arr1]];
    [picker show];
}
#pragma mark -ActionSheetPickerView引入函数1
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}
#pragma mark -ActionSheetPickerView引入函数2
-(BOOL)shouldAutorotate
{
    return YES;
}
#pragma mark -ActionSheetPickerView引入函数3
-(void)actionSheetPickerView:(IQActionSheetPickerView *)pickerView didSelectTitles:(NSArray *)titles{
    switch (pickerView.tag) {
        case PickerView_Mood_Tag:
        {
            if (stateString==titleArr[0]) {
                UIButton *button=(UIButton *)[self.view viewWithTag:Mood_Tag+2];
                [button setTitle:titles[0] forState:UIControlStateNormal];
            }else if(stateString==titleArr[1]){
                UIButton *button=(UIButton *)[self.view viewWithTag:Weight_Tag+2];
                [button setTitle:titles[0] forState:UIControlStateNormal];
            }
            
        }
            break;
        case PickerView_Time_Tag:
        {
            NSString *hstr=titles[0];
            NSString *mstr=titles[2];
            if (hstr.length==1) {
                hstr=[NSString stringWithFormat:@"0%@",titles[0]];
            }
            if (mstr.length==1) {
                mstr=[NSString stringWithFormat:@"0%@",titles[2]];
            }
            NSString *str=[NSString stringWithFormat:@"%@:%@",hstr,mstr];
            if (stateString==titleArr[0]) {
                UIButton *button=(UIButton *)[self.view viewWithTag:Mood_Tag+1];
                [button setTitle:str forState:UIControlStateNormal];
            }else if(stateString==titleArr[1]){
                UIButton *button=(UIButton *)[self.view viewWithTag:Weight_Tag+1];
                [button setTitle:str forState:UIControlStateNormal];
            }else if(stateString==titleArr[3]){
                UIButton *button=(UIButton *)[self.view viewWithTag:Sport_Tag+1];
                [button setTitle:str forState:UIControlStateNormal];
            }else if(stateString==titleArr[5]){
                UIButton *button=(UIButton *)[self.view viewWithTag:BloodPressure_Tag+1];
                [button setTitle:str forState:UIControlStateNormal];
            }else if(stateString==titleArr[6]){
                UIButton *button=(UIButton *)[self.view viewWithTag:Lipid_Tag+1];
                [button setTitle:str forState:UIControlStateNormal];
            }
            
        }
            break;
        case PickerView_Date_Tag:
        {
            //Sleep_Tag
            NSString *str=[NSString stringWithFormat:@"%@%@%@",titles[0],titles[1],titles[2]];
            if (stateString==titleArr[0]) {
                UIButton *button=(UIButton *)[self.view viewWithTag:Mood_Tag];
                [button setTitle:str forState:UIControlStateNormal];
            }else if (stateString==titleArr[1]){
                UIButton *button=(UIButton *)[self.view viewWithTag:Weight_Tag];
                [button setTitle:str forState:UIControlStateNormal];
            }else if(stateString==titleArr[2]){
                UIButton *button=(UIButton *)[self.view viewWithTag:Sleep_Tag];
                [button setTitle:str forState:UIControlStateNormal];
            }
            else if(stateString==titleArr[3]){
                UIButton *button=(UIButton *)[self.view viewWithTag:Sport_Tag];
                [button setTitle:str forState:UIControlStateNormal];
            }else if(stateString==titleArr[4]){
                UIButton *button=(UIButton *)[self.view viewWithTag:BloodSugar_Tag];
                [button setTitle:str forState:UIControlStateNormal];
            }else if(stateString==titleArr[5]){
                UIButton *button=(UIButton *)[self.view viewWithTag:BloodPressure_Tag];
                [button setTitle:str forState:UIControlStateNormal];
            }else if(stateString==titleArr[6]){
                UIButton *button=(UIButton *)[self.view viewWithTag:Lipid_Tag];
                [button setTitle:str forState:UIControlStateNormal];
            }
            
        }
            break;
        case PickerView_Weight_Tag:
        {
            UIButton *button=(UIButton *)[self.view viewWithTag:Weight_Tag+2];
            NSString *str=[NSString stringWithFormat:@"%@%@%@%@%@",titles[0],titles[1],titles[2],titles[3],titles[4]];
            [button setTitle:str forState:UIControlStateNormal];
        }
            break;
        case PickerView_BloodPressure_Tag:
        {
            UIButton *button=(UIButton *)[self.view viewWithTag:BloodPressure_Tag+2];
            NSString *str=[NSString stringWithFormat:@"%@%@%@%@",titles[0],titles[1],titles[2],titles[3]];
            [button setTitle:str forState:UIControlStateNormal];
        }
            break;
        case PickerView_Lipid_Tag:
        {
            UIButton *button=(UIButton *)[self.view viewWithTag:Lipid_Tag+2];
            NSString *str=[NSString stringWithFormat:@"%@%@%@%@",titles[0],titles[1],titles[2],titles[3]];
            [button setTitle:str forState:UIControlStateNormal];
        }
            break;
        case PickerView_MovementTime_Tag:
        {
            sportLable2.text=titles[0];
        }
            break;
        case PickerView_MovementType_Tag:
        {
            sportLable1.text=titles[0];
        }
            break;
        case PickerView_BloodSugar1_Tag:
        {
            NSString *str;
            if (![titles[0] integerValue]==0) {
                str=[NSString stringWithFormat:@"%@%@%@%@%@",titles[0],titles[1],titles[2],titles[3],titles[4]];
            }else{
                str=[NSString stringWithFormat:@"%@%@%@%@",titles[1],titles[2],titles[3],titles[4]];
            }
            if ([foodString isEqualToString:@"早餐"]) {
                bloodSugarBreakfastString1=str;
                beforeFoodLabel.text=bloodSugarBreakfastString1;
            }else if([foodString isEqualToString:@"午餐"]){
                bloodSugarLunchString1=str;
                beforeFoodLabel.text=bloodSugarLunchString1;
            }else{
                bloodSugarDinnerString1=str;
                beforeFoodLabel.text=bloodSugarDinnerString1;
            }
        }
            break;
        case PickerView_BloodSugar2_Tag:
        {
            NSString *str;
            if (![titles[0] integerValue]==0) {
                str=[NSString stringWithFormat:@"%@%@%@%@%@",titles[0],titles[1],titles[2],titles[3],titles[4]];
            }else{
                str=[NSString stringWithFormat:@"%@%@%@%@",titles[1],titles[2],titles[3],titles[4]];
            }
            if ([foodString isEqualToString:@"早餐"]) {
                bloodSugarBreakfastString2=str;
                afterFoodLabel.text=bloodSugarBreakfastString2;
            }else if([foodString isEqualToString:@"午餐"]){
                bloodSugarLunchString2=str;
                afterFoodLabel.text=bloodSugarLunchString2;
            }else{
                bloodSugarDinnerString2=str;
                afterFoodLabel.text=bloodSugarDinnerString2;
            }
        }
            break;
        default:
            break;
    }
}
#pragma mark -创建心情View
-(void)createMoodView{
    UIView *MoodView=[[UIView alloc] initWithFrame:CGRectMake(0, 10, ScreenWidth, dataTableView.frame.size.height-10)];
    MoodView.backgroundColor=[UIColor whiteColor];
    [dataScrollView addSubview:MoodView];
    NSArray *arr=@[@"今日",@"16:20"];
    for (int i=0; i<2; i++) {
        UIView *view=[[UIView alloc] initWithFrame:CGRectMake(10+((ScreenWidth-30)/2+10)*i, 10, (ScreenWidth-30)/2, 45)];
        view.backgroundColor=COLOR_TIANLAN;
        [Unity setControls:view Radius:4];
        [MoodView addSubview:view];
        UIButton *button=[Unity buttonAddsuperview_superView:view _subViewFrame:CGRectMake(1, 1, view.frame.size.width-2, view.frame.size.height-2) _tag:self _action:@selector(dataScrolButtonClick:) _string:arr[i] _imageName:@""];
        button.backgroundColor=[UIColor colorWithRed:227.0f/255.0f green:242.0f/255.0f blue:250.0f/255.0f alpha:1];
        [button setTitleColor:[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1] forState:UIControlStateNormal];
        button.titleLabel.font=[UIFont systemFontOfSize:16];
        button.tag=Mood_Tag+i;
        [Unity setControls:button Radius:4];
    }
    UIView *addView=[[UIView alloc] initWithFrame:CGRectMake(10, 65, ScreenWidth-20,ScreenWidth/2-65-10)];
    addView.backgroundColor=[UIColor colorWithRed:253.0f/255.0f green:215.0f/255.0f blue:122.0f/255.0f alpha:1];
    [Unity setControls:addView Radius:4];
    [MoodView addSubview:addView];
    UIButton *addButton=[Unity buttonAddsuperview_superView:addView _subViewFrame:CGRectMake(1, 1, ScreenWidth-20-2,ScreenWidth/2-65-10-2) _tag:self _action:@selector(dataScrolButtonClick:) _string:@"+" _imageName:@""];
    addButton.backgroundColor=[UIColor colorWithRed:255.0f/255.0f green:250.0f/255.0f blue:238.0f/255.0f alpha:1];
    [addButton setTitleColor:[UIColor colorWithRed:253.0f/255.0f green:215.0f/255.0f blue:122.0f/255.0f alpha:1] forState:UIControlStateNormal];
    addButton.tag=Mood_Tag+2;
    addButton.titleLabel.font=[UIFont boldSystemFontOfSize:28];
    [Unity setControls:addButton Radius:4];
    UIView *textViews=[[UIView alloc] initWithFrame:CGRectMake(10, ScreenWidth/2, ScreenWidth-20, ScreenWidth/2-10)];
    textViews.backgroundColor=[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1];
    [Unity setControls:textViews Radius:4];
    [MoodView addSubview:textViews];
    UIView *labelView=[[UIView alloc] initWithFrame:CGRectMake(1, 1, ScreenWidth-20-2, ScreenWidth/2-10-2)];
    labelView.userInteractionEnabled=YES;
    labelView.backgroundColor=[UIColor whiteColor];
    [Unity setControls:labelView Radius:4];
    UITapGestureRecognizer* singleRecognizer;
    singleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(noteLabelSingleTap)];
    //点击的次数
    singleRecognizer.numberOfTapsRequired = 1; // 单击
    //点击的手指数
    singleRecognizer.numberOfTouchesRequired = 1;
    //给view添加一个手势监测；
    [labelView addGestureRecognizer:singleRecognizer];
    [textViews addSubview:labelView];
    noteMoodLable=[Unity lableViewAddsuperview_superView:labelView _subViewFrame:CGRectMake(10, 10, labelView.frame.size.width-20, 0) _string:@"填写备注信息" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1] _textAlignment:NSTextAlignmentLeft];
    CGFloat lf=[Unity getLabelHeightWithWidth:labelView.frame.size.width andDefaultHeight:0 andFontSize:14 andText:@"填写备注信息"];
    noteMoodLable.frame=CGRectMake(10, 10, labelView.frame.size.width-20, lf);
    noteMoodLable.numberOfLines=0;
}

-(void)noteLabelSingleTap{
    [[HcCustomKeyboard customKeyboard].mTextView becomeFirstResponder];
    //[HcCustomKeyboard customKeyboard].mTextView.text=@"sdfghnjmvbmk,";
}
-(void)talkBtnClick:(UITextView *)textViewGet
{//ScreenWidth/2-10-2
    CGFloat f=[Unity getLabelHeightWithWidth:ScreenWidth-20-2 andDefaultHeight:0 andFontSize:14 andText:textViewGet.text];
    if (stateString==titleArr[0]) {
        noteMoodLable.textColor=COLOR_SHENHUI;
        if (f>ScreenWidth/2-10-2-20) {
            noteMoodLable.frame=CGRectMake(10, 10, ScreenWidth-20-2-20, ScreenWidth/2-10-2-20);
            noteMoodLable.adjustsFontSizeToFitWidth = YES;
        }else{
            noteMoodLable.frame=CGRectMake(10, 10, ScreenWidth-20-2-20, f);
            noteMoodLable.text=textViewGet.text;
        }
    }else if(stateString==titleArr[1]){
        noteWeighLable.textColor=COLOR_SHENHUI;
        if (f>ScreenWidth/2-10-2-20) {
            noteWeighLable.frame=CGRectMake(10, 10, ScreenWidth-20-2-20, ScreenWidth/2-10-2-20);
        }else{
            noteWeighLable.frame=CGRectMake(10, 10, ScreenWidth-20-2-20, f);
            noteWeighLable.text=textViewGet.text;
        }
    }else if(stateString==titleArr[2]){
        noteSleepLable.textColor=COLOR_SHENHUI;
        if (f>ScreenWidth/2-10-2-20) {
            noteSleepLable.frame=CGRectMake(10, 10, ScreenWidth-20-2-20, ScreenWidth/2-10-2-20);
        }else{
            noteSleepLable.frame=CGRectMake(10, 10, ScreenWidth-20-2-20, f);
            noteSleepLable.text=textViewGet.text;
        }
    }else if(stateString==titleArr[3]){
        noteSportLable.textColor=COLOR_SHENHUI;
        if (f>ScreenWidth/2-10-2-20) {
            noteSportLable.frame=CGRectMake(10, 10, ScreenWidth-20-2-20, ScreenWidth/2-10-2-20);
        }else{
            noteSportLable.frame=CGRectMake(10, 10, ScreenWidth-20-2-20, f);
            noteSportLable.text=textViewGet.text;
        }
    }else if(stateString==titleArr[4]){
        noteBloodSugarLable.textColor=COLOR_SHENHUI;
        if (f>ScreenWidth/2-10-2-20) {
            noteBloodSugarLable.frame=CGRectMake(10, 10, ScreenWidth-20-2-20, ScreenWidth/2-10-2-20);
        }else{
            noteBloodSugarLable.frame=CGRectMake(10, 10, ScreenWidth-20-2-20, f);
            noteBloodSugarLable.text=textViewGet.text;
        }
    }else if(stateString==titleArr[5]){
        noteBloodPressureLable.textColor=COLOR_SHENHUI;
        if (f>ScreenWidth/2-10-2-20) {
            noteBloodPressureLable.frame=CGRectMake(10, 10, ScreenWidth-20-2-20, ScreenWidth/2-10-2-20);
        }else{
            noteBloodPressureLable.frame=CGRectMake(10, 10, ScreenWidth-20-2-20, f);
            noteBloodPressureLable.text=textViewGet.text;
        }
    }else if(stateString==titleArr[6]){
        noteLipidLable.textColor=COLOR_SHENHUI;
        if (f>ScreenWidth/2-10-2-20) {
            noteLipidLable.frame=CGRectMake(10, 10, ScreenWidth-20-2-20, ScreenWidth/2-10-2-20);
        }else{
            noteLipidLable.frame=CGRectMake(10, 10, ScreenWidth-20-2-20, f);
            noteLipidLable.text=textViewGet.text;
        }
    }
}
#pragma mark -创建体重View
-(void)createWeightView{
    UIView *WeightView=[[UIView alloc] initWithFrame:CGRectMake(ScreenWidth, 10, ScreenWidth, dataTableView.frame.size.height-10)];
    WeightView.backgroundColor=[UIColor whiteColor];
    [dataScrollView addSubview:WeightView];
    NSArray *arr=@[@"今日",@"16:20"];
    for (int i=0; i<2; i++) {
        UIView *view=[[UIView alloc] initWithFrame:CGRectMake(10+((ScreenWidth-30)/2+10)*i, 10, (ScreenWidth-30)/2, 45)];
        view.backgroundColor=COLOR_TIANLAN;
        [Unity setControls:view Radius:4];
        [WeightView addSubview:view];
        UIButton *button=[Unity buttonAddsuperview_superView:view _subViewFrame:CGRectMake(1, 1, view.frame.size.width-2, view.frame.size.height-2) _tag:self _action:@selector(dataScrolButtonClick:) _string:arr[i] _imageName:@""];
        button.backgroundColor=[UIColor colorWithRed:227.0f/255.0f green:242.0f/255.0f blue:250.0f/255.0f alpha:1];
        [button setTitleColor:[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1] forState:UIControlStateNormal];
        button.titleLabel.font=[UIFont systemFontOfSize:16];
        button.tag=Weight_Tag+i;
        [Unity setControls:button Radius:4];
    }
    UIView *addView=[[UIView alloc] initWithFrame:CGRectMake(10, 65, ScreenWidth-20,ScreenWidth/2-65-10)];
    addView.backgroundColor=[UIColor colorWithRed:253.0f/255.0f green:215.0f/255.0f blue:122.0f/255.0f alpha:1];
    [Unity setControls:addView Radius:4];
    [WeightView addSubview:addView];
    UIButton *addButton=[Unity buttonAddsuperview_superView:addView _subViewFrame:CGRectMake(1, 1, ScreenWidth-20-2,ScreenWidth/2-65-10-2) _tag:self _action:@selector(dataScrolButtonClick:) _string:@"+" _imageName:@""];
    addButton.backgroundColor=[UIColor colorWithRed:255.0f/255.0f green:250.0f/255.0f blue:238.0f/255.0f alpha:1];
    [addButton setTitleColor:[UIColor colorWithRed:253.0f/255.0f green:215.0f/255.0f blue:122.0f/255.0f alpha:1] forState:UIControlStateNormal];
    addButton.tag=Weight_Tag+2;
    addButton.titleLabel.font=[UIFont boldSystemFontOfSize:28];
    [Unity setControls:addButton Radius:4];
    UIView *textViews=[[UIView alloc] initWithFrame:CGRectMake(10, ScreenWidth/2, ScreenWidth-20, ScreenWidth/2-10)];
    textViews.backgroundColor=[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1];
    [Unity setControls:textViews Radius:4];
    [WeightView addSubview:textViews];
    UIView *labelView=[[UIView alloc] initWithFrame:CGRectMake(1, 1, ScreenWidth-20-2, ScreenWidth/2-10-2)];
    labelView.userInteractionEnabled=YES;
    labelView.backgroundColor=[UIColor whiteColor];
    [Unity setControls:labelView Radius:4];
    UITapGestureRecognizer* singleRecognizer;
    singleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(noteLabelSingleTap)];
    //点击的次数
    singleRecognizer.numberOfTapsRequired = 1; // 单击
    //点击的手指数
    singleRecognizer.numberOfTouchesRequired = 1;
    //给view添加一个手势监测；
    [labelView addGestureRecognizer:singleRecognizer];
    [textViews addSubview:labelView];
    noteWeighLable=[Unity lableViewAddsuperview_superView:labelView _subViewFrame:CGRectMake(10, 10, labelView.frame.size.width, 0) _string:@"填写备注信息" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1] _textAlignment:NSTextAlignmentLeft];
    CGFloat lf=[Unity getLabelHeightWithWidth:labelView.frame.size.width andDefaultHeight:0 andFontSize:14 andText:@"填写备注信息"];
    noteWeighLable.frame=CGRectMake(10, 10, labelView.frame.size.width-20, lf);
    noteWeighLable.numberOfLines=0;
}
-(void)handleLongPress:(UILongPressGestureRecognizer*)recognizer
{
    CGPoint touchPoin = [recognizer locationInView:weightScrollView];
    if (touchPoin.x<15) {
        tianlanLabel.frame=CGRectMake(15, 0, 1, 89);
        weightLable.text=@"0.0kg";
    }else{
        NSInteger f=touchPoin.x;
        if (f%5==0) {
            tianlanLabel.frame=CGRectMake(f, 0, 1, 89);
            CGFloat s=(f-15.0)/50;
            weightLable.text=[NSString stringWithFormat:@"%.1fkg",s];
            //备注 加刻度字体变大特别麻烦
//            NSInteger ff=f-15;
//            if (ff%50==0) {
//                labelTag=ff/50;
//                UILabel *label=(UILabel *)[self.view viewWithTag:1200+labelTag];
//                NSLog(@"keduzhi%@",label.text);
//                for (UIView *new in self.view.subviews) {
//                    if ([new isKindOfClass:[UILabel class]]) {
//                        if (new.tag == label.tag) {
//                            label.textColor=[UIColor redColor];
//                        }else{
//                            label.textColor=[UIColor blackColor];
//                        }
//                    }
//                }
//            }
        }else{
            if (f%5==1) {
                tianlanLabel.frame=CGRectMake(f-1, 0, 1, 89);
                CGFloat s=(f-1-15.0)/50;
                weightLable.text=[NSString stringWithFormat:@"%.1fkg",s];
            }else if(f%5==2){
                tianlanLabel.frame=CGRectMake(f-2, 0, 1, 89);
                CGFloat s=(f-2-15.0)/50;
                weightLable.text=[NSString stringWithFormat:@"%.1fkg",s];
            }else if(f%5==3){
                tianlanLabel.frame=CGRectMake(f+2, 0, 1, 89);
                CGFloat s=(f+2-15.0)/50;
                weightLable.text=[NSString stringWithFormat:@"%.1fkg",s];
            }else{
                tianlanLabel.frame=CGRectMake(f+1, 0, 1, 89);
                CGFloat s=(f+1-15.0)/50;
                weightLable.text=[NSString stringWithFormat:@"%.1fkg",s];
            }
        }

    }
    
}
#pragma mark -创建睡眠View
-(void)createSleepView{
    UIView *SleepView=[[UIView alloc] initWithFrame:CGRectMake(0+ScreenWidth*2, 10, ScreenWidth, dataTableView.frame.size.height-10)];
    SleepView.backgroundColor=[UIColor whiteColor];
    [dataScrollView addSubview:SleepView];
    UIView *vieww=[[UIView alloc] initWithFrame:CGRectMake(10, 10, (ScreenWidth-20), 45)];
    vieww.backgroundColor=COLOR_TIANLAN;
    [Unity setControls:vieww Radius:4];
    [SleepView addSubview:vieww];
    UIButton *button=[Unity buttonAddsuperview_superView:vieww _subViewFrame:CGRectMake(1, 1, vieww.frame.size.width-2, vieww.frame.size.height-2) _tag:self _action:@selector(dataScrolButtonClick:) _string:@"今日" _imageName:@""];
    button.backgroundColor=[UIColor colorWithRed:227.0f/255.0f green:242.0f/255.0f blue:250.0f/255.0f alpha:1];
    [button setTitleColor:[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1] forState:UIControlStateNormal];
    button.titleLabel.font=[UIFont systemFontOfSize:16];
    button.tag=Sleep_Tag;
    [Unity setControls:button Radius:4];
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(10, 65, ScreenWidth-20, 90)];
    view.backgroundColor=[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1];
    [Unity setControls:view Radius:4];
    [SleepView addSubview:view];
    UIView *view1=[[UIView alloc] initWithFrame:CGRectMake(0.5, 0.5, view.frame.size.width-1, 89)];
    [Unity setControls:view1 Radius:4];
    view1.backgroundColor=[UIColor whiteColor];
    [view addSubview:view1];
    UIView *lView=[[UIView alloc] initWithFrame:CGRectMake(40, 89/2-0.25, view.frame.size.width-1-40, 0.5)];
    lView.backgroundColor=[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1];
    [view1 addSubview:lView];
    NSArray *arrs=@[@"睡觉时间",@"起床时间"];
    for (int i=0; i<arrs.count; i++) {
        [Unity lableViewAddsuperview_superView:view1 _subViewFrame:CGRectMake(40, 12+45*i, 80, 20) _string:arrs[i] _lableFont:[UIFont systemFontOfSize:16] _lableTxtColor:[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1] _textAlignment:NSTextAlignmentLeft];
    }
    sleepLable1=[Unity lableViewAddsuperview_superView:view1 _subViewFrame:CGRectMake(view1.frame.size.width/2, 12, view1.frame.size.width/2-15, 20) _string:@"23:00" _lableFont:[UIFont systemFontOfSize:16] _lableTxtColor:COLOR_SUHONG _textAlignment:NSTextAlignmentRight];
    sleepLable2=[Unity lableViewAddsuperview_superView:view1 _subViewFrame:CGRectMake(view1.frame.size.width/2, 12+45, view1.frame.size.width/2-15, 20) _string:@"6:00" _lableFont:[UIFont systemFontOfSize:16] _lableTxtColor:COLOR_SUHONG _textAlignment:NSTextAlignmentRight];
    for (int i=0; i<2; i++) {
        UIButton *button=[Unity buttonAddsuperview_superView:view1 _subViewFrame:CGRectMake(0, 0+45*i, view1.frame.size.width, 45) _tag:self _action:@selector(dataScrolButtonClick:) _string:@"" _imageName:@""];
        button.tag=Sleep_Tag+1+i;
        button.backgroundColor=[UIColor clearColor];
    }
    UIView *textViews=[[UIView alloc] initWithFrame:CGRectMake(10, ScreenWidth/2+5, ScreenWidth-20, ScreenWidth/2-10)];
    textViews.backgroundColor=[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1];
    [Unity setControls:textViews Radius:4];
    [SleepView addSubview:textViews];
    UIView *labelView=[[UIView alloc] initWithFrame:CGRectMake(1, 1, ScreenWidth-20-2, ScreenWidth/2-10-2)];
    labelView.userInteractionEnabled=YES;
    labelView.backgroundColor=[UIColor whiteColor];
    [Unity setControls:labelView Radius:4];
    UITapGestureRecognizer* singleRecognizer;
    singleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(noteLabelSingleTap)];
    //点击的次数
    singleRecognizer.numberOfTapsRequired = 1; // 单击
    //点击的手指数
    singleRecognizer.numberOfTouchesRequired = 1;
    //给view添加一个手势监测；
    [labelView addGestureRecognizer:singleRecognizer];
    [textViews addSubview:labelView];
    noteSleepLable=[Unity lableViewAddsuperview_superView:labelView _subViewFrame:CGRectMake(10, 10, labelView.frame.size.width, 0) _string:@"填写备注信息" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1] _textAlignment:NSTextAlignmentLeft];
    CGFloat lf=[Unity getLabelHeightWithWidth:labelView.frame.size.width andDefaultHeight:0 andFontSize:14 andText:@"填写备注信息"];
    noteSleepLable.frame=CGRectMake(10, 10, labelView.frame.size.width-20, lf);
    noteSleepLable.numberOfLines=0;
    
}
#pragma mark -创建运动View
-(void)createSportView{
    UIView *SportView=[[UIView alloc] initWithFrame:CGRectMake(0+ScreenWidth*3, 10, ScreenWidth, dataTableView.frame.size.height-10)];
    SportView.backgroundColor=[UIColor whiteColor];
    [dataScrollView addSubview:SportView];
    NSArray *arr=@[@"今日",@"16:20"];
    for (int i=0; i<2; i++) {
        UIView *view=[[UIView alloc] initWithFrame:CGRectMake(10+((ScreenWidth-30)/2+10)*i, 10, (ScreenWidth-30)/2, 45)];
        view.backgroundColor=COLOR_TIANLAN;
        [Unity setControls:view Radius:4];
        [SportView addSubview:view];
        UIButton *button=[Unity buttonAddsuperview_superView:view _subViewFrame:CGRectMake(1, 1, view.frame.size.width-2, view.frame.size.height-2) _tag:self _action:@selector(dataScrolButtonClick:) _string:arr[i] _imageName:@""];
        button.backgroundColor=[UIColor colorWithRed:227.0f/255.0f green:242.0f/255.0f blue:250.0f/255.0f alpha:1];
        [button setTitleColor:[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1] forState:UIControlStateNormal];
        button.titleLabel.font=[UIFont systemFontOfSize:16];
        button.tag=Sport_Tag+i;
        [Unity setControls:button Radius:4];
    }
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(10, 65, ScreenWidth-20, 90)];
    view.backgroundColor=[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1];
    [Unity setControls:view Radius:4];
    [SportView addSubview:view];
    UIView *view1=[[UIView alloc] initWithFrame:CGRectMake(0.5, 0.5, view.frame.size.width-1, 89)];
    [Unity setControls:view1 Radius:4];
    view1.backgroundColor=[UIColor whiteColor];
    [view addSubview:view1];
    UIView *lView=[[UIView alloc] initWithFrame:CGRectMake(40, 89/2-0.25, view.frame.size.width-1-40, 0.5)];
    lView.backgroundColor=[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1];
    [view1 addSubview:lView];
    NSArray *arrs=@[@"运动类型",@"运动时长"];
    for (int i=0; i<arrs.count; i++) {
        [Unity lableViewAddsuperview_superView:view1 _subViewFrame:CGRectMake(40, 12+45*i, 80, 20) _string:arrs[i] _lableFont:[UIFont systemFontOfSize:16] _lableTxtColor:[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1] _textAlignment:NSTextAlignmentLeft];
    }
    sportLable1=[Unity lableViewAddsuperview_superView:view1 _subViewFrame:CGRectMake(view1.frame.size.width/2, 12, view1.frame.size.width/2-15, 20) _string:@"跑步" _lableFont:[UIFont systemFontOfSize:16] _lableTxtColor:COLOR_SUHONG _textAlignment:NSTextAlignmentRight];
    sportLable2=[Unity lableViewAddsuperview_superView:view1 _subViewFrame:CGRectMake(view1.frame.size.width/2, 12+45, view1.frame.size.width/2-15, 20) _string:@"30分钟" _lableFont:[UIFont systemFontOfSize:16] _lableTxtColor:COLOR_SUHONG _textAlignment:NSTextAlignmentRight];
    for (int i=0; i<2; i++) {
        UIButton *button=[Unity buttonAddsuperview_superView:view1 _subViewFrame:CGRectMake(0, 0+45*i, view1.frame.size.width, 45) _tag:self _action:@selector(dataScrolButtonClick:) _string:@"" _imageName:@""];
        button.tag=Sport_Tag+2+i;
        button.backgroundColor=[UIColor clearColor];
    }
    UIView *textViews=[[UIView alloc] initWithFrame:CGRectMake(10, ScreenWidth/2+5, ScreenWidth-20, ScreenWidth/2-10)];
    textViews.backgroundColor=[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1];
    [Unity setControls:textViews Radius:4];
    [SportView addSubview:textViews];
    UIView *labelView=[[UIView alloc] initWithFrame:CGRectMake(1, 1, ScreenWidth-20-2, ScreenWidth/2-10-2)];
    labelView.userInteractionEnabled=YES;
    labelView.backgroundColor=[UIColor whiteColor];
    [Unity setControls:labelView Radius:4];
    UITapGestureRecognizer* singleRecognizer;
    singleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(noteLabelSingleTap)];
    //点击的次数
    singleRecognizer.numberOfTapsRequired = 1; // 单击
    //点击的手指数
    singleRecognizer.numberOfTouchesRequired = 1;
    //给view添加一个手势监测；
    [labelView addGestureRecognizer:singleRecognizer];
    [textViews addSubview:labelView];
    noteSportLable=[Unity lableViewAddsuperview_superView:labelView _subViewFrame:CGRectMake(10, 10, labelView.frame.size.width, 0) _string:@"填写备注信息" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1] _textAlignment:NSTextAlignmentLeft];
    CGFloat lf=[Unity getLabelHeightWithWidth:labelView.frame.size.width andDefaultHeight:0 andFontSize:14 andText:@"填写备注信息"];
    noteSportLable.frame=CGRectMake(10, 10, labelView.frame.size.width-20, lf);
    noteSportLable.numberOfLines=0;
    
}
#pragma mark -创建血糖View
-(void)createBloodSugarView{
    UIView *BloodSugarView=[[UIView alloc] initWithFrame:CGRectMake(0+ScreenWidth*4, 10, ScreenWidth, dataTableView.frame.size.height-10)];
    BloodSugarView.backgroundColor=[UIColor whiteColor];
    [dataScrollView addSubview:BloodSugarView];
    UIView *vieww=[[UIView alloc] initWithFrame:CGRectMake(10, 10, (ScreenWidth-20), 45)];
    vieww.backgroundColor=COLOR_TIANLAN;
    [Unity setControls:vieww Radius:4];
    [BloodSugarView addSubview:vieww];
    UIButton *button=[Unity buttonAddsuperview_superView:vieww _subViewFrame:CGRectMake(1, 1, vieww.frame.size.width-2, vieww.frame.size.height-2) _tag:self _action:@selector(dataScrolButtonClick:) _string:@"今日" _imageName:@""];
    button.backgroundColor=[UIColor colorWithRed:227.0f/255.0f green:242.0f/255.0f blue:250.0f/255.0f alpha:1];
    [button setTitleColor:[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1] forState:UIControlStateNormal];
    button.titleLabel.font=[UIFont systemFontOfSize:16];
    button.tag=BloodSugar_Tag;
    [Unity setControls:button Radius:4];
    NSArray *naArr=@[@"早餐",@"午餐",@"晚餐"];
    for (int i=0; i<naArr.count; i++) {
        UIView *view=[[UIView alloc] initWithFrame:CGRectMake(10+((ScreenWidth-30)/3+5)*i, 65, (ScreenWidth-30)/3, 40)];
        [BloodSugarView addSubview:view];
        [Unity setControls:view Radius:4];
        UIButton *button=[Unity buttonAddsuperview_superView:view _subViewFrame:CGRectMake(0.5, 0.5, view.frame.size.width-1, view.frame.size.height-1) _tag:self _action:@selector(foodButtonClick:) _string:naArr[i] _imageName:@""];
        if (i==0) {
            foodString=@"早餐";
            [button setTitleColor:COLOR_SUHONG forState:UIControlStateNormal];
            view.backgroundColor=COLOR_SUHONG;
            view.tag=BloodSugarBreakfast_Tag+100;
            button.backgroundColor=[UIColor colorWithRed:255.0f/255.0f green:237.0f/255.0f blue:236.0f/255.0f alpha:1];
            button.tag=BloodSugarBreakfast_Tag;
        }else{
            [button setTitleColor:[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1] forState:UIControlStateNormal];
            view.backgroundColor=[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1];
            button.backgroundColor=[UIColor whiteColor];
            if (i==1) {
                button.tag=BloodSugarLunch_Tag;
                view.tag=BloodSugarLunch_Tag+100;
            }else{
                button.tag=BloodSugarDinner_Tag;
                view.tag=BloodSugarDinner_Tag+100;
            }
        }
        button.titleLabel.font=[UIFont systemFontOfSize:16];
        [Unity setControls:button Radius:4];
    }
    
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(10, 65+50, ScreenWidth-20, 90)];
    view.backgroundColor=COLOR_SUHONG;
    [Unity setControls:view Radius:4];
    [BloodSugarView addSubview:view];
    UIView *view1=[[UIView alloc] initWithFrame:CGRectMake(0.5, 0.5, view.frame.size.width-1, 89)];
    [Unity setControls:view1 Radius:4];
    view1.backgroundColor=[UIColor colorWithRed:255.0f/255.0f green:237.0f/255.0f blue:236.0f/255.0f alpha:1];;
    [view addSubview:view1];
    UIView *lView=[[UIView alloc] initWithFrame:CGRectMake(40, 89/2-0.25, view.frame.size.width-1-40, 0.5)];
    lView.backgroundColor=[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1];
    [view1 addSubview:lView];
    NSArray *arrs=@[@"餐前",@"餐后"];
    for (int i=0; i<arrs.count; i++) {
        [Unity lableViewAddsuperview_superView:view1 _subViewFrame:CGRectMake(40, 12+45*i, 80, 20) _string:arrs[i] _lableFont:[UIFont systemFontOfSize:16] _lableTxtColor:[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1] _textAlignment:NSTextAlignmentLeft];
    }
#pragma mark -早餐午餐晚餐的值现在这么写
    bloodSugarBreakfastString1=@"4.8mmol/L";
    bloodSugarBreakfastString2=@"4.8mmol/L";
    bloodSugarDinnerString1=@"4.8mmol/L";
    bloodSugarDinnerString2=@"4.8mmol/L";
    bloodSugarLunchString1=@"4.8mmol/L";
    bloodSugarLunchString2=@"4.8mmol/L";
    beforeFoodLabel=[Unity lableViewAddsuperview_superView:view1 _subViewFrame:CGRectMake(view1.frame.size.width/2, 12, view1.frame.size.width/2-15, 20) _string:bloodSugarBreakfastString1 _lableFont:[UIFont systemFontOfSize:16] _lableTxtColor:COLOR_SUHONG _textAlignment:NSTextAlignmentRight];
    afterFoodLabel=[Unity lableViewAddsuperview_superView:view1 _subViewFrame:CGRectMake(view1.frame.size.width/2, 12+45, view1.frame.size.width/2-15, 20) _string:bloodSugarBreakfastString2 _lableFont:[UIFont systemFontOfSize:16] _lableTxtColor:COLOR_SUHONG _textAlignment:NSTextAlignmentRight];
    for (int i=0; i<2; i++) {
        UIButton *button=[Unity buttonAddsuperview_superView:view1 _subViewFrame:CGRectMake(0, 0+45*i, view1.frame.size.width, 45) _tag:self _action:@selector(dataScrolButtonClick:) _string:@"" _imageName:@""];
        button.tag=BloodSugar_Tag+1+i;
        button.backgroundColor=[UIColor clearColor];
    }
    UIView *textViews=[[UIView alloc] initWithFrame:CGRectMake(10, view.frame.size.height+view.frame.origin.y+10, ScreenWidth-20, ScreenWidth/2-10)];
    textViews.backgroundColor=[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1];
    [Unity setControls:textViews Radius:4];
    [BloodSugarView addSubview:textViews];
    UIView *labelView=[[UIView alloc] initWithFrame:CGRectMake(1, 1, ScreenWidth-20-2, ScreenWidth/2-10-2)];
    labelView.userInteractionEnabled=YES;
    labelView.backgroundColor=[UIColor whiteColor];
    [Unity setControls:labelView Radius:4];
    UITapGestureRecognizer* singleRecognizer;
    singleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(noteLabelSingleTap)];
    //点击的次数
    singleRecognizer.numberOfTapsRequired = 1; // 单击
    //点击的手指数
    singleRecognizer.numberOfTouchesRequired = 1;
    //给view添加一个手势监测；
    [labelView addGestureRecognizer:singleRecognizer];
    [textViews addSubview:labelView];
    noteBloodSugarLable=[Unity lableViewAddsuperview_superView:labelView _subViewFrame:CGRectMake(10, 10, labelView.frame.size.width, 0) _string:@"填写备注信息" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1] _textAlignment:NSTextAlignmentLeft];
    CGFloat lf=[Unity getLabelHeightWithWidth:labelView.frame.size.width andDefaultHeight:0 andFontSize:14 andText:@"填写备注信息"];
    noteBloodSugarLable.frame=CGRectMake(10, 10, labelView.frame.size.width-20, lf);
    noteBloodSugarLable.numberOfLines=0;
}
#pragma mark -早餐午餐晚餐点击事件
-(void)foodButtonClick:(UIButton *)button{
    UIView *view1=(UIView *)[self.view viewWithTag:BloodSugarBreakfast_Tag+100];
    UIView *view2=(UIView *)[self.view viewWithTag:BloodSugarLunch_Tag+100];
    UIView *view3=(UIView *)[self.view viewWithTag:BloodSugarDinner_Tag+100];
    UIButton *button1=(UIButton *)[self.view viewWithTag:BloodSugarBreakfast_Tag];
    UIButton *button2=(UIButton *)[self.view viewWithTag:BloodSugarLunch_Tag];
    UIButton *button3=(UIButton *)[self.view viewWithTag:BloodSugarDinner_Tag];
    switch (button.tag) {
        case BloodSugarBreakfast_Tag:
        {
            foodString=@"早餐";
            beforeFoodLabel.text=bloodSugarBreakfastString1;
            afterFoodLabel.text=bloodSugarBreakfastString2;
            view1.backgroundColor=COLOR_SUHONG;
            view2.backgroundColor=[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1];
            view3.backgroundColor=[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1];
            [button1 setTitleColor:COLOR_SUHONG forState:UIControlStateNormal];
            [button2 setTitleColor:[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1] forState:UIControlStateNormal];
            [button3 setTitleColor:[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1] forState:UIControlStateNormal];
            button1.backgroundColor=[UIColor colorWithRed:255.0f/255.0f green:237.0f/255.0f blue:236.0f/255.0f alpha:1];
            button2.backgroundColor=[UIColor whiteColor];
            button3.backgroundColor=[UIColor whiteColor];
        }
            break;
        case BloodSugarLunch_Tag:
        {
            foodString=@"午餐";
            beforeFoodLabel.text=bloodSugarLunchString1;
            afterFoodLabel.text=bloodSugarLunchString2;
            view1.backgroundColor=[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1];
            view2.backgroundColor=COLOR_SUHONG;
            view3.backgroundColor=[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1];
            [button1 setTitleColor:[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1] forState:UIControlStateNormal];
            [button2 setTitleColor:COLOR_SUHONG forState:UIControlStateNormal];
            [button3 setTitleColor:[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1] forState:UIControlStateNormal];
            button1.backgroundColor=[UIColor whiteColor];
            button2.backgroundColor=[UIColor colorWithRed:255.0f/255.0f green:237.0f/255.0f blue:236.0f/255.0f alpha:1];
            button3.backgroundColor=[UIColor whiteColor];
        }
            break;
        case BloodSugarDinner_Tag:
        {
            foodString=@"晚餐";
            beforeFoodLabel.text=bloodSugarDinnerString1;
            afterFoodLabel.text=bloodSugarDinnerString2;
            view1.backgroundColor=[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1];
            view2.backgroundColor=[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1];
            view3.backgroundColor=COLOR_SUHONG;
            [button1 setTitleColor:[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1] forState:UIControlStateNormal];
            [button2 setTitleColor:[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1] forState:UIControlStateNormal];
            [button3 setTitleColor:COLOR_SUHONG forState:UIControlStateNormal];
            button1.backgroundColor=[UIColor whiteColor];
            button2.backgroundColor=[UIColor whiteColor];
            button3.backgroundColor=[UIColor colorWithRed:255.0f/255.0f green:237.0f/255.0f blue:236.0f/255.0f alpha:1];
        }
            break;
        default:
            break;
    }
}
#pragma mark -创建血压View
-(void)createBloodPressureView{
    UIView *BloodPressureView=[[UIView alloc] initWithFrame:CGRectMake(0+ScreenWidth*5, 10, ScreenWidth, dataTableView.frame.size.height-10)];
    BloodPressureView.backgroundColor=[UIColor whiteColor];
    [dataScrollView addSubview:BloodPressureView];
    NSArray *arr=@[@"今日",@"16:20"];
    for (int i=0; i<2; i++) {
        UIView *view=[[UIView alloc] initWithFrame:CGRectMake(10+((ScreenWidth-30)/2+10)*i, 10, (ScreenWidth-30)/2, 45)];
        view.backgroundColor=COLOR_TIANLAN;
        [Unity setControls:view Radius:4];
        [BloodPressureView addSubview:view];
        UIButton *button=[Unity buttonAddsuperview_superView:view _subViewFrame:CGRectMake(1, 1, view.frame.size.width-2, view.frame.size.height-2) _tag:self _action:@selector(dataScrolButtonClick:) _string:arr[i] _imageName:@""];
        button.backgroundColor=[UIColor colorWithRed:227.0f/255.0f green:242.0f/255.0f blue:250.0f/255.0f alpha:1];
        [button setTitleColor:[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1] forState:UIControlStateNormal];
        button.titleLabel.font=[UIFont systemFontOfSize:16];
        button.tag=BloodPressure_Tag+i;
        [Unity setControls:button Radius:4];
    }
    UIView *addView=[[UIView alloc] initWithFrame:CGRectMake(10, 65, ScreenWidth-20,ScreenWidth/2-65-10)];
    addView.backgroundColor=[UIColor colorWithRed:253.0f/255.0f green:215.0f/255.0f blue:122.0f/255.0f alpha:1];
    [Unity setControls:addView Radius:4];
    [BloodPressureView addSubview:addView];
    UIButton *addButton=[Unity buttonAddsuperview_superView:addView _subViewFrame:CGRectMake(1, 1, ScreenWidth-20-2,ScreenWidth/2-65-10-2) _tag:self _action:@selector(dataScrolButtonClick:) _string:@"+" _imageName:@""];
    addButton.backgroundColor=[UIColor colorWithRed:255.0f/255.0f green:250.0f/255.0f blue:238.0f/255.0f alpha:1];
    [addButton setTitleColor:[UIColor colorWithRed:253.0f/255.0f green:215.0f/255.0f blue:122.0f/255.0f alpha:1] forState:UIControlStateNormal];
    addButton.tag=BloodPressure_Tag+2;
    addButton.titleLabel.font=[UIFont boldSystemFontOfSize:28];
    [Unity setControls:addButton Radius:4];
    UIView *textViews=[[UIView alloc] initWithFrame:CGRectMake(10, ScreenWidth/2, ScreenWidth-20, ScreenWidth/2-10)];
    textViews.backgroundColor=[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1];
    [Unity setControls:textViews Radius:4];
    [BloodPressureView addSubview:textViews];
    UIView *labelView=[[UIView alloc] initWithFrame:CGRectMake(1, 1, ScreenWidth-20-2, ScreenWidth/2-10-2)];
    labelView.userInteractionEnabled=YES;
    labelView.backgroundColor=[UIColor whiteColor];
    [Unity setControls:labelView Radius:4];
    UITapGestureRecognizer* singleRecognizer;
    singleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(noteLabelSingleTap)];
    //点击的次数
    singleRecognizer.numberOfTapsRequired = 1; // 单击
    //点击的手指数
    singleRecognizer.numberOfTouchesRequired = 1;
    //给view添加一个手势监测；
    [labelView addGestureRecognizer:singleRecognizer];
    [textViews addSubview:labelView];
    noteBloodPressureLable=[Unity lableViewAddsuperview_superView:labelView _subViewFrame:CGRectMake(10, 10, labelView.frame.size.width, 0) _string:@"填写备注信息" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1] _textAlignment:NSTextAlignmentLeft];
    CGFloat lf=[Unity getLabelHeightWithWidth:labelView.frame.size.width andDefaultHeight:0 andFontSize:14 andText:@"填写备注信息"];
    noteBloodPressureLable.frame=CGRectMake(10, 10, labelView.frame.size.width-20, lf);
    noteBloodPressureLable.numberOfLines=0;
    
}
//-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
//    NSLog(@"卡奴一看")
//}
-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 完整的UITouch事件调试方法
    NSLog(@"触摸中断");
    for (UITouch *touch in touches) {
        NSLog(@"00000000%@", touch);
    }
}
#pragma mark -创建血脂View
-(void)createLipidView{
    UIView *LipidView=[[UIView alloc] initWithFrame:CGRectMake(0+ScreenWidth*6, 10, ScreenWidth, dataTableView.frame.size.height-10)];
    LipidView.backgroundColor=[UIColor whiteColor];
    [dataScrollView addSubview:LipidView];
    NSArray *arr=@[@"今日",@"16:20"];
    for (int i=0; i<2; i++) {
        UIView *view=[[UIView alloc] initWithFrame:CGRectMake(10+((ScreenWidth-30)/2+10)*i, 10, (ScreenWidth-30)/2, 45)];
        view.backgroundColor=COLOR_TIANLAN;
        [Unity setControls:view Radius:4];
        [LipidView addSubview:view];
        UIButton *button=[Unity buttonAddsuperview_superView:view _subViewFrame:CGRectMake(1, 1, view.frame.size.width-2, view.frame.size.height-2) _tag:self _action:@selector(dataScrolButtonClick:) _string:arr[i] _imageName:@""];
        button.backgroundColor=[UIColor colorWithRed:227.0f/255.0f green:242.0f/255.0f blue:250.0f/255.0f alpha:1];
        [button setTitleColor:[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1] forState:UIControlStateNormal];
        button.titleLabel.font=[UIFont systemFontOfSize:16];
        button.tag=Lipid_Tag+i;
        [Unity setControls:button Radius:4];
    }
    UIView *addView=[[UIView alloc] initWithFrame:CGRectMake(10, 65, ScreenWidth-20,ScreenWidth/2-65-10)];
    addView.backgroundColor=[UIColor colorWithRed:253.0f/255.0f green:215.0f/255.0f blue:122.0f/255.0f alpha:1];
    [Unity setControls:addView Radius:4];
    [LipidView addSubview:addView];
    UIButton *addButton=[Unity buttonAddsuperview_superView:addView _subViewFrame:CGRectMake(1, 1, ScreenWidth-20-2,ScreenWidth/2-65-10-2) _tag:self _action:@selector(dataScrolButtonClick:) _string:@"+" _imageName:@""];
    addButton.backgroundColor=[UIColor colorWithRed:255.0f/255.0f green:250.0f/255.0f blue:238.0f/255.0f alpha:1];
    [addButton setTitleColor:[UIColor colorWithRed:253.0f/255.0f green:215.0f/255.0f blue:122.0f/255.0f alpha:1] forState:UIControlStateNormal];
    addButton.tag=Lipid_Tag+2;
    addButton.titleLabel.font=[UIFont boldSystemFontOfSize:28];
    [Unity setControls:addButton Radius:4];
    UIView *textViews=[[UIView alloc] initWithFrame:CGRectMake(10, ScreenWidth/2, ScreenWidth-20, ScreenWidth/2-10)];
    textViews.backgroundColor=[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1];
    [Unity setControls:textViews Radius:4];
    [LipidView addSubview:textViews];
    UIView *labelView=[[UIView alloc] initWithFrame:CGRectMake(1, 1, ScreenWidth-20-2, ScreenWidth/2-10-2)];
    labelView.userInteractionEnabled=YES;
    labelView.backgroundColor=[UIColor whiteColor];
    [Unity setControls:labelView Radius:4];
    UITapGestureRecognizer* singleRecognizer;
    singleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(noteLabelSingleTap)];
    //点击的次数
    singleRecognizer.numberOfTapsRequired = 1; // 单击
    //点击的手指数
    singleRecognizer.numberOfTouchesRequired = 1;
    //给view添加一个手势监测；
    [labelView addGestureRecognizer:singleRecognizer];
    [textViews addSubview:labelView];
    noteLipidLable=[Unity lableViewAddsuperview_superView:labelView _subViewFrame:CGRectMake(10, 10, labelView.frame.size.width, 0) _string:@"填写备注信息" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1] _textAlignment:NSTextAlignmentLeft];
    CGFloat lf=[Unity getLabelHeightWithWidth:labelView.frame.size.width andDefaultHeight:0 andFontSize:14 andText:@"填写备注信息"];
    noteLipidLable.frame=CGRectMake(10, 10, labelView.frame.size.width, lf);
    noteLipidLable.numberOfLines=0;
    
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
