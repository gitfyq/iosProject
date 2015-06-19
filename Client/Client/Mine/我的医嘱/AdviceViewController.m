//
//  AdviceViewController.m
//  Client
//
//  Created by apple on 15/6/10.
//  Copyright (c) 2015年 CC. All rights reserved.
//

#import "AdviceViewController.h"
#import "AdviceCell.h"
#import "AdviceModel.h"
#import "AdviceDetailsViewController.h"

@interface AdviceViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *AdviceTableView;
}

@end

@implementation AdviceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addTitleView:@"我的医嘱"];
    [self addItem:@"" imageName:@"jiantou" actoion:@selector(backClick) position:LEFT_BAR_BUTTON];
    [self createTableView];
    [self loading];
    
}
-(void)loading{
    
}
-(void)createTableView{
    AdviceTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KW, KH - 49) style:UITableViewStyleGrouped];
    AdviceTableView.delegate = self;
    AdviceTableView.dataSource = self;
    AdviceTableView.backgroundColor = [UIColor colorWithRed:241/255.0f green:241/255.0f  blue:241/255.0f  alpha:1];
    AdviceTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:AdviceTableView];
}
-(void)backClick{
    [self.navigationController popViewControllerAnimated:YES];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 130;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 10;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellId = @"cellId";
    AdviceCell *cell = [AdviceTableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[AdviceCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
        
    }
    cell.truename.text = @"朱小光";
    cell.StartTime.text = @"2015.06.09";
    cell.StartTime.text = @"2015.06.09";
    cell.Diagnosis.text = @"你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好";
    cell.Information.text  = @"你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好";
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryNone;
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AdviceDetailsViewController *advc = [[AdviceDetailsViewController alloc] init];
    
    [self.navigationController pushViewController:advc animated:YES];
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
