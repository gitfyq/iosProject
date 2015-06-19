//
//  HomeTableViewCell.m
//  Client
//
//  Created by smile_faner on 15/6/5.
//  Copyright (c) 2015年 CC. All rights reserved.
//

#import "HomeTableViewCell.h"

@implementation HomeTableViewCell
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
    self.lineLabel=[[UILabel alloc] initWithFrame:CGRectMake(21.5, 0, 2, self.contentView.frame.size.height)];
    self.lineLabel.backgroundColor=[UIColor colorWithRed:182.0f/255.0f green:182.0f/255.0f blue:182.0f/255.0f alpha:1];
    [self.contentView addSubview:self.lineLabel];
    self.leftImageView=[Unity imageviewAddsuperview_superView:self.contentView _subViewFrame:CGRectMake(10, 15, 25, 25) _imageName:@"图标01" _backgroundColor:nil];
    UIImageView *imageView=[Unity imageviewAddsuperview_superView:self.contentView _subViewFrame:CGRectMake(45, 10, ScreenWidth-45-10, 65) _imageName:@"" _backgroundColor:[UIColor whiteColor]];
    [Unity setControls:imageView Radius:4];
    self.nameLabel=[Unity lableViewAddsuperview_superView:imageView _subViewFrame:CGRectMake(10, 10, imageView.frame.size.width-20, 20) _string:@"用药提醒" _lableFont:[UIFont systemFontOfSize:16] _lableTxtColor:[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1] _textAlignment:NSTextAlignmentLeft];
    self.subtitleLable=[Unity lableViewAddsuperview_superView:imageView _subViewFrame:CGRectMake(10, 35, imageView.frame.size.width-20, 20) _string:@"8:00 请服用阿莫西林 头孢消炎药" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor colorWithRed:182.0f/255.0f green:182.0f/255.0f blue:182.0f/255.0f alpha:1] _textAlignment:NSTextAlignmentLeft];
    
    
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
