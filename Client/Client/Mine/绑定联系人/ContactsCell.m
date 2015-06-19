//
//  ContactsCell.m
//  Client
//
//  Created by apple on 15/6/9.
//  Copyright (c) 2015年 CC. All rights reserved.
//

#import "ContactsCell.h"

@implementation ContactsCell
{
    UILabel *name;
    UILabel *gender;
    UILabel *between;
    UILabel *phone;
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
    
    name = [Unity lableViewAddsuperview_superView:self.contentView _subViewFrame:CGRectMake(5, 10, 80, 20) _string:@"联系人姓名" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor colorWithRed:166/255.0f green:166/255.0f blue:166/255.0f alpha:1] _textAlignment:NSTextAlignmentRight];
    
    self.NameLabel = [Unity lableViewAddsuperview_superView:self.contentView _subViewFrame:CGRectMake(CGRectGetMaxX(name.frame)+5, 10, 200, 20) _string:@"马小磊" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor colorWithRed:140/255.0f green:140/255.0f blue:140/255.0f alpha:1] _textAlignment:NSTextAlignmentLeft];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(name.frame)+5, CGRectGetMaxY(name.frame)+10,  KW - 90, 0.5)];
    view.backgroundColor = [UIColor colorWithRed:245/255.0f green:245/255.0f blue:245/255.0f alpha:245/255.0f];
    [self.contentView addSubview:view];
    
    
    gender = [Unity lableViewAddsuperview_superView:self.contentView _subViewFrame:CGRectMake(5, CGRectGetMaxY(name.frame)+20, 80, 20) _string:@"性别" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor colorWithRed:166/255.0f green:166/255.0f blue:166/255.0f alpha:1] _textAlignment:NSTextAlignmentRight];
    
    self.GenderLabel = [Unity lableViewAddsuperview_superView:self.contentView _subViewFrame:CGRectMake(CGRectGetMaxX(gender.frame)+5, CGRectGetMaxY(name.frame)+20, 200, 20) _string:@"男" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor colorWithRed:140/255.0f green:140/255.0f blue:140/255.0f alpha:1] _textAlignment:NSTextAlignmentLeft];
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(gender.frame)+5, CGRectGetMaxY(gender.frame)+10,  KW - 90, 0.5)];
    view1.backgroundColor = [UIColor colorWithRed:245/255.0f green:245/255.0f blue:245/255.0f alpha:245/255.0f];
    [self.contentView addSubview:view1];
    
    
    between = [Unity lableViewAddsuperview_superView:self.contentView _subViewFrame:CGRectMake(5, CGRectGetMaxY(gender.frame)+20, 80, 20) _string:@"所属关系" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor colorWithRed:166/255.0f green:166/255.0f blue:166/255.0f alpha:1] _textAlignment:NSTextAlignmentRight];
    
    self.BetweenLabel = [Unity lableViewAddsuperview_superView:self.contentView _subViewFrame:CGRectMake(CGRectGetMaxX(between.frame)+5, CGRectGetMaxY(gender.frame)+20, 200, 20) _string:@"父子" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor colorWithRed:140/255.0f green:140/255.0f blue:140/255.0f alpha:1] _textAlignment:NSTextAlignmentLeft];
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(between.frame)+5, CGRectGetMaxY(between.frame)+10, KW - 90, 0.5)];
    view2.backgroundColor = [UIColor colorWithRed:245/255.0f green:245/255.0f blue:245/255.0f alpha:245/255.0f];
    [self.contentView addSubview:view2];


    
    phone = [Unity lableViewAddsuperview_superView:self.contentView _subViewFrame:CGRectMake(5, CGRectGetMaxY(between.frame)+20, 80, 20) _string:@"联系人电话" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor colorWithRed:166/255.0f green:166/255.0f blue:166/255.0f alpha:1] _textAlignment:NSTextAlignmentRight];
    
    self.PhoneLabel = [Unity lableViewAddsuperview_superView:self.contentView _subViewFrame:CGRectMake(CGRectGetMaxX(phone.frame)+5, CGRectGetMaxY(between.frame)+20, 200, 20) _string:@"2345678456" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor colorWithRed:140/255.0f green:140/255.0f blue:140/255.0f alpha:1] _textAlignment:NSTextAlignmentLeft];
    
  


    
}



@end
