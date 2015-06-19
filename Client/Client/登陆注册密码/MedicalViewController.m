//
//  MedicalViewController.m
//  Client
//
//  Created by apple on 15/6/3.
//  Copyright (c) 2015年 CC. All rights reserved.
//

#import "MedicalViewController.h"

#import "LifeViewController.h"

@interface MedicalViewController ()

{
    UIView *headView;
    UIImageView *QkImage;
    
    UIView *FoodView;
    UIButton *NextButton;

}


@end

@implementation MedicalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"完善健康档案";

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

#pragma mark 行的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    if (indexPath.section == 0) {
        NSString *cellIdentifier = @"mineCellIdentifier";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        }
        
       
        cell.textLabel.text = @"既往史";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.section == 1){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mineCellIdentifier"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"mineCellIdentifier"];
        }
       
        cell.textLabel.text = @"家族史";
       
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }else if(indexPath.section == 2){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"setCellIdentifier"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"setCellIdentifier"];
        }
       
        cell.textLabel.text = @"遗传病史";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellAccessoryNone;
        return cell;
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"setCellIdentifier"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"setCellIdentifier"];
        }
       
        cell.textLabel.text = @"残疾情况";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellAccessoryNone;
        
        
        headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KW, 80)];
        headView.backgroundColor = [UIColor colorWithRed:245/255.0f green:245/255.0f blue:245/255.0f alpha:1   ];
        
        QkImage = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, KW - 40, 40)];
        QkImage.image = [UIImage imageNamed:@"完善健康档案2_流程2"];
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

//点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.section == 0) {
        
    }else if (indexPath.section == 1){
        
    }else if (indexPath.section == 1){
        
    }else{
        
    }
    
    
    
    
}

//下一步
-(void)NextBtn:(UIButton *)NextBtn{
    LifeViewController *Lvc = [[LifeViewController alloc] initWithStyle:UITableViewStyleGrouped];
    [self.navigationController pushViewController:Lvc animated:YES];
    
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
