//
//  AdviceDetallsCell.h
//  Client
//
//  Created by apple on 15/6/11.
//  Copyright (c) 2015年 CC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdviceDetallsCell : UITableViewCell


//起始时间
@property(nonatomic,retain)UILabel *StartTime;

//停止时间
@property(nonatomic,retain)UILabel *StopTime;

//诊断信息
@property(nonatomic,retain)UILabel *Diagnosis;

//医嘱信息
@property(nonatomic,retain)UILabel *Information;

//饮食
@property(nonatomic,retain)UILabel *diet;

//服用药物
@property(nonatomic,retain)UILabel *drug;



@end
