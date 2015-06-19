//
//  StarView.m
//  Client
//
//  Created by smile_faner on 15/6/5.
//  Copyright (c) 2015年 CC. All rights reserved.
//

#import "StarView.h"

@implementation StarView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setStarWithFloat:(CGFloat )starFloat
{
    UIImageView *backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"starB"]];
    backImageView.frame = self.bounds;
    [self addSubview:backImageView];
    
    CGFloat w = self.bounds.size.width/5 * starFloat;
    
    UIView *mView = [[UIView alloc] init];
    mView.frame = CGRectMake(0, 0, w, self.bounds.size.height);
    mView.clipsToBounds = YES;
    [self addSubview:mView];
    
    UIImageView *topImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"starA"]];
    topImageView.frame = self.bounds;
    [mView addSubview:topImageView];
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
