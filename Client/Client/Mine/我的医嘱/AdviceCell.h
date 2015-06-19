//
//  AdviceCell.h
//  Client
//
//  Created by apple on 15/6/10.
//  Copyright (c) 2015年 CC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdviceCell : UITableViewCell


//医生姓名
@property(nonatomic,retain)UILabel *truename;


//起始时间
@property(nonatomic,retain)UILabel *StartTime;

//停止时间
@property(nonatomic,retain)UILabel *StopTime;

//当前时间
@property(nonatomic,retain)UILabel *Current;

//诊断信息
@property(nonatomic,retain)UILabel *Diagnosis;

//医嘱信息
@property(nonatomic,retain)UILabel *Information;


@end
