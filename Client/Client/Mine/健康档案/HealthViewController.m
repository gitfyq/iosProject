//
//  HealthViewController.m
//  Client
//
//  Created by apple on 15/6/9.
//  Copyright (c) 2015年 CC. All rights reserved.
//

#import "HealthViewController.h"
#import "Near_PharmacyTableViewCell.h"
#import "SituationCell.h"
#import "MedicalCell.h"
#import "LifeCell.h"

@interface HealthViewController ()
{
    UILabel *SituationLabel;
    UILabel *MedicalLable;
    UILabel *LifeLabel;
    
    UILabel *wlineLabel1;
    UILabel *wlineLabel2;
    UILabel *wlineLabel3;
    
    UIScrollView *dataScrollView;
    UITableView *SituationTableView;
    UITableView *MedicalTableView;
    UITableView *LifeTableView;
    
}

@end

@implementation HealthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addTitleView:@"健康档案"];
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
    dataScrollView.contentSize = CGSizeMake(ScreenWidth*3, ScreenHeight-64-39.5-100);
    [self.view addSubview:dataScrollView];
    SituationTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, dataScrollView.frame.size.height) style:UITableViewStyleGrouped];
    SituationTableView.delegate=self;
    SituationTableView.dataSource=self;
    [dataScrollView addSubview:SituationTableView];
    MedicalTableView=[[UITableView alloc] initWithFrame:CGRectMake(ScreenWidth, 0, ScreenWidth, dataScrollView.frame.size.height) style:UITableViewStyleGrouped];
    MedicalTableView.delegate=self;
    MedicalTableView.dataSource=self;
    [dataScrollView addSubview:MedicalTableView];
    
    LifeTableView=[[UITableView alloc] initWithFrame:CGRectMake(ScreenWidth*2, 0, ScreenWidth, dataScrollView.frame.size.height) style:UITableViewStyleGrouped];
    LifeTableView.delegate=self;
    LifeTableView.dataSource=self;
    [dataScrollView addSubview:LifeTableView];
    
    
}
#pragma mark 行的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (tableView == SituationTableView) {
        NSString *cellId = @"SituationcellId";
        UITableViewCell *cell = [SituationTableView dequeueReusableCellWithIdentifier:cellId];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
        }
        NSArray *Sarray = @[@"体温",@"呼吸频率",@"身高",@"脉率",@"血压",@"体重"];
        cell.textLabel.text = Sarray[indexPath.row];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if(tableView == MedicalTableView){
        NSString *cellIdM = @"MedicalcellId";
        UITableViewCell *cellM = [MedicalTableView dequeueReusableCellWithIdentifier:cellIdM];
        if (!cellM) {
            cellM = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdM];
        }
        if (indexPath.section == 0) {
            cellM.textLabel.text = @"既往史";
        }else if (indexPath.section == 1){
            cellM.textLabel.text = @"家族史";
        }else if(indexPath.section == 2){
            cellM.textLabel.text = @"遗传病史";
        }else{
            cellM.textLabel.text = @"残疾情况";
        }

        cellM.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cellM.selectionStyle = UITableViewCellSelectionStyleNone;
        return cellM;
    }else{
        NSString *cellIdL = @"LifecellId";
        UITableViewCell *cellL = [LifeTableView dequeueReusableCellWithIdentifier:cellIdL];
        if (!cellL) {
            cellL = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdL];
        }
        if (indexPath.section == 0) {
            cellL.textLabel.text = @"体育锻炼";
        }else if (indexPath.section == 1){
            cellL.textLabel.text = @"饮食习惯";
        }else if(indexPath.section == 2){
            cellL.textLabel.text = @"吸烟情况";
        }else{
            cellL.textLabel.text = @"饮酒情况";
        }
        
        cellL.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cellL.selectionStyle = UITableViewCellSelectionStyleNone;
        return cellL;
    }
}
#pragma mark 分区数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == SituationTableView) {
        return 1;
    }else if(tableView == MedicalTableView){
        return 4;
    }else{
        return 4;
    }
}
#pragma mark 行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == SituationTableView) {
        return 6;
    }else if(tableView == MedicalTableView){
        return 1;
    }else{
        return 1;
    }
    
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
    if (tableView==SituationTableView) {
        return 10.0f;
    }else{
        if (section==0) {
            return 10.0f;
        }else{
            return 1.0f;
        }
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (tableView==SituationTableView) {
        return 0;
    }else{
        return 9.0f;
    }
}
-(void)showUI{
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 39.5)];
    view.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:view];
    SituationLabel=[Unity lableViewAddsuperview_superView:view _subViewFrame:CGRectMake(0, 0, (ScreenWidth-0.25)/3, 38) _string:@"一般情况" _lableFont:[UIFont systemFontOfSize:16] _lableTxtColor:COLOR_SUHONG _textAlignment:NSTextAlignmentCenter];
    SituationLabel.userInteractionEnabled=YES;
    // 单击的 Recognizer
    UITapGestureRecognizer* SituationLabelSingleRecognizer;
    SituationLabelSingleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(mapLabelSingleTap)];
    //点击的次数
    SituationLabelSingleRecognizer.numberOfTapsRequired = 1; // 单击
    //点击的手指数
    SituationLabelSingleRecognizer.numberOfTouchesRequired = 1;
    //给view添加一个手势监测；
    [SituationLabel addGestureRecognizer:SituationLabelSingleRecognizer];
    wlineLabel1=[[UILabel alloc] initWithFrame:CGRectMake(0, 38, ScreenWidth/3, 1.5)];
    wlineLabel1.backgroundColor=COLOR_SUHONG;
    [view addSubview:wlineLabel1];

    
    MedicalLable=[Unity lableViewAddsuperview_superView:view _subViewFrame:CGRectMake((ScreenWidth-0.25)/3+0.25, 0, (ScreenWidth-0.25)/3, 38) _string:@"病史" _lableFont:[UIFont systemFontOfSize:16] _lableTxtColor:COLOR_SHENHUI _textAlignment:NSTextAlignmentCenter];
    MedicalLable.userInteractionEnabled=YES;
    // 单击的 Recognizer
    UITapGestureRecognizer* MedicalLableSingleRecognizer;
    MedicalLableSingleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(listLableSingleTap)];
    //点击的次数
    MedicalLableSingleRecognizer.numberOfTapsRequired = 1; // 单击
    //点击的手指数
    MedicalLableSingleRecognizer.numberOfTouchesRequired = 1;
    //给view添加一个手势监测；
    [MedicalLable addGestureRecognizer:MedicalLableSingleRecognizer];
    wlineLabel2=[[UILabel alloc] initWithFrame:CGRectMake((ScreenWidth-0.5)/3, 9, 0.5, 20)];
    wlineLabel2.backgroundColor=[UIColor grayColor];
    [view addSubview:wlineLabel2];
    
    
    LifeLabel=[Unity lableViewAddsuperview_superView:view _subViewFrame:CGRectMake(CGRectGetMaxX(MedicalLable.frame)+0.5, 0, (ScreenWidth)/3, 38) _string:@"生活方式" _lableFont:[UIFont systemFontOfSize:16] _lableTxtColor:COLOR_SHENHUI _textAlignment:NSTextAlignmentCenter];
    LifeLabel.userInteractionEnabled=YES;
    // 单击的 Recognizer
    UITapGestureRecognizer* LifeLableSingleRecognizer;
    LifeLableSingleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(lifeLableSingleTap)];
    //点击的次数
    LifeLableSingleRecognizer.numberOfTapsRequired = 1; // 单击
    //点击的手指数
    LifeLableSingleRecognizer.numberOfTouchesRequired = 1;
    //给view添加一个手势监测；
    [LifeLabel addGestureRecognizer:LifeLableSingleRecognizer];
    wlineLabel3=[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(MedicalLable.frame)+0.5, 9, 0.5, 20)];
    wlineLabel3.backgroundColor=[UIColor grayColor];
    [view addSubview:wlineLabel3];
   
}
-(void)mapLabelSingleTap{
    [dataScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
}
-(void)listLableSingleTap{
    [dataScrollView setContentOffset:CGPointMake(ScreenWidth, 0) animated:YES];
}

-(void)lifeLableSingleTap{
     [dataScrollView setContentOffset:CGPointMake(ScreenWidth*2, 0) animated:YES];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
{
        NSLog(@" scrollViewDidScroll");
    NSLog(@"ContentOffset  x is  %f,yis %f",scrollView.contentOffset.x,scrollView.contentOffset.y);
    wlineLabel1.frame=CGRectMake((scrollView.contentOffset.x)/3, 38, ScreenWidth/3, 1.5);
    if (scrollView.contentOffset.x<KW) {
        SituationLabel.textColor=COLOR_SUHONG;
        MedicalLable.textColor=COLOR_SHENHUI;
        LifeLabel.textColor =COLOR_SHENHUI;
    }else if(KW<=scrollView.contentOffset.x&&scrollView.contentOffset.x<KW*2){
        SituationLabel.textColor=COLOR_SHENHUI;
        MedicalLable.textColor=COLOR_SUHONG;
        LifeLabel.textColor =COLOR_SHENHUI;
    }else{
        SituationLabel.textColor=COLOR_SHENHUI;
        MedicalLable.textColor=COLOR_SHENHUI;
        LifeLabel.textColor =COLOR_SUHONG;
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
