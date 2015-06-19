//
//  DoctorDetailsCell.h
//  Client
//
//  Created by apple on 15/6/12.
//  Copyright (c) 2015年 CC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoctorDetailsCell : UITableViewCell

@property(nonatomic,copy)NSString *styleStr;

@property (nonatomic,copy) void(^CellTypeBlock)(NSString *type);

//简介
@property (nonatomic,copy) UILabel *Introduction;
//擅长
@property (nonatomic,copy) UILabel *Good;
//评价
@property (nonatomic,copy) UILabel *Evaluation;



-(void)selectCellStyle;

@end
