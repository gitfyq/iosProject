//
//  PersonalController.m
//  Client
//
//  Created by apple on 15/6/3.
//  Copyright (c) 2015年 CC. All rights reserved.
//

#import "PersonalController.h"

#import "SituationViewController.h"

@interface PersonalController ()<UIActionSheetDelegate>
{
    UIView *FoodView;
    UIButton *NextButton;
    
    NSString *name;
    NSString *derger;
    NSString *data;
    NSString *age;
    NSString *phone;
}

@end

@implementation PersonalController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"完善个人资料";
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor colorWithRed:245/255.0f green:245/255.0f blue:245/255.0f alpha:1   ];
    
    name = @"男";
    
   
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"首页_bt01"] forBarMetrics:UIBarMetricsDefault];
    
    UIImageView *leftImageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    leftImageView.image=[UIImage imageNamed:@""];
    
    UIBarButtonItem *leftImageItem = [[UIBarButtonItem alloc] initWithCustomView:leftImageView];
    
    UIButton *rightButton= [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame=CGRectMake(0, 0, 10, 10);
    [rightButton addTarget:self action:@selector(leftButton:) forControlEvents:UIControlEventTouchUpInside];
    [rightButton setBackgroundImage:[UIImage imageNamed:@"jiantou"] forState:UIControlStateNormal];
    [rightButton setTitle:@"" forState:UIControlStateNormal];
    rightButton.titleLabel.font=[UIFont systemFontOfSize:14];
    rightButton.titleLabel.textAlignment=NSTextAlignmentRight;
    UIBarButtonItem *rightbutItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.leftBarButtonItems=@[rightbutItem,leftImageItem];
    
    
    
}

-(void)leftButton:(UIButton *)btn{
    //     [self.navigationController popToRootViewControllerAnimated:NO];
    [self . navigationController  popViewControllerAnimated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
#pragma mark 分区数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

#pragma mark 行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 5;
    
}

#pragma mark 行的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellIdentifier = @"mineCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"mineCellIdentifier"];
    }
    NSArray *contentArray = @[@"姓名", @"性别", @"出生日期", @"年龄", @"常用电话"];
    cell.textLabel.text = contentArray[indexPath.row];
    if (indexPath.row == 0) {
        
    }else if (indexPath.row == 1){
        
        cell.detailTextLabel.text = name;
        
    }else if(indexPath.row == 2){
        
    }else if (indexPath.row == 3){
        
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    
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

#pragma mark 行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

#pragma mark - 标题的高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 10.0f;
    
    
}

//点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        
    }else if (indexPath.row == 1){
        UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"修改性别" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"男",@"女", nil];
        sheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
        [sheet showInView:self.view];
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
//    NSLog(@"%i", buttonIndex);
    if (buttonIndex == actionSheet.cancelButtonIndex) {
        return;
    }
    switch (buttonIndex) {
        case 0: {
            
            name = @"男";
            [self.tableView reloadData];
        }
            break;
            
        case 1: {
            name = @"女";
            [self.tableView reloadData];
        }
            break;
    }
}

//下一步
-(void)NextBtn:(UIButton *)NextBtn{
    SituationViewController *svc = [[SituationViewController alloc] initWithStyle:UITableViewStyleGrouped];
    [self.navigationController pushViewController:svc animated:YES];
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
