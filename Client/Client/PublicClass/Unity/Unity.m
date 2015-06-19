//
//  Unity.m
//  PowerOnHD
//
//  Created by Srain on 13-5-29.
//  Copyright (c) 2013年 lu yingzhi. All rights reserved.
//

#import "Unity.h"
#import "AppDelegate.h"
#import "sys/utsname.h"
#import "JZ_Animations.h"

@implementation Unity

+(UIColor*)getBackColor
{
    return [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
}
+(UIColor*)getTableItemSeleteColor
{
    return [UIColor colorWithRed:229/255.0 green:229/255.0 blue:229/255.0 alpha:1.0];
}
+(NSDate *)stringToDate:(NSString *)string
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy-MM-dd"];
    NSDate *destDate= [dateFormatter dateFromString:string];
    return destDate;
}
+(NSDate *)stringToTime:(NSString *)string
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
    NSDate *destDate= [dateFormatter dateFromString:string];
    return destDate;
}
+(NSDate *)stringToTimeMM:(NSString *)string
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm"];
    NSDate *destDate= [dateFormatter dateFromString:string];
    return destDate;
}
+(NSString *)dateToString:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    return destDateString;
}
+(NSString *)timeToString:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    return destDateString;
}
+(NSString *)timeToMMString:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    return destDateString;
}

+(CGFloat) getLabelHeightWithWidth:(CGFloat)labelWidth andDefaultHeight:(CGFloat)labelDefaultHeight andFontSize:(CGFloat)fontSize andText:(NSString *)text
{
	CGSize constraint = CGSizeMake(labelWidth, 20000.0f);
	
	CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
	
	CGFloat labelHeight = MAX(size.height, labelDefaultHeight);
	
	return labelHeight;
}
+(NSString*)systemTime
{
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init] ;
	[dateFormatter setDateStyle:NSDateFormatterMediumStyle];
	[dateFormatter setTimeStyle:NSDateFormatterShortStyle];
	[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
	return [dateFormatter stringFromDate:[NSDate date]];
}

+(NSString*)systemTimeToMM
{
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateStyle:NSDateFormatterMediumStyle];
	[dateFormatter setTimeStyle:NSDateFormatterShortStyle];
	[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
	return [dateFormatter stringFromDate:[NSDate date]];
}

//时间戳转换标准时间
+(NSString*)systemStampToTime:(NSString *)stamp
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[stamp doubleValue]];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init] ;
	[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    
    return [dateFormatter stringFromDate:date];
}

//计算距离，把距离转换为公里，不足一公里为米
+(NSString*)systemMToKM:(NSString*)juli
{
    CGFloat height = [juli floatValue];
    if (height<1000 && height>=0) {
        return [NSString stringWithFormat:@"%.0fm",height];
    }else{
        return [NSString stringWithFormat:@"%.0fkm",height/1000];
    }
}

//encodeURL只能用来对url中的component编码，不能用来对整个url进行编码。
//+(NSString*)encodeURL:(NSString*) unescapedString
//{
//    NSString* escapedUrlString= (NSString*) CFURLCreateStringByAddingPercentEscapes(NULL,(CFStringRef)unescapedString, NULL,(CFStringRef)@"!*'();:@&=+$,/?%#[]{}", kCFStringEncodingUTF8 );
//        
//    return [escapedUrlString ;
//}

- (NSString *)decodeFromPercentEscapeString: (NSString *) input
{
    NSMutableString *outputStr = [NSMutableString stringWithString:input];
    [outputStr replaceOccurrencesOfString:@"+"
                               withString:@" "
                                  options:NSLiteralSearch
                                    range:NSMakeRange(0, [outputStr length])];
    
    return [outputStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}


+(UIColor *)getColor:(NSString *) stringToConvert
{
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    
    if ([cString length] < 6) return [UIColor blackColor];
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor blackColor];
    
    // Separate into r, g, b substrings
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

static BOOL memoryInfo(vm_statistics_data_t *vmStats)
{
    mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
    kern_return_t kernReturn = host_statistics(mach_host_self(), HOST_VM_INFO, (host_info_t)vmStats, &infoCount);
    
    return kernReturn == KERN_SUCCESS;
}


+(void)logMemoryInfo
{
    vm_statistics_data_t vmStats;
    
    if (memoryInfo(&vmStats)) {
        NSLog(@"free: %lf M\nactive: %u\ninactive: %u\nwire: %u\nzero fill: %u\nreactivations: %u\npageins: %u\npageouts: %u\nfaults: %u\ncow_faults: %u\nlookups: %u\nhits: %u",
              (vmStats.free_count * vm_page_size/ 1024.0) / 1024.0,
              vmStats.active_count * vm_page_size,
              vmStats.inactive_count * vm_page_size,
              vmStats.wire_count * vm_page_size,
              vmStats.zero_fill_count * vm_page_size,
              vmStats.reactivations * vm_page_size,
              vmStats.pageins * vm_page_size,
              vmStats.pageouts * vm_page_size,
              vmStats.faults,
              vmStats.cow_faults,
              vmStats.lookups,
              vmStats.hits
              );
        
    }
}

//计算坐标比例
+(CGFloat)countcoordinatesX:(CGFloat)numberX
{
    CGFloat percentage = numberX / 320;  //百分比
    return [UIScreen mainScreen].bounds.size.width * percentage;
}

//计算坐标比例Y
+(CGFloat)countcoordinatesY:(CGFloat)numberY
{
    CGFloat percentage = numberY / 558;  //百分比
    return [UIScreen mainScreen].bounds.size.height * percentage;
}

+(BOOL)strToBool:(NSString*)str
{
    BOOL result = NO;
    if ([str intValue] == 0 || [str isEqualToString:@"false"]) {
        result = NO;
    }else if ([str intValue] == 1 || [str isEqualToString:@"true"]){
        result = YES;
    }
    return result;
}
+(UIViewController*)getViewController:(UIView*)view {
    
    for (UIView* next = [view superview]; next; next = next.superview) {
        
        UIResponder* nextResponder = [next nextResponder];
        
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            
            return (UIViewController*)nextResponder;
            
        }
        
    }
    
    return nil;
    
}
+(NSString*)intToString:(int)temp
{
    return [NSString stringWithFormat:@"%d",temp];
}

+(void)toViewController:(UINavigationController*)navigationController withLastCount:(int)count
{
    int nvcount = [navigationController.viewControllers count];
    if (count>=0 &&  nvcount >= count) {
        UIViewController* tempviewController = [navigationController.viewControllers objectAtIndex:([navigationController.viewControllers count]-count)];
        if (tempviewController!=nil) {
            [navigationController popToViewController:tempviewController animated:YES];
        }
    }
    
}

+ (BOOL)isBlankString:(NSString *)string
{
    
    if (string == nil) {
        
        return YES;
        
    }
    
    if (string == NULL) {
        
        return YES;
        
    }
    
    if ([string isKindOfClass:[NSNull class]]) {
        
        return YES;
        
    }
    
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0) {
        
        return YES;
        
    }
    
    return NO;
    
}

//验证email
+(BOOL)verfierEmail:(NSString *)email
{
    BOOL result = YES;
    
    NSString* regex = @"(^\\s*([A-Za-z0-9_-]+(\\.\\w+)*@(\\w+\\.)+\\w{2,5})\\s*$)";
    
    NSPredicate* pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    
    result = [pred evaluateWithObject:email];
    
    return result;
}

//验证是否都是数字

//验证6-18位字母或数字的密码
+(BOOL)verfierPwd:(NSString*)password
{
    BOOL result = YES;
    
    if (password.length <6 || password.length >18) {
        result = NO;
    }
    
    return result;
}

//验证字母和数字
+ (BOOL) judgeRange:(NSArray*) _termArray Password:(NSString*) _password
{
    NSRange range;
    BOOL result =NO;
    for(int i=0; i<[_termArray count]; i++)
    {
        range = [_password rangeOfString:[_termArray objectAtIndex:i]];
        if(range.location != NSNotFound)
        {
            result =YES;
        }
    }
    return result;
}
//条件
+ (NSString*) judgePasswordStrength:(NSString*) _password
{
    NSMutableArray* resultArray = [[NSMutableArray alloc] init];
    
    NSArray* termArray1 = [[NSArray alloc] initWithObjects:@"a", @"b", @"c", @"d", @"e", @"f", @"g", @"h", @"i", @"j", @"k", @"l", @"m", @"n", @"o", @"p", @"q", @"r", @"s", @"t", @"u", @"v", @"w", @"x", @"y", @"z", nil];
    NSArray* termArray2 = [[NSArray alloc] initWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"0", nil];
    NSArray* termArray3 = [[NSArray alloc] initWithObjects:@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z", nil];
    NSArray* termArray4 = [[NSArray alloc] initWithObjects:@"~",@"`",@"@",@"#",@"$",@"%",@"^",@"&",@"*",@"(",@")",@"-",@"_",@"+",@"=",@"{",@"}",@"[",@"]",@"|",@":",@";",@"“",@"'",@"‘",@"<",@",",@".",@">",@"?",@"/",@"、", nil];
    
    NSString* result1 = [NSString stringWithFormat:@"%d",[self judgeRange:termArray1 Password:_password]];
    NSString* result2 = [NSString stringWithFormat:@"%d",[self judgeRange:termArray2 Password:_password]];
    NSString* result3 = [NSString stringWithFormat:@"%d",[self judgeRange:termArray3 Password:_password]];
    NSString* result4 = [NSString stringWithFormat:@"%d",[self judgeRange:termArray4 Password:_password]];
    
    [resultArray addObject:[NSString stringWithFormat:@"%@",result1]];
    [resultArray addObject:[NSString stringWithFormat:@"%@",result2]];
    [resultArray addObject:[NSString stringWithFormat:@"%@",result3]];
    [resultArray addObject:[NSString stringWithFormat:@"%@",result4]];
    
    int intResult=0;
    for (int j=0; j<[resultArray count]; j++)
    {
        if ([[resultArray objectAtIndex:j] isEqualToString:@"1"])
        {
            intResult++;
        }
    }
    NSString* resultString = [[NSString alloc] init];
    //    if intResult << span style="color:#2832cf">2)
    //    {
    //        resultString = @"密码强度低，建议修改";
    //    }
    if (intResult == 2&&[_password length]>=6)
    {
        resultString = @"密码强度一般";
    }
    if (intResult > 2&&[_password length]>=6)
    {
        resultString = @"密码强度高";
    }
    return resultString;
}



//验证手机号码
+ (BOOL)isMobileNumber:(NSString *)mobileNum
{
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

+(SystemVersionType)currentVersion;
{
    double version = [[UIDevice currentDevice].systemVersion doubleValue];//判定系统版本。
    if (version>=5.0f && version<6.0f) {
        return ios5;
    }else
        if (version>=6.0f && version<7.0f) {
            return ios6;
        }else if (version >=7.0f){
            
            return ios7;
        }
    return noVersion;
}

+(void)removeHUDFromSuperview
{
	NSMutableArray *subviewsArr = [[NSMutableArray alloc ] initWithCapacity:3];
	for (UIView *v in [[[UIApplication sharedApplication] keyWindow] subviews])
	{
		if ([v isKindOfClass:[MBProgressHUD class]])
		{
			[subviewsArr addObject:v];
		}
	}
	for (UIView *review in subviewsArr)
	{
		[review removeFromSuperview];
	}
}

+(void)showErrorAlert: (id)sender
              message: (NSString *) errorStr
{
    UIView * view = (UIView *)sender;
    UIWindow * w = view.window;
	[Unity removeHUDFromSuperview];
	if ([AppDelegate instance].HUD == nil)
	{
//		[AppDelegate instance].HUD =[[[MBProgressHUD alloc] initWithView:[[UIApplication sharedApplication] keyWindow]] autorelease];
        [AppDelegate instance].HUD =[[MBProgressHUD alloc] initWithView:w] ;
	}
	
	MBProgressHUD *hud =  [AppDelegate instance].HUD ;
	
	//特殊情况
    [w addSubview:hud];
    
//	[[[UIApplication sharedApplication] keyWindow] addSubview:hud];

	hud.delegate = [AppDelegate instance];
	hud.yOffset = -40;
	hud.customView = [[UIImageView alloc] initWithImage:
                       [UIImage imageNamed:@"37x-Checkmark_error.png"]];
	hud.mode = MBProgressHUDModeCustomView;
	hud.labelText = errorStr;
	[hud showWhileExecuting:@selector(waitForTwoSeconds)
                   onTarget:[AppDelegate instance] withObject:nil animated:YES];
}
+(void)showWarningAlert: (id)sender
                message: (NSString *) errorStr
{
    UIView * view = (UIView *)sender;
    UIWindow * w = view.window;
    [Unity removeHUDFromSuperview];
	if ([AppDelegate instance].HUD == nil)
	{
//		[AppDelegate instance].HUD =[[[MBProgressHUD alloc] initWithView:[[UIApplication sharedApplication] keyWindow]] autorelease];
        [AppDelegate instance].HUD =[[MBProgressHUD alloc] initWithView:w];
	}
	
	MBProgressHUD *hud =  [AppDelegate instance].HUD ;
	[w addSubview:hud];
	
//	[[[UIApplication sharedApplication] keyWindow] addSubview:hud];
	hud.delegate = [AppDelegate instance];
	hud.yOffset = -40;
	hud.customView = [[UIImageView alloc] initWithImage:
                       [UIImage imageNamed:@"37x-Checkmark_gantan.png"]];
	hud.mode = MBProgressHUDModeCustomView;
	hud.labelText = errorStr;
	[hud showWhileExecuting:@selector(waitForTwoSeconds)
                   onTarget:[AppDelegate instance] withObject:nil animated:YES];
}
+(void)showOKAlert: (id)sender
           message: (NSString *) okStr
{
    UIView * view = (UIView *)sender;
    UIWindow * w = view.window;
	[Unity removeHUDFromSuperview];
	if ([AppDelegate instance].HUD == nil)
	{
//		[AppDelegate instance].HUD =[[[MBProgressHUD alloc] initWithView:[[UIApplication sharedApplication] keyWindow]] autorelease];
        [AppDelegate instance].HUD =[[MBProgressHUD alloc] initWithView:w];
	}
	
	MBProgressHUD *hud =  [AppDelegate instance].HUD ;
	[w addSubview:hud];
	
//	[[[UIApplication sharedApplication] keyWindow] addSubview:hud];
	hud.delegate = [AppDelegate instance];
	hud.yOffset = -40;
	hud.customView = [[UIImageView alloc] initWithImage:
                       [UIImage imageNamed:@"37x-Checkmark.png"]];
	hud.mode = MBProgressHUDModeCustomView;
	hud.labelText = okStr;
	[hud showWhileExecuting:@selector(waitForTwoSeconds)
                   onTarget:[AppDelegate instance] withObject:nil animated:YES];
}
+(void)showHUD:(NSString *) titleStr
{
    
	[Unity removeHUDFromSuperview];
//	UIWindow * keyWin = [[UIApplication sharedApplication] keyWindow];
    UIWindow * keyWin = [[UIApplication sharedApplication].windows objectAtIndex:0];
	if (keyWin != nil)
	{
		MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:keyWin animated:YES coverType:PROGRESS_HUD_TYPE_COVER];
		HUD.labelText = titleStr;
		HUD.yOffset = -40;
	}
	return;
}

+(void)hideHUD
{
//	UIWindow * keyWin = [[UIApplication sharedApplication] keyWindow];
    UIWindow * keyWin = [[UIApplication sharedApplication].windows objectAtIndex:0];
	if (keyWin != nil)
	{
		[MBProgressHUD hideHUDForView:keyWin animated:YES];
	}
	return;
}

+(CGPoint) GetPointParentView:(UIView *)view
{
    CGPoint size = CGPointMake(0, 0);
    id le=[view superview];
    while (le != nil) {
        CGPoint tempsize=(((UIView *)le).frame).origin;
        if(tempsize.x > 0 || tempsize.y>0)
        {
            size.x+=tempsize.x;
            size.y+=tempsize.y;
            le=[le superview];
        }
    }
    return size;
}

+(UILabel *)lableViewAddsuperview_superView:(UIView *)superview _subViewFrame:(CGRect)rect _string:(NSString *)string _lableFont:(UIFont *)font _lableTxtColor:(UIColor *)color _textAlignment:(NSTextAlignment)alignment
{
    UILabel *lable = [[UILabel alloc]initWithFrame:rect];
    lable.backgroundColor = [UIColor clearColor];
    lable.text = string;
    lable.font = font;
    lable.textColor = color;
    lable.textAlignment = alignment;
    [superview addSubview:lable];
    
    return lable;
}

+(UIButton *)buttonAddsuperview_superView:(UIView *)superview _subViewFrame:(CGRect)rect _tag:(id)viewcontroller _action:(SEL)action _string:(NSString *)string _imageName:(NSString *)image
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = rect;
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setTitle:string forState:UIControlStateNormal];
    if(viewcontroller != nil)
        [button addTarget:viewcontroller action:action forControlEvents:UIControlEventTouchUpInside];
    [superview addSubview:button];
    
    return button;
}

+(UILabel *)lableViewAddsuperview_superView:(UIView *)superview _subViewFrame:(CGRect)rect _string:(NSString *)string _lableFont:(UIFont *)font _lableTxtColor:(UIColor *)color
{
    UILabel *lable = [[UILabel alloc]initWithFrame:rect];
    lable.backgroundColor = [UIColor clearColor];
    lable.text = string;
    lable.font = font;
    lable.textColor = color;
    
    [superview addSubview:lable];
    
    return lable;
}

+(UITextField *)textFieldAddSuperview_superView:(UIView *)superview
                                  _subViewFrame:(CGRect)rect
                                        _placeT:(NSString *)placeholder
                               _backgroundImage:(UIImage *)background
                                      _delegate:(id)delegate
                                      andSecure:(BOOL)ture
                             andBackGroundColor:(UIColor *)color
{
    UITextField * textfield = [[UITextField alloc] initWithFrame:rect];
    if (placeholder != nil)
        textfield.placeholder = placeholder;
    if (background != nil)
        textfield.background = background;
    textfield.delegate = delegate;
    textfield.secureTextEntry = ture;
    textfield.backgroundColor = color;
    [superview addSubview:textfield];
    return textfield;
}

+(UIView *)backviewAddview_subViewFrame:(CGRect)rect _viewColor:(UIColor *)color
{
    UIView *subview = [[UIView alloc]initWithFrame:rect];
    subview.backgroundColor = color;
    
    return subview;
}

//文件下载路径
+(NSString *)get_field_string
{
    NSString *string = [SGSaveFile getObjectFromSystemWithKey:@"apilistDic"];
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers|NSJSONReadingMutableLeaves error:nil];
    return [dic objectForKey:@"filedownurl"];
}
#pragma mark 动画
+(void)getAnimations:(NSString *)type Second:(NSInteger)count View:(UIView *)view Frame:(CGRect)frame{
    [UIView beginAnimations:type context:NULL];
    [UIView setAnimationDuration:count];
    view.frame=frame;
    [UIView commitAnimations];
    
}
+(UIImageView *)imageviewAddsuperview_superView:(UIView *)superview _subViewFrame:(CGRect)rect _imageName:(NSString *)image _backgroundColor:(UIColor *)color
{
    UIImageView *imageview = [[UIImageView alloc]initWithFrame:rect];
    if(image != nil && image.length>0)
        imageview.image = [UIImage imageNamed:image];
    else if(color != nil)
        imageview.backgroundColor = color;
    [superview addSubview:imageview];
    
    return imageview;
}

+(int)osVersion
{
    return [[[UIDevice currentDevice] systemVersion] intValue];
}

+(float)screenHeight
{
    return [[UIScreen mainScreen] bounds].size.height;
}

+(float)screenwidth
{
    return [[UIScreen mainScreen] bounds].size.width;
}
#pragma mark 设置控件圆角
+(void)setControls:(UIView *)Controls Radius:(float)radius{
    Controls.layer.MasksToBounds = YES;
    Controls.layer.cornerRadius =radius;
    
}
/*
 UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 20, 20)];
 label.font = [UIFont boldSystemFontOfSize:20.0f];  //UILabel的字体大小
 label.numberOfLines = 0;  //必须定义这个属性，否则UILabel不会换行
 label.textColor = [UIColor whiteColor];
 label.textAlignment = NSTextAlignmentLeft;  //文本对齐方式
 [label setBackgroundColor:[UIColor redColor]];
 
 //高度固定不折行，根据字的多少计算label的宽度
 NSString *str = self.infoItem.PileName;
 CGSize size = [str sizeWithFont:label.font constrainedToSize:CGSizeMake(MAXFLOAT, label.frame.size.height)];
 NSLog(@"size.width=%f, size.height=%f", size.width, size.height);
 //根据计算结果重新设置UILabel的尺寸
 [label setFrame:CGRectMake((ScreenWidth-size.width)/2, 140, size.width, 30)];
 label.text = str;
 */

#pragma mark 计算字符串需要多宽的laebl
+(CGFloat)getLabelWidthWithLabel:(UILabel *)label Text:(NSString *)text andFont:(UIFont *)font{
    //必须定义这个属性，否则UILabel不会换行
    label.numberOfLines = 0;
    CGSize size = [text sizeWithFont:label.font constrainedToSize:CGSizeMake(MAXFLOAT, label.frame.size.height)];
    return size.width;
}
@end
