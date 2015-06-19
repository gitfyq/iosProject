//
//  AdviceCell.m
//  Client
//
//  Created by apple on 15/6/10.
//  Copyright (c) 2015年 CC. All rights reserved.
//

#import "AdviceCell.h"

@implementation AdviceCell
{
    UIImageView *DcImage;
    UILabel *startTimeLabel;
    UILabel *stopTimeLabel;
    UILabel *DiagnosisLabel;
    UILabel *InformationLabel;
}


- (void)setFrame:(CGRect)frame
{
    frame.origin.x += 10;
    frame.size.width -= 20;
    
    frame.origin.y += 10;
    frame.size.height -= 10;
    [super setFrame:frame];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        [self createtable];
        
        
    }
    return self;
}

-(void)createtable{
    
//    [self.contentView.layer setMasksToBounds:YES];
//    self.contentView.layer.cornerRadius=20;
    
   
    
    
    //医生姓名
    DcImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 15, 20)];
    DcImage.image = [UIImage imageNamed:@"底部图标_医生1"];
    [self.contentView addSubview:DcImage];
    
    self.truename = [Unity lableViewAddsuperview_superView:self.contentView _subViewFrame:CGRectMake(CGRectGetMaxX(DcImage.frame)+1, 5, 120, 20) _string:@"朱晓光医生" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor colorWithRed:126/255.0f green:126/255.0f blue:126/255.0f alpha:1] _textAlignment:NSTextAlignmentLeft];
    
    //当前时间
    self.Current = [Unity lableViewAddsuperview_superView:self.contentView _subViewFrame:CGRectMake(KW - 115-5, 5, 80, 20) _string:@"2015-06-11" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor colorWithRed:155/255.0f green:155/255.0f blue:155/255.0f alpha:1] _textAlignment:NSTextAlignmentRight];
    
    //线
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.truename.frame)+10, KW-20, 0.5)];
    view.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:view];
    
    

    //起始时间
    startTimeLabel = [Unity lableViewAddsuperview_superView:self.contentView _subViewFrame:CGRectMake(10, CGRectGetMaxY(view.frame)+10, 70, 20) _string:@"起始时间:" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor colorWithRed:126/255.0f green:126/255.0f blue:126/255.0f alpha:1] _textAlignment:NSTextAlignmentLeft];
    
    self.StartTime = [Unity lableViewAddsuperview_superView:self.contentView _subViewFrame:CGRectMake(CGRectGetMaxX(startTimeLabel.frame)+1, CGRectGetMaxY(view.frame)+10, 80, 20) _string:@"2015.04.07" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor colorWithRed:155/255.0f green:155/255.0f blue:155/255.0f alpha:1] _textAlignment:NSTextAlignmentLeft];
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.StartTime.frame)+1, CGRectGetMaxY(view.frame)+19.5, 10, 1)];
    view1.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:view1];
    
    
    //停止时间
    stopTimeLabel = [Unity lableViewAddsuperview_superView:self.contentView _subViewFrame:CGRectMake(CGRectGetMaxX(view1.frame)+10 , CGRectGetMaxY(view.frame)+10, 70, 20) _string:@"结束时间:" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor colorWithRed:126/255.0f green:126/255.0f blue:126/255.0f alpha:1] _textAlignment:NSTextAlignmentLeft];
    
    self.StopTime = [Unity lableViewAddsuperview_superView:self.contentView _subViewFrame:CGRectMake(CGRectGetMaxX(stopTimeLabel.frame)+1, CGRectGetMaxY(view.frame)+10, 80, 20) _string:@"2015.04.07" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor colorWithRed:155/255.0f green:155/255.0f blue:155/255.0f alpha:1] _textAlignment:NSTextAlignmentLeft];
    
    //诊断信息
    
    DiagnosisLabel = [Unity lableViewAddsuperview_superView:self.contentView _subViewFrame:CGRectMake(10, CGRectGetMaxY(self.StartTime.frame)+5, 70, 20) _string:@"诊断信息:" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor colorWithRed:126/255.0f green:126/255.0f blue:126/255.0f alpha:1] _textAlignment:NSTextAlignmentLeft];
    
    self.Diagnosis = [Unity lableViewAddsuperview_superView:self.contentView _subViewFrame:CGRectMake(CGRectGetMaxX(DiagnosisLabel.frame)+1, CGRectGetMaxY(self.StopTime.frame)+5, 200, 20) _string:@"2015.04.07" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor colorWithRed:155/255.0f green:155/255.0f blue:155/255.0f alpha:1] _textAlignment:NSTextAlignmentLeft];
    
    //医嘱信息
    
    InformationLabel = [Unity lableViewAddsuperview_superView:self.contentView _subViewFrame:CGRectMake(10, CGRectGetMaxY(self.Diagnosis.frame)+5, 70, 20) _string:@"医嘱信息:" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor colorWithRed:126/255.0f green:126/255.0f blue:126/255.0f alpha:1] _textAlignment:NSTextAlignmentLeft];
    
    self.Information = [Unity lableViewAddsuperview_superView:self.contentView _subViewFrame:CGRectMake(CGRectGetMaxX(InformationLabel.frame)+1, CGRectGetMaxY(self.Diagnosis.frame)+5, 200, 20) _string:@"2015.04.07" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor colorWithRed:155/255.0f green:155/255.0f blue:155/255.0f alpha:1] _textAlignment:NSTextAlignmentLeft];
    self.Information.textColor= [UIColor colorWithRed:255/255.0f green:171/255.0f blue:64/255.0f alpha:1];

    
    
}


@end
