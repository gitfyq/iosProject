//
//  LifeViewController.m
//  Client
//
//  Created by apple on 15/6/3.
//  Copyright (c) 2015年 CC. All rights reserved.
//

#import "LifeViewController.h"
#import "RootTabBarViewController.h"

@interface LifeViewController ()


{
    
    UIView *headView;
    UIImageView *QkImage;
    
    UIView *FoodView;
    UIButton *NextButton;

}

@end

@implementation LifeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"完善健康档案";
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
    
}
-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        NSString *cellId = @"cellId";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
            
        }
        cell.textLabel.text = @"体育锻炼";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    }else if (indexPath.section == 1){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mineCellIdentifier"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"mineCellIdentifier"];
        }
        
        cell.textLabel.text = @"饮食习惯";
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }else if(indexPath.section == 2){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"setCellIdentifier"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"setCellIdentifier"];
        }
        
        cell.textLabel.text = @"吸烟情况";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellAccessoryNone;
        return cell;
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"setCellIdentifier"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"setCellIdentifier"];
        }
        
        cell.textLabel.text = @"饮酒情况";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellAccessoryNone;
        
        
        headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KW, 80)];
        headView.backgroundColor = [UIColor colorWithRed:245/255.0f green:245/255.0f blue:245/255.0f alpha:1   ];
        
        QkImage = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, KW - 40, 40)];
        QkImage.image = [UIImage imageNamed:@"完善健康档案2_流程3"];
        [headView addSubview:QkImage];
        tableView.tableHeaderView = headView;
        
        
        FoodView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KW, 100)];
        
        FoodView.backgroundColor = [UIColor colorWithRed:245/255.0f green:245/255.0f blue:245/255.0f alpha:1   ];
        NextButton = [Unity buttonAddsuperview_superView:FoodView _subViewFrame:CGRectMake(10, 40, KW - 20, 40) _tag:self _action:@selector(Succ:) _string:@"完成" _imageName:@""];
        NextButton.backgroundColor = [UIColor colorWithRed:0/255.0f green:168/255.0f blue:241/255.0f alpha:1.000];
        [NextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        NextButton.layer.cornerRadius = 4;
        tableView.tableFooterView=FoodView;
        
        
        return cell;
        
    }
    

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


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        
    }else if (indexPath.section == 1){
        
    }else if (indexPath.section == 2){
        
    }else{
        
    }
}

//完成
-(void)Succ:(UIButton *)btn{
    RootTabBarViewController *rvc = [[RootTabBarViewController alloc] init];
    [self presentViewController:rvc animated:NO completion:^{
        
    }];
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
