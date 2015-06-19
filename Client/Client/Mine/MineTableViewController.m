//
//  MineTableViewController.m
//  Client
//
//  Created by apple on 15/6/1.
//  Copyright (c) 2015年 CC. All rights reserved.
//

#import "MineTableViewController.h"

#import "AppointmentViewController.h"
#import "SetViewController.h"
#import "MineTableViewCell.h"
#import "HealthViewController.h"
#import "WalletViewController.h"
#import "ContactsViewController.h"
#import "AdviceViewController.h"
#import "Home_MeasureViewController.h"

@interface MineTableViewController ()

@end

@implementation MineTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的";
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
#pragma mark 分区数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

#pragma mark 行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }else {
        return 8;
    }
}

#pragma mark 行的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        NSString *cellIdentifier = @"mineCellIdentifier";
        MineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell = [[MineTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mineCellIdentifier"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mineCellIdentifier"];
        }
        NSArray *contentArray = @[@"我的预约", @"我的医嘱", @"用药记录", @"测量数据", @"健康档案", @"我的钱包",@"绑定联系人",@"设置"];
        cell.textLabel.text = contentArray[indexPath.row];
         NSArray *imageArray = @[@"我的预约", @"我的医嘱", @"用药记录", @"测量记录", @"健康档案", @"我的钱包",@"绑定联系人",@"设置"];
        cell.imageView.image = [UIImage imageNamed:imageArray[indexPath.row]];
//        cell.imageView.frame=CGRectMake(0, 0, 30, 30);
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }
}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    
//    UIView * view_ = [[UIView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 35.0f)];
//    view_.backgroundColor = [UIColor greenColor];
//    UILabel * label1 = [[UILabel alloc]initWithFrame:CGRectMake(20.0f, 5.0f, 280.0f, 30.0f)];
//    label1.backgroundColor = [UIColor clearColor];
//    label1.textColor = [UIColor redColor];
//    label1.font = [UIFont systemFontOfSize:14];
//    [view_ addSubview:label1];
//    
//    
//    if (section == 0) {
//        label1.text = @"标的详情";
//        
//    }
//    
//    else if (section ==1){
//        label1.text = @"你好";
//    }
//    return view_;
//    
//}

#pragma mark 行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 180;
    }else {
        return 45;
    }
}

#pragma mark - 标题的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}

#pragma mark 行的点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        //        MyInformationTableViewController *myInformation = [[MyInformationTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
        //        myInformation.hidesBottomBarWhenPushed = YES;
        //        [self.navigationController pushViewController:myInformation animated:YES];
        
    }else {
        
        if (indexPath.row == 0) {
            AppointmentViewController *avc = [[AppointmentViewController alloc] init];
            avc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:avc animated:YES];
        }else if (indexPath.row == 1){
            AdviceViewController *avcc = [[AdviceViewController alloc] init];
            avcc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:avcc animated:YES];
            
        }else if (indexPath.row == 2){
            
        }else if (indexPath.row == 3){
            Home_MeasureViewController *Hmvc = [[Home_MeasureViewController alloc] init];
            Hmvc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:Hmvc animated:YES];
            
        }else if (indexPath.row == 4){
            HealthViewController *hvc = [[HealthViewController alloc] init];
            hvc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:hvc animated:YES];
        }else if (indexPath.row == 5){
            WalletViewController *wvc = [[WalletViewController alloc] init];
            wvc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:wvc animated:YES];
            
        }else if (indexPath.row == 6){
            ContactsViewController *cvc = [[ContactsViewController alloc] init];
            cvc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:cvc animated:YES];
        }else{
            SetViewController *svc = [[SetViewController alloc] initWithStyle:UITableViewStyleGrouped];
            svc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:svc animated:YES];
        }
        
    }
}



/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
