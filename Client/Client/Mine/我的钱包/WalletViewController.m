//
//  WalletViewController.m
//  Client
//
//  Created by apple on 15/6/9.
//  Copyright (c) 2015年 CC. All rights reserved.
//

#import "WalletViewController.h"

@interface WalletViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *WalletTableView;
    UIView *HeadView;
    UIImageView *YeImage;
    UILabel *ZhLabel;
    UILabel *YeLabel;

}

@end

@implementation WalletViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我的钱包";
    [self addItem:@"" imageName:@"jiantou" actoion:@selector(backClick) position:LEFT_BAR_BUTTON];
    [self createTableView];

}

-(void)backClick{
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)createTableView{
    WalletTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KW, KH - 49) style:UITableViewStyleGrouped];
    WalletTableView.delegate = self;
    WalletTableView.dataSource = self;
    WalletTableView.backgroundColor = [UIColor colorWithRed:241/255.0f green:241/255.0f  blue:241/255.0f  alpha:1];
    WalletTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:WalletTableView];
}




-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellId = @"cellId";
    UITableViewCell *cell = [WalletTableView dequeueReusableHeaderFooterViewWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
        
    }
    if (indexPath.section == 0) {
        cell.textLabel.text = @"充值";
        cell.imageView.image = [UIImage imageNamed:@"5我的_我的钱包_充值"];
        
    }else{
        cell.textLabel.text = @"订单记录";
        cell.imageView.image = [UIImage imageNamed:@"5我的_我的钱包_订单记录"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    cell.accessoryType = UITableViewCellAccessoryNone;
    
    HeadView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KW, 140)];
    HeadView.backgroundColor = [UIColor colorWithRed:255/255.0f green:186/255.0f blue:0/255.0f alpha:1];
    
    YeImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 30, 20, 20)];
    YeImage.image = [UIImage imageNamed:@"5我的_我的钱包_账户余额"];
    [HeadView addSubview:YeImage];
    
    ZhLabel = [Unity lableViewAddsuperview_superView:HeadView _subViewFrame:CGRectMake(CGRectGetMaxX(YeImage.frame)+1, 30, 120, 20) _string:@"账户余额" _lableFont:[UIFont systemFontOfSize:16] _lableTxtColor:[UIColor whiteColor] _textAlignment:NSTextAlignmentLeft];
    
    YeLabel = [Unity lableViewAddsuperview_superView:HeadView _subViewFrame:CGRectMake(15, CGRectGetMaxY(ZhLabel.frame)+10, 300, 60) _string:@"10000:00" _lableFont:[UIFont systemFontOfSize:60] _lableTxtColor:[UIColor whiteColor] _textAlignment:NSTextAlignmentLeft];

    
    WalletTableView.tableHeaderView=HeadView;
    
    return cell;
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
