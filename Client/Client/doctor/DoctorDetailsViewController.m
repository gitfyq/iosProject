//
//  DoctorDetailsViewController.m
//  Client
//
//  Created by apple on 15/6/12.
//  Copyright (c) 2015年 CC. All rights reserved.
//

#import "DoctorDetailsViewController.h"
#import "DoctorDetailsCell.h"
#import "DoctorDetailsModel.h"


@interface DoctorDetailsViewController ()
{
    UIView *headView;
    UIView *foodView;
    UIButton *YyButton;
    UILabel *MnLabel;
    UIImageView *TxImage;
    
    //医生姓名
    UILabel *truename;
    //医院
    UILabel *company;
    //科室
    UILabel *department;
    //职称
    UILabel *job_pos;
    
}

@end

@implementation DoctorDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.translucent = YES;
    self.title = self.DcName;
    [self addItem:@"" imageName:@"jiantou" actoion:@selector(backClick) position:LEFT_BAR_BUTTON];
    
    foodView = [[UIView alloc] initWithFrame:CGRectMake(0, KH - 41, KW, 40)];
    foodView.backgroundColor = [UIColor colorWithRed:1/255.0f green:193/255.0f blue:243/255.0f alpha:1];
    [self.view addSubview:foodView];
    YyButton = [Unity buttonAddsuperview_superView:foodView _subViewFrame:CGRectMake(KW - 90, 5, 70, 30) _tag:self _action:@selector(YButton:) _string:@"预约" _imageName:@""];
    [YyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    YyButton.layer.cornerRadius = 4;
    [YyButton setBackgroundColor:[UIColor redColor]];
  
    UIImageView *mImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 20, 20)];
    mImage.image = [UIImage imageNamed:@"咨询价"];
    [foodView addSubview:mImage];
    MnLabel = [Unity lableViewAddsuperview_superView:foodView _subViewFrame:CGRectMake(CGRectGetMaxX(mImage.frame)+3, 10, 120, 20) _string:@"咨询价:650元" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor whiteColor] _textAlignment:NSTextAlignmentLeft];
    
    
}
-(void)YButton:(UIButton *)btn{
    
}
-(void)backClick{
    
    [self.navigationController popViewControllerAnimated:YES];
}

//网络请求
-(void)loading{
    NSString *token = [SGSaveFile getObjectFromSystemWithKey:@"token"];
    [SE_Request get_Mydoctortoken:token page:@"1" kw:@"" finish:^(AFHTTPRequestOperation *operation, id responseObject) {
        
    } error:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

#pragma mark - Table view data source
#pragma mark 分区数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

#pragma mark 行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 130;
    }else if (indexPath.section == 1){
        return 80;
    }else{
        return 180;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}



#pragma mark 行的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *DoctorDetailsCellid=@"DoctorDetailsCellID";
    DoctorDetailsCell *cell = [tableView dequeueReusableCellWithIdentifier:DoctorDetailsCellid];
    if (!cell) {
        cell = [[DoctorDetailsCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:DoctorDetailsCellid];
    }
    if (indexPath.row==0) {
        //简介
        cell.styleStr = @"1";

    }else if(indexPath.row==1){
        //擅长
        cell.styleStr = @"2";
        
    }else {
        //用户评价
        cell.styleStr = @"3";
    }
//    cell.CellTypeBlock = ^(NSString *type){
//        [tableView reloadData];
//    };
//    [cell selectCellStyle];
    
    cell.selectionStyle = UITableViewCellAccessoryNone;
    
    headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KW, 180)];
    UIImageView *headImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, KW, 160)];
    headImage.image = [UIImage imageNamed:@"bg蓝"];
    headImage.userInteractionEnabled = YES;
    [headView addSubview:headImage];
    
    TxImage = [[UIImageView alloc] initWithFrame:CGRectMake(KW/2-30, 30, 60, 60)];
    TxImage.image = [UIImage imageNamed:@"头像"];
    TxImage.layer.cornerRadius = 30;
    [headView addSubview:TxImage];
    
    truename = [Unity lableViewAddsuperview_superView:headView _subViewFrame:CGRectMake(KW/2 - 80, CGRectGetMaxY(TxImage.frame)+5, 80, 20) _string:@"朱小亮" _lableFont:[UIFont systemFontOfSize:16] _lableTxtColor:[UIColor whiteColor] _textAlignment:NSTextAlignmentRight];
    
    job_pos = [Unity lableViewAddsuperview_superView:headView _subViewFrame:CGRectMake(KW/2 +2, CGRectGetMaxY(TxImage.frame)+5, 80, 20) _string:@"主治医生" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor whiteColor] _textAlignment:NSTextAlignmentLeft];
    
    company = [Unity lableViewAddsuperview_superView:headView _subViewFrame:CGRectMake(KW/2 - 90, CGRectGetMaxY(job_pos.frame)+5, 120, 20) _string:@"北京解放军总医院" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor whiteColor] _textAlignment:NSTextAlignmentRight];
    
    department = [Unity lableViewAddsuperview_superView:headView _subViewFrame:CGRectMake(KW/2 +40, CGRectGetMaxY(job_pos.frame)+5, 80, 20) _string:@"心脏内科" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor whiteColor] _textAlignment:NSTextAlignmentLeft];
    
    
    
    
    tableView.tableHeaderView = headView;
    
    
   
    
    
    return cell;
}

#pragma mark cell的点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    DoctorDetailsViewController *ddvc = [[DoctorDetailsViewController alloc] init];
//    ddvc.DcName = @"朱小光";
//    [self.navigationController pushViewController:ddvc animated:YES];
    
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
