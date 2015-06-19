//
//  DoctorDetailsCell.m
//  Client
//
//  Created by apple on 15/6/12.
//  Copyright (c) 2015年 CC. All rights reserved.
//

#import "DoctorDetailsCell.h"

@implementation DoctorDetailsCell
{
    UIImageView *IntroductionImage;
    UILabel *IntroductionLabel;
    
    UIImageView *GoodImage;
    UILabel *GoodLabel;
    
    UIImageView *EvaluationImage;
    UILabel *EvaluationLabel;
}



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        [self createtable];
        
//        self.CellTypeBlock (self.styleStr);
    }
    return self;
}


//创建
-(void)createtable{
    
     NSString *style=self.styleStr;
    if ([style isEqualToString:@"1"]) {
        
       //简介
        [self createIntroduction];
        
    }else if([style isEqualToString:@"2"]){
        
        //擅长
        [self createGood];
        
        
    }else if([style isEqualToString:@"3"]){
        
        //评价
        [self createEvaluation];
    }

}
//简介
-(void)createIntroduction{
    
    IntroductionImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 15, 20)];
    IntroductionImage.image = [UIImage imageNamed:@"简介"];
    [self.contentView addSubview:IntroductionImage];
    
    IntroductionLabel = [Unity lableViewAddsuperview_superView:self.contentView _subViewFrame:CGRectMake(CGRectGetMaxX(IntroductionImage.frame)+3, 5, 30, 20) _string:@"简介" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor colorWithRed:1/255.0f green:193/255.0f blue:243/255.0f alpha:1] _textAlignment:NSTextAlignmentLeft];
    
    
    
}
//擅长
-(void)createGood{
    GoodImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 15, 20)];
    GoodImage.image = [UIImage imageNamed:@"擅长"];
    [self.contentView addSubview:GoodImage];
    
    GoodLabel = [Unity lableViewAddsuperview_superView:self.contentView _subViewFrame:CGRectMake(CGRectGetMaxX(GoodImage.frame)+3, 5, 30, 20) _string:@"擅长" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor colorWithRed:1/255.0f green:193/255.0f blue:243/255.0f alpha:1] _textAlignment:NSTextAlignmentLeft];
    
}

 //评价
-(void)createEvaluation{
    EvaluationImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 15, 20)];
    EvaluationImage.image = [UIImage imageNamed:@"用户评价"];
    [self.contentView addSubview:EvaluationImage];
    
    EvaluationLabel = [Unity lableViewAddsuperview_superView:self.contentView _subViewFrame:CGRectMake(CGRectGetMaxX(EvaluationImage.frame)+3, 5, 30, 20) _string:@"用户评价" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor colorWithRed:1/255.0f green:193/255.0f blue:243/255.0f alpha:1] _textAlignment:NSTextAlignmentLeft];
}


@end
