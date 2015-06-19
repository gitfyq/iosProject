//
//  SituationCell.h
//  Client
//
//  Created by apple on 15/6/9.
//  Copyright (c) 2015年 CC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StarView.h"

@interface SituationCell : UITableViewCell



@property(nonatomic,retain)UIImageView *leftImageView;
@property(nonatomic,retain)StarView *starView;
@property(nonatomic,retain)UILabel *nameLable;
@property(nonatomic,retain)UILabel *addressLable;

@end
