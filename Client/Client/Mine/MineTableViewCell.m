//
//  MineTableViewCell.m
//  Client
//
//  Created by apple on 15/6/3.
//  Copyright (c) 2015年 CC. All rights reserved.
//

#import "MineTableViewCell.h"

@implementation MineTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self addAllViews];
    }
    return self;
}

- (void)addAllViews
{
    UIImageView *headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 60, 60)];
    headImageView.image = [UIImage imageNamed:@"我_头像_图标"];
    [self.contentView addSubview:headImageView];
    
    UILabel *username = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(headImageView.frame) + 15, 20, 100, 20)];
    username.text = @"李晓红";
    [self.contentView addSubview:username];
    
    UILabel *userMark = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(headImageView.frame) + 15, CGRectGetMaxY(username.frame) + 10, 100, 15)];
    userMark.text = @"积分：0";
    userMark.textColor = [UIColor grayColor];
    userMark.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:userMark];
    
    UIImageView *informationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX([UIScreen mainScreen].bounds) - 100, 25, 80, 30)];
    informationImageView.image = [UIImage imageNamed:@"我_资料按钮"];
    [self.contentView addSubview:informationImageView];
}

@end
