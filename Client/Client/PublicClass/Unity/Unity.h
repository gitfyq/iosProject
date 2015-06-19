//
//  Unity.h
//  PowerOnHD
//
//  Created by Srain on 13-5-29.
//  Copyright (c) 2013年 lu yingzhi. All rights reserved.
//
#define COLOR_SHENHUI [UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:1]
#define COLOR_TIANLAN [UIColor colorWithRed:0/255.0f green:168/255.0f blue:241/255.0f alpha:1]
#define COLOR_SUHONG [UIColor colorWithRed:248.0f/255.0f green:95.0f/255.0f blue:82.0f/255.0f alpha:1]
#define tabbarheight 49
#define LEFT_BAR_BUTTON 1
#define RIGHT_BAR_BUTTON 2
#define CLIENT_TOKEN @"token"
#define PAGE_NUM 20 //翻页数量
#define PAGE_MAX_NUM 10000  //获取答题列表时的最大翻页数量
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
////登陆
//#define LOGIN_URL @"http://106.39.49.61:88/api/apimobilelogin?cardnumber=%@&password=%@"
////新闻
//#define NEWS_URL @"http://www.0car0.com/rss.php?rssid=34"
#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#include <mach/mach.h>
#import <QuartzCore/QuartzCore.h>
#import "TypeDefine.h"
#import "JZ_Animations.h"
#import "SGSaveFile.h"


#define RGB(R,G,B)\
 [UIColor colorWithRed:R/255.0F green:G/255.0F blue:B/255.0F alpha:1.0F]

@interface Unity : NSObject

+(UIColor*)getBackColor;
+(UIColor*)getTableItemSeleteColor;

+(NSDate *)stringToDate:(NSString *)string;
+(NSDate *)stringToTime:(NSString *)string;
+(NSDate *)stringToTimeMM:(NSString *)string;
+(NSString *)dateToString:(NSDate *)date;
+(NSString *)timeToString:(NSDate *)date;
+(NSString *)timeToMMString:(NSDate *)date;

//根据宽度和字体 自动计算文本高度
+(CGFloat) getLabelHeightWithWidth:(CGFloat)labelWidth andDefaultHeight:(CGFloat)labelDefaultHeight andFontSize:(CGFloat)fontSize andText:(NSString *)text;
+(NSString*)systemTime;     //系统时间
+(NSString*)systemTimeToMM;

//时间戳转换标准时间
+(NSString*)systemStampToTime:(NSString *)stamp;

//encodeURL只能用来对url中的component编码，不能用来对整个url进行编码。
+(NSString*)encodeURL:(NSString*) unescapedString;

//计算距离，把距离转换为公里，不足一公里为米
+(NSString*)systemMToKM:(NSString*)juli;

//获取文本颜色
+(UIColor *)getColor:(NSString *) stringToConvert;

//打印内存
+(void)logMemoryInfo;

//计算坐标比例X
+(CGFloat)countcoordinatesX:(CGFloat)numberX;
//计算坐标比例Y
+(CGFloat)countcoordinatesY:(CGFloat)numberY;

+(UIViewController*)getViewController:(UIView*)view;

+(NSString*)intToString:(int)temp;

+(void)toViewController:(UINavigationController*)navigationController withLastCount:(int)count;

+ (BOOL)isBlankString:(NSString *)string;

+(BOOL)verfierEmail:(NSString *)email;
+(BOOL)verfierPwd:(NSString*)password;
+(SystemVersionType)currentVersion;

+(void)removeHUDFromSuperview; //移除等待页面
+(void)showErrorAlert: (id)sender
              message: (NSString *) errorStr;//显示错误信息

+(void)showWarningAlert: (id)sender      //显示警告信息
                message: (NSString *) errorStr;

+(void)showOKAlert: (id)sender          //显示成功信息
           message: (NSString *) okStr;
+(void)showHUD:(NSString *) titleStr;   //显示等待框
// 包含
+ (BOOL) judgeRange:(NSArray*) _termArray Password:(NSString*) _password;

//条件
+ (NSString*) judgePasswordStrength:(NSString*) _password;

+(void)hideHUD;
+ (BOOL)isMobileNumber:(NSString *)mobileNum;

+(CGPoint) GetPointParentView:(UIView *)view;//计算相对高度

+(UILabel *)lableViewAddsuperview_superView:(UIView *)superview _subViewFrame:(CGRect)rect _string:(NSString *)string  _lableFont:(UIFont *)font _lableTxtColor:(UIColor *)color _textAlignment:(NSTextAlignment)alignment;

+(UIButton *)buttonAddsuperview_superView:(UIView *)superview _subViewFrame:(CGRect)rect _tag:(id)viewcontroller _action:(SEL)action _string:(NSString *)string _imageName:(NSString *)image;

+(UIImageView *)imageviewAddsuperview_superView:(UIView *)superview _subViewFrame:(CGRect)rect _imageName:(NSString *)image _backgroundColor:(UIColor *)color;
+(UIView *)backviewAddview_subViewFrame:(CGRect)rect _viewColor:(UIColor *)color;

+(UITextField *)textFieldAddSuperview_superView:(UIView *)superview
                                  _subViewFrame:(CGRect)rect
                                        _placeT:(NSString *)placeholder
                               _backgroundImage:(UIImage *)background
                                      _delegate:(id)delegate
                                      andSecure:(BOOL)ture
                             andBackGroundColor:(UIColor *)color;

//文件下载路径
+(NSString *)get_field_string;


//判断系统版本
+(int)osVersion;
//获取屏幕高度
+(float)screenHeight;
//获取屏幕宽度
+(float)screenwidth;
#pragma mark 设置控件圆角
+(void)setControls:(UIView *)Controls Radius:(float)radius;
#pragma mark 计算字符串需要多宽的laebl
+(CGFloat)getLabelWidthWithLabel:(UILabel *)label Text:(NSString *)text andFont:(UIFont *)font;


@end
