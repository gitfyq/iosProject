//
//  HomeBaseViewController.h
//  Client
//
//  Created by smile_faner on 15/6/4.
//  Copyright (c) 2015年 CC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeBaseViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    //保存解析结果的数组
    NSMutableArray *dataArray;
    UITableView *dataTableView;
}
@property(nonatomic,copy)NSString *titleString;
//添加导航按钮
-(void)addItem:(NSString*)title imageName:(NSString *)imageName actoion:(SEL)action position:(NSInteger)position;
//定制导航标题
-(void)addTitleView:(NSString*)title;
@end
