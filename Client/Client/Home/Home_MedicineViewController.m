//
//  Home_MedicineViewController.m
//  Client
//
//  Created by smile_faner on 15/6/4.
//  Copyright (c) 2015年 CC. All rights reserved.
//

#import "Home_MedicineViewController.h"
#import "HcCustomKeyboard.h"
@interface Home_MedicineViewController ()

@end

@implementation Home_MedicineViewController
{
    UILabel *label;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addTitleView:self.titleString];
    [self addItem:@"" imageName:@"jiantou" actoion:@selector(backClick) position:LEFT_BAR_BUTTON];

    label=[Unity lableViewAddsuperview_superView:self.view _subViewFrame:CGRectMake(0, 100, ScreenWidth, 100) _string:@"111111111111111111111111111111111111111122222222222222222222222222222333333333333333333333333333333333333344444444444444444444444444444444444555555555555555555555555555555555555555555566666666666666666666666666666677777777777777777777777777777777788888888888888888888888888888888888888999999999999999999999999999999999999000000000000000000000000000000000" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor blackColor] _textAlignment:NSTextAlignmentLeft];
    label.backgroundColor=[UIColor orangeColor];
    label.numberOfLines=0;
    //label.lineBreakMode = UILineBreakModeWordWrap;
//    label.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;
//    label.layer.borderColor = [[UIColor grayColor] CGColor];
//    label.layer.borderWidth = 2;
    CGFloat f=[Unity getLabelHeightWithWidth:ScreenWidth andDefaultHeight:0 andFontSize:14 andText:label.text];
    if (f>100) {
        label.adjustsFontSizeToFitWidth = YES;
    }
    NSLog(@"高度呢%f",f);
    label.frame=CGRectMake(0, 100, ScreenWidth, 200);
    UITapGestureRecognizer* singleRecognizer;
    singleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(homeImageViewSingleTap)];
    //点击的次数
    singleRecognizer.numberOfTapsRequired = 1; // 单击
    //点击的手指数
    singleRecognizer.numberOfTouchesRequired = 1;
    //给view添加一个手势监测；
    [label addGestureRecognizer:singleRecognizer];
    [[HcCustomKeyboard customKeyboard]textViewShowView:self customKeyboardDelegate:self];

    
}
-(void)homeImageViewSingleTap{
    [[HcCustomKeyboard customKeyboard].mTextView becomeFirstResponder];
}
-(void)talkBtnClick:(UITextView *)textViewGet
{
    NSLog(@"%@",textViewGet.text);
}
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{

    return YES;
}
-(void)textViewDidBeginEditing:(UITextView *)textView{
    
}
#pragma mark-once 触摸手势关闭键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
-(void)btn{

    [[HcCustomKeyboard customKeyboard].mTextView becomeFirstResponder];
    [HcCustomKeyboard customKeyboard].mTextView.text=@"中国人";
}
-(void)backClick{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
