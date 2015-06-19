//
//  DoctorViewController.m
//  Client
//
//  Created by apple on 15/6/1.
//  Copyright (c) 2015年 CC. All rights reserved.
//

#import "DoctorViewController.h"
#import "DoctorModel.h"
#import "DoctorCell.h"
#import "DoctorDetailsViewController.h"
#import "Home_OrderViewController.h"

@interface DoctorViewController ()<UITableViewDataSource,UITableViewDelegate>{
    UITableView *tableView;
    NSMutableArray *dataArray;
    
    UIButton *YyButton;
}

@end

@implementation DoctorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"医生";
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor =  [UIColor colorWithRed:245/255.0f green:245/255.0f blue:245/255.0f alpha:1.000];
    
    dataArray = [[NSMutableArray alloc] init];
    
    [self loading];
    
    [self createTableView];
    
    
}


//创建TableView
-(void)createTableView{
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-49) style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor colorWithRed:241/255.0f green:241/255.0f  blue:241/255.0f  alpha:1];
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:tableView];
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
    return 1;
}

#pragma mark 行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 130;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}



#pragma mark 行的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *userid=@"userID";
    DoctorCell *cell = [tableView dequeueReusableCellWithIdentifier:userid];
    if (!cell) {
        cell = [[DoctorCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:userid];
    }
    cell.selectionStyle = UITableViewCellAccessoryNone;
    // DoctorModel *model=dataArray[indexPath.row];
    //    [cell.pic setImageWithURL:[NSURL URLWithString:model.pic]];
    //    NSLog(@"%@",model.pic);
    cell.truename.text=@"朱小亮";
    cell.company.text=@"北京解放总医院";
    cell.department.text=@"心脏内科";
    cell.job_pos.text=@"主治医生";
    cell.price.text = @"咨询价:60元";
    cell.yyButton.tag=2000+indexPath.row;
    cell.doctorButtonTag=^(NSInteger buttonTag){
        NSLog(@"button——tag:%li",buttonTag);
        NSLog(@"yyyy%@",cell.job_pos.text);
        Home_OrderViewController *Hovc = [[Home_OrderViewController alloc] init];
        [self.navigationController pushViewController:Hovc animated:YES];
    };
    
    
    return cell;
}

#pragma mark cell的点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DoctorDetailsViewController *ddvc = [[DoctorDetailsViewController alloc] init];
    ddvc.hidesBottomBarWhenPushed = YES;
    ddvc.DcName = @"朱小光";
    [self.navigationController pushViewController:ddvc animated:YES];
    
}
//
-(void)YyButton:(UIButton *)btn{
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
