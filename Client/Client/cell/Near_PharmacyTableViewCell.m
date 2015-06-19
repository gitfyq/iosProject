//
//  Near_PharmacyTableViewCell.m
//  Client
//
//  Created by smile_faner on 15/6/5.
//  Copyright (c) 2015年 CC. All rights reserved.
//

#import "Near_PharmacyTableViewCell.h"

@implementation Near_PharmacyTableViewCell
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
    self.leftImageView=[Unity imageviewAddsuperview_superView:self.contentView _subViewFrame:CGRectMake(10, 12, 96, 96-24) _imageName:@"" _backgroundColor:[UIColor grayColor]];
    [Unity setControls:self.leftImageView Radius:4];
    CGFloat f=self.leftImageView.frame.size.width+10+self.leftImageView.frame.origin.x;
    self.nameLable=[Unity lableViewAddsuperview_superView:self.contentView _subViewFrame:CGRectMake(f, 15, ScreenWidth-f, 20) _string:@"" _lableFont:[UIFont systemFontOfSize:16] _lableTxtColor:COLOR_SHENHUI _textAlignment:NSTextAlignmentLeft];
    self.starView=[[StarView alloc] initWithFrame:CGRectMake(f, self.nameLable.frame.origin.y+20+5, 79, 13)];
    [self.contentView addSubview:self.starView];
    [Unity imageviewAddsuperview_superView:self.contentView _subViewFrame:CGRectMake(f, self.starView.frame.origin.y+23, 12, 14) _imageName:@"发现_附近药店_位置icon" _backgroundColor:nil];
    self.addressLable=[Unity lableViewAddsuperview_superView:self.contentView _subViewFrame:CGRectMake(f+15, self.starView.frame.origin.y+21, ScreenWidth-f, 20) _string:@"" _lableFont:[UIFont systemFontOfSize:13] _lableTxtColor:[UIColor grayColor] _textAlignment:NSTextAlignmentLeft];
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
