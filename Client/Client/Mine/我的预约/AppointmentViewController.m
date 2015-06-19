//
//  AppointmentViewController.m
//  Client
//
//  Created by apple on 15/6/5.
//  Copyright (c) 2015年 CC. All rights reserved.
//

#import "AppointmentViewController.h"
#import "AppointmentCell.h"
#import "AppointmentModel.h"


@interface AppointmentViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *AppointmenTableView;
}

@end

@implementation AppointmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我的预约";
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor =  [UIColor colorWithRed:245/255.0f green:245/255.0f blue:245/255.0f alpha:1.000];
    [self createTabelView];
}
-(void)createTabelView{
    AppointmenTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KW, KH - 49) style:UITableViewStyleGrouped];
    AppointmenTableView.delegate = self;
    AppointmenTableView.dataSource = self;
    AppointmenTableView.backgroundColor = [UIColor colorWithRed:241/255.0f green:241/255.0f  blue:241/255.0f  alpha:1];
    AppointmenTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:AppointmenTableView];

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellId = @"cellId";
    AppointmentCell *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:cellId];
    if (!cell) {
        cell = [[AppointmentCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
        
    }
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    cell.accessoryType = UITableViewCellAccessoryNone;
    
    cell.truename.text=@"朱小亮";
    cell.company.text=@"北京解放总医院";
    cell.department.text=@"心脏内科";
    cell.job_pos.text=@"主治医生";
    cell.price.text = @"实付:60元";
    cell.Times.text = @"2015-04-12 14:00";
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
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
