//
//  DoctorCell.m
//  Client
//
//  Created by apple on 15/6/5.
//  Copyright (c) 2015年 CC. All rights reserved.
//

#import "DoctorCell.h"

@implementation DoctorCell

{
    UIImageView *DcImage;
    UIImageView *ZxImage;
    UIView *YyView;
    UILabel *YyLabel;
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
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

- (void)setFrame:(CGRect)frame
{
    frame.origin.y += 10;//整体向下 移动10
    frame.size.height -= 10;//间隔为10
    [super setFrame:frame];
}

//创建
-(void)createtable{
    
    //头像
    self.picImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 80, 80)];
    self.picImage.layer.cornerRadius
    = 40;
    
    self.picImage.layer.masksToBounds
    = YES;
    [self.contentView addSubview:self.picImage];
    
    
    //医生姓名
    self.truename = [Unity lableViewAddsuperview_superView:self.contentView _subViewFrame:CGRectMake(CGRectGetMaxX(self.picImage.frame)+3, 10, 80, 20) _string:@"" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor colorWithRed:114/255.0f green:114/255.0f blue:114/255.0f alpha:1] _textAlignment:NSTextAlignmentLeft];
    
    
    //主治医生
    DcImage = [[UIImageView alloc] initWithFrame:CGRectMake(KW - 100, 11, 20, 15)];
    DcImage.image = [UIImage imageNamed:@"2医生_医生"];
    [self.contentView addSubview:DcImage];
    
    self.job_pos = [Unity lableViewAddsuperview_superView:self.contentView _subViewFrame:CGRectMake(CGRectGetMaxX(DcImage.frame)+2, 10, 80, 20) _string:@"" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor colorWithRed:0/255 green:197/255.0f blue:248/255.0f alpha:1] _textAlignment:NSTextAlignmentLeft];
    
    //医院
    self.company = [Unity lableViewAddsuperview_superView:self.contentView _subViewFrame:CGRectMake(CGRectGetMaxX(self.picImage.frame)+3, CGRectGetMaxY(self.truename.frame)+5, 120, 20) _string:@"" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor colorWithRed:178/255.0f green:178/255.0f blue:178/255.0f alpha:1] _textAlignment:NSTextAlignmentLeft];
    
    
    //科室
    self.department = [Unity lableViewAddsuperview_superView:self.contentView _subViewFrame:CGRectMake(CGRectGetMaxX(self.company.frame), CGRectGetMaxY(self.truename.frame)+5, 80, 20) _string:@"" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor colorWithRed:178/255.0f green:178/255.0f blue:178/255.0f alpha:1] _textAlignment:NSTextAlignmentLeft];
    
    //线
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(self.department.frame)+12, KW - 10, 1)];
    view.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:view];
    
    
    //价钱
    ZxImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(view.frame)+15, 20, 20)];
    ZxImage.image = [UIImage imageNamed:@"2医生_咨询价"];
    [self.contentView addSubview:ZxImage];
    
    self.price = [Unity lableViewAddsuperview_superView:self.contentView _subViewFrame:CGRectMake(CGRectGetMaxX(ZxImage.frame)+3, CGRectGetMaxY(view.frame)+15, 150, 20) _string:@"" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor grayColor] _textAlignment:NSTextAlignmentLeft];
    
    
    //预约
//    YyView = [[UIView alloc] initWithFrame:CGRectMake(KW - 85, CGRectGetMaxY(view.frame)+10, 70, 30)];
//    YyView.backgroundColor = [UIColor redColor];
//    YyView.layer.cornerRadius = 4;
//    [self.contentView addSubview:YyView];
    
//    YyLabel = [Unity lableViewAddsuperview_superView:YyView _subViewFrame:CGRectMake(20, 5, 30, 20) _string:@"预约" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor whiteColor] _textAlignment:NSTextAlignmentCenter];
    self.yyButton = [Unity buttonAddsuperview_superView:self.contentView _subViewFrame:CGRectMake(KW - 85, 80, 70, 30) _tag:self _action:@selector(YyButton:) _string:@"预约" _imageName:@""];
    [self.yyButton setBackgroundColor:[UIColor redColor]];
    self.yyButton.layer.cornerRadius = 4;
    
}
-(void)YyButton:(UIButton *)button{
    self.doctorButtonTag(button.tag);
}

@end
