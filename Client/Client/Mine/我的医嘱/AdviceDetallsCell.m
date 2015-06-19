//
//  AdviceDetallsCell.m
//  Client
//
//  Created by apple on 15/6/11.
//  Copyright (c) 2015年 CC. All rights reserved.
//

#import "AdviceDetallsCell.h"


@implementation AdviceDetallsCell
{
    UILabel *startTimeLabel;
    UILabel *stopTimeLabel;
    UILabel *DiagnosisLabel;
    UIImageView *DiagnosisImage;
    UILabel *InformationLabel;
    UIImageView *InformationImage;
    UILabel *dietLabel;
    UIImageView *dietImage;
    UILabel *drugLabel;
    UIImageView *drugImage;
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
    
    //起始时间
    startTimeLabel = [Unity lableViewAddsuperview_superView:self.contentView _subViewFrame:CGRectMake(10, 10, 70, 20) _string:@"起始时间:" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor colorWithRed:126/255.0f green:126/255.0f blue:126/255.0f alpha:1] _textAlignment:NSTextAlignmentLeft];
    
    self.StartTime = [Unity lableViewAddsuperview_superView:self.contentView _subViewFrame:CGRectMake(CGRectGetMaxX(startTimeLabel.frame)+1, 10, 80, 20) _string:@"2015.04.07" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor colorWithRed:155/255.0f green:155/255.0f blue:155/255.0f alpha:1] _textAlignment:NSTextAlignmentLeft];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.StartTime.frame)+1, 19.5, 10, 1)];
    view.backgroundColor = [UIColor colorWithRed:155/255.0f green:155/255.0f blue:155/255.0f alpha:1];
    [self.contentView addSubview:view];
    
    
    //停止时间
    stopTimeLabel = [Unity lableViewAddsuperview_superView:self.contentView _subViewFrame:CGRectMake(CGRectGetMaxX(view.frame)+10 , 10, 70, 20) _string:@"结束时间:" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor colorWithRed:126/255.0f green:126/255.0f blue:126/255.0f alpha:1] _textAlignment:NSTextAlignmentLeft];
    
    self.StopTime = [Unity lableViewAddsuperview_superView:self.contentView _subViewFrame:CGRectMake(CGRectGetMaxX(stopTimeLabel.frame)+1, 10, 80, 20) _string:@"2015.04.07" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor colorWithRed:155/255.0f green:155/255.0f blue:155/255.0f alpha:1] _textAlignment:NSTextAlignmentLeft];
    
    //线
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(self.StopTime.frame)+10, KW - 40, 0.5)];
    view1.backgroundColor = [UIColor colorWithRed:155/255.0f green:155/255.0f blue:155/255.0f alpha:1];
    [self.contentView addSubview:view1];
    
    //诊断信息
    DiagnosisImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(view1.frame) +10, 15, 20)];
    DiagnosisImage.image = [UIImage imageNamed:@"诊断信息"];
    [self.contentView addSubview:DiagnosisImage];
    
    DiagnosisLabel = [Unity lableViewAddsuperview_superView:self.contentView _subViewFrame:CGRectMake(CGRectGetMaxX(DiagnosisImage.frame)+5 , CGRectGetMaxY(view1.frame) +10, 120, 20) _string:@"诊断信息" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor colorWithRed:126/255.0f green:126/255.0f blue:126/255.0f alpha:1] _textAlignment:NSTextAlignmentLeft];
    
    
    NSString * desc = @"Description it is  a test font, and don't become angry for which i use to do here.Now here is a very nice party from american or not!";
    
    CGSize  size = [desc sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:CGSizeMake(200, 999) lineBreakMode:UILineBreakModeWordWrap];
    
    //只有UILabel需要定义的numberoflines为0，即不做行数的限制。如下：
    self.Diagnosis = [[UILabel alloc] init];
    self.Diagnosis.textColor = [UIColor colorWithRed:155/255.0f green:155/255.0f blue:155/255.0f alpha:1];
    
    [self.contentView addSubview:self.Diagnosis];
    
    [self.Diagnosis  setNumberOfLines:0];
    
    [self.Diagnosis  setFrame:CGRectMake(10, CGRectGetMaxY(DiagnosisLabel.frame), KW - 60, size.height+5)];
    
    [self.Diagnosis setText:desc];
    
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(self.Diagnosis.frame)+10, KW - 40, 0.5)];
    view2.backgroundColor = [UIColor colorWithRed:155/255.0f green:155/255.0f blue:155/255.0f alpha:1];
    [self.contentView addSubview:view2];
    
    //医嘱信息
    InformationImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(view2.frame) +10, 15, 20)];
    InformationImage.image = [UIImage imageNamed:@"医嘱详情"];
    [self.contentView addSubview:InformationImage];
    
    InformationLabel = [Unity lableViewAddsuperview_superView:self.contentView _subViewFrame:CGRectMake(CGRectGetMaxX(InformationImage.frame)+5 , CGRectGetMaxY(view2.frame) +10, 120, 20) _string:@"医嘱详情" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor colorWithRed:126/255.0f green:126/255.0f blue:126/255.0f alpha:1] _textAlignment:NSTextAlignmentLeft];
    
    
    NSString * desc1 = @"Description it is  a test font, and don't become angry for which i use to do here.Now here is a very nice party from american or not!";
    
    //CGSize  size = [desc sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:CGSizeMake(200, 999) lineBreakMode:UILineBreakModeWordWrap];
    
    //只有UILabel需要定义的numberoflines为0，即不做行数的限制。如下：
    self.Information = [[UILabel alloc] init];
    self.Information.textColor = [UIColor colorWithRed:155/255.0f green:155/255.0f blue:155/255.0f alpha:1];
    
    [self.contentView addSubview:self.Information];
    
    [self.Information  setNumberOfLines:0];
    
    [self.Information  setFrame:CGRectMake(10, CGRectGetMaxY(InformationLabel.frame), KW - 60, size.height+5)];
    
    [self.Information setText:desc1];
    
    
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(self.Information.frame)+10, KW - 40, 0.5)];
    view3.backgroundColor = [UIColor colorWithRed:155/255.0f green:155/255.0f blue:155/255.0f alpha:1];
    [self.contentView addSubview:view3];
    
  
    //饮食
    dietImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(view3.frame) +10, 15, 20)];
    dietImage.image = [UIImage imageNamed:@"饮食"];
    [self.contentView addSubview:dietImage];
    
    dietLabel = [Unity lableViewAddsuperview_superView:self.contentView _subViewFrame:CGRectMake(CGRectGetMaxX(dietImage.frame)+5 , CGRectGetMaxY(view3.frame) +10, 120, 20) _string:@"饮食" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor colorWithRed:126/255.0f green:126/255.0f blue:126/255.0f alpha:1] _textAlignment:NSTextAlignmentLeft];
    
    
  
    self.diet = [Unity lableViewAddsuperview_superView:self.contentView _subViewFrame:CGRectMake(10, CGRectGetMaxY(dietLabel.frame)+10, KW - 60, 20) _string:@"清淡为主，多水果多蔬菜" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor colorWithRed:155/255.0f green:155/255.0f blue:155/255.0f alpha:1] _textAlignment:NSTextAlignmentLeft];
   
      [self.contentView addSubview:self.diet];
    
    
    UIView *view4 = [[UIView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(self.diet.frame)+10, KW - 40, 0.5)];
    view4.backgroundColor = [UIColor colorWithRed:155/255.0f green:155/255.0f blue:155/255.0f alpha:1];
    [self.contentView addSubview:view4];
    
    
    
    
//    //服用药物
    drugImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(view4.frame) +10, 15, 20)];
    drugImage.image = [UIImage imageNamed:@"服用药物"];
    [self.contentView addSubview:drugImage];
    
    drugLabel = [Unity lableViewAddsuperview_superView:self.contentView _subViewFrame:CGRectMake(CGRectGetMaxX(drugImage.frame)+5 , CGRectGetMaxY(view4.frame) +10, 120, 20) _string:@"服用药物" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor colorWithRed:126/255.0f green:126/255.0f blue:126/255.0f alpha:1] _textAlignment:NSTextAlignmentLeft];
    
    
    NSString * desc2 = @"Description it is  a test font, do here.Now here is a very nice party from american or not!";
    
    self.drug = [[UILabel alloc] init];
    self.drug.textColor = [UIColor colorWithRed:155/255.0f green:155/255.0f blue:155/255.0f alpha:1];
    
    [self.contentView addSubview:self.drug];
    
    [self.drug  setNumberOfLines:0];
    
    [self.drug  setFrame:CGRectMake(10, CGRectGetMaxY(drugLabel.frame), KW - 160, size.height+5)];
    
    [self.drug setText:desc2];
    
}
@end
