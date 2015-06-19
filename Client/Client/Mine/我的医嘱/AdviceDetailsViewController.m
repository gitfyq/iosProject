//
//  AdviceDetailsViewController.m
//  Client
//
//  Created by apple on 15/6/10.
//  Copyright (c) 2015年 CC. All rights reserved.
//

#import "AdviceDetailsViewController.h"
#import "AdviceDetallsModel.h"
#import "AdviceDetallsCell.h"

@interface AdviceDetailsViewController ()

@end

@implementation AdviceDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addTitleView:@"我的医嘱"];
    [self addItem:@"" imageName:@"jiantou" actoion:@selector(backClick) position:LEFT_BAR_BUTTON];
    [self loading];
}

-(void)backClick{
    
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)loading{
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 480;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellId = @"cellId";
    AdviceDetallsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[AdviceDetallsCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId];
        
    }
    
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
