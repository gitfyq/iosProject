//
//  AppointmentCell.h
//  Client
//
//  Created by apple on 15/6/5.
//  Copyright (c) 2015年 CC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppointmentCell : UITableViewCell


//医生头像
@property(nonatomic,retain)UIImageView  *picImage;

//医生姓名
@property(nonatomic,retain)UILabel *truename;
//医院
@property(nonatomic,retain)UILabel *company;
//科室
@property(nonatomic,retain)UILabel *department;
//职称
@property(nonatomic,retain)UILabel *job_pos;

//时间
@property (nonatomic,retain)UILabel *Times;

//咨询价格
@property(nonatomic,retain)UILabel *price;


@end
