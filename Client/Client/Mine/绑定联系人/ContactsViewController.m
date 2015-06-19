//
//  ContactsViewController.m
//  Client
//
//  Created by apple on 15/6/9.
//  Copyright (c) 2015年 CC. All rights reserved.
//

#import "ContactsViewController.h"
#import "ContactsModel.h"
#import "ContactsCell.h"
#import "AddContactsViewController.h"


@interface ContactsViewController ()<UITableViewDelegate,UITableViewDataSource>

{
    UIView *headView;
    UITableView *ContactsTableView;
}

@end

@implementation ContactsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"绑定联系人";
    [self addItem:@"" imageName:@"jiantou" actoion:@selector(backClick) position:LEFT_BAR_BUTTON];
    [self createTableView];
    [self loading];
    [self nav];
    
    
}

-(void)nav{
        UIImageView *leftImageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 16, 15)];
        leftImageView.image=[UIImage imageNamed:@""];
    
        UIBarButtonItem *leftImageItem = [[UIBarButtonItem alloc] initWithCustomView:leftImageView];
    
        UIButton *rightButton= [UIButton buttonWithType:UIButtonTypeCustom];
        rightButton.frame=CGRectMake(0, 0, 13, 13);
        [rightButton addTarget:self action:@selector(AddButton:) forControlEvents:UIControlEventTouchUpInside];
        [rightButton setBackgroundImage:[UIImage imageNamed:@"jia"] forState:UIControlStateNormal];
        [rightButton setTitle:@"" forState:UIControlStateNormal];
        rightButton.titleLabel.font=[UIFont systemFontOfSize:14];
        rightButton.titleLabel.textAlignment=NSTextAlignmentRight;
        UIBarButtonItem *rightbutItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
        self.navigationItem.rightBarButtonItems=@[rightbutItem,leftImageItem];
}

-(void)AddButton:(UIButton *)btn{

    AddContactsViewController *acvc = [[AddContactsViewController alloc] init];
    [self.navigationController pushViewController:acvc animated:YES];
    
}
//下载
-(void)loading{
//    if ([responseObject[@"data"][@"count"] isEqualToString:@"0"]) {
//        [Unity lableViewAddsuperview_superView:self.tableView _subViewFrame:CGRectMake(0, 0, ScreenWidth, 20) _string:@"无筛选结果" _lableFont:[UIFont systemFontOfSize:15] _lableTxtColor:[UIColor grayColor] _textAlignment:NSTextAlignmentCenter];
}
//tableView
-(void)createTableView{
    
    ContactsTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KW, KH - 49) style:UITableViewStyleGrouped];
    ContactsTableView.delegate = self;
    ContactsTableView.dataSource = self;
    ContactsTableView.backgroundColor = [UIColor colorWithRed:241/255.0f green:241/255.0f  blue:241/255.0f  alpha:1];
    ContactsTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:ContactsTableView];
}


-(void)backClick{
    [self.navigationController popViewControllerAnimated:YES];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 160;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *cellId = @"cellId";
    ContactsCell *cell = [ContactsTableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[ContactsCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
        
    }
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    cell.accessoryType = UITableViewCellAccessoryNone;
//    headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KW, 100)];
//    headView.backgroundColor = [UIColor redColor];
//    tableView.tableHeaderView = headView;
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
