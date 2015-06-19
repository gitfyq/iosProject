//
//  Measure_HistoryThreeCell.m
//  Client
//
//  Created by smile_faner on 15/6/12.
//  Copyright (c) 2015年 CC. All rights reserved.
//

#import "Measure_HistoryThreeCell.h"

@implementation Measure_HistoryThreeCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self createUI];
    }
    return self;
}
-(void)createUI{
    self.dateLable=[Unity lableViewAddsuperview_superView:self.contentView _subViewFrame:CGRectMake(0, 10, ScreenWidth/3, 20) _string:@"" _lableFont:[UIFont systemFontOfSize:15] _lableTxtColor:[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1] _textAlignment:NSTextAlignmentCenter];
    self.lable1=[Unity lableViewAddsuperview_superView:self.contentView _subViewFrame:CGRectMake(ScreenWidth/3, 10, ScreenWidth/3, 20) _string:@"" _lableFont:[UIFont systemFontOfSize:15] _lableTxtColor:COLOR_SUHONG _textAlignment:NSTextAlignmentCenter];
    self.lable2=[Unity lableViewAddsuperview_superView:self.contentView _subViewFrame:CGRectMake(ScreenWidth/3*2, 10, ScreenWidth/3, 20) _string:@"" _lableFont:[UIFont systemFontOfSize:15] _lableTxtColor:COLOR_SUHONG _textAlignment:NSTextAlignmentCenter];
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
