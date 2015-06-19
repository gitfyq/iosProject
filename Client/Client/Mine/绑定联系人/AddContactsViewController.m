//
//  AddContactsViewController.m
//  Client
//
//  Created by apple on 15/6/10.
//  Copyright (c) 2015年 CC. All rights reserved.
//

#import "AddContactsViewController.h"

@interface AddContactsViewController ()

@end

@implementation AddContactsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"绑定联系人";
    [self addItem:@"" imageName:@"jiantou" actoion:@selector(backClick) position:LEFT_BAR_BUTTON];
}


-(void)backClick{
    [self.navigationController popViewControllerAnimated:YES];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellIdentifier = @"mineCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"mineCellIdentifier"];
    }
    NSArray *ContactArray = @[@"联系人姓名",@"性别",@"所属关系",@"联系人电话"];
    cell.textLabel.text = ContactArray[indexPath.row];
//    cell.detailTextLabel.text=@"男";
    if (indexPath.row == 0) {
                cell.detailTextLabel.text = @"马小磊";
            }else if (indexPath.row == 1){
                cell.detailTextLabel.text = @"男";
            }else if (indexPath.row == 2){
                cell.detailTextLabel.text = @"父子";
            }else{
                cell.detailTextLabel.text = @"567890";
            }

    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    
    
    return cell;
}


//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    NSString *cellId = @"cellId";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
//    if (!cell) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
//        
//    }
//    NSArray *ContactArray = @[@"联系人姓名",@"性别",@"所属关系",@"联系人电话"];
//    
////    if (indexPath.row == 0) {
////        cell.detailTextLabel.text = @"马小磊";
////    }else if (indexPath.row == 1){
////        cell.detailTextLabel.text = @"男";
////    }else if (indexPath.row == 2){
////        cell.detailTextLabel.text = @"父子";
////    }else{
////        cell.detailTextLabel.text = @"567890";
////    }
//    cell.textLabel.text = ContactArray[indexPath.row];
//    cell.detailTextLabel.text= ContactArray[indexPath.row];
//    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    
//    
//    return cell;
//    
//}


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
