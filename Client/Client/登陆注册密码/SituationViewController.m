//
//  SituationViewController.m
//  Client
//
//  Created by apple on 15/6/3.
//  Copyright (c) 2015年 CC. All rights reserved.
//

#import "SituationViewController.h"
#import "MedicalViewController.h"

@interface SituationViewController ()

{
    
    UIView *headView;
    UIImageView *QkImage;
    
    UIView *FoodView;
    UIButton *NextButton;
}

@end

@implementation SituationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"完善健康档案";
    
    
}

#pragma mark 分区数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


//分行

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}
#pragma mark - 标题的高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 10.0f;
    
    
}

#pragma mark 行的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellIdentifier = @"mineCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"mineCellIdentifier"];
    }
    NSArray *contentArray = @[@"体温", @"呼吸频率", @"身高", @"脉率", @"血压", @"体重"];
    cell.textLabel.text = contentArray[indexPath.row];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    
    headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KW, 80)];
    headView.backgroundColor = [UIColor colorWithRed:245/255.0f green:245/255.0f blue:245/255.0f alpha:1   ];
    
    QkImage = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, KW - 40, 40)];
    QkImage.image = [UIImage imageNamed:@"完善健康档案2_流程1"];
    [headView addSubview:QkImage];
    tableView.tableHeaderView = headView;
    
    
    FoodView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KW, 100)];
    
    FoodView.backgroundColor = [UIColor colorWithRed:245/255.0f green:245/255.0f blue:245/255.0f alpha:1   ];
    NextButton = [Unity buttonAddsuperview_superView:FoodView _subViewFrame:CGRectMake(10, 40, KW - 20, 40) _tag:self _action:@selector(NextBtn:) _string:@"下一步" _imageName:@""];
    NextButton.backgroundColor = [UIColor colorWithRed:0/255.0f green:168/255.0f blue:241/255.0f alpha:1.000];
    [NextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    NextButton.layer.cornerRadius = 4;
    tableView.tableFooterView=FoodView;
    
    return cell;
}

//横线
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

-(void)viewDidLayoutSubviews
{
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
}


//下一步
-(void)NextBtn:(UIButton *)NextBtn{
    MedicalViewController *mvc = [[MedicalViewController alloc] initWithStyle:UITableViewStyleGrouped];
    [self.navigationController pushViewController:mvc animated:YES];
    
}
#pragma mark - 点击事件

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
