//
//  Header.h
//  STeBook
//
//  Created by Srain on 13-8-29.
//  Copyright (c) 2013年 rain. All rights reserved.
//

#define NavigationBarHeight   50

#define KWindowWidth 320
#define KWindowHeight [UIScreen mainScreen].bounds.size.height

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define IS_IPAD ([[UIDevice currentDevice] respondsToSelector:@selector(userInterfaceIdiom)] && [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)

#define KVersion @"v2"
#define KAPPName @"WoBan"
#define KSystem  @"ios"


#define CBASEADDRESS @"http://122.115.50.74:89/api.php?"

#define KH [[UIScreen mainScreen] bounds].size.height
#define KW [[UIScreen mainScreen] bounds].size.width

#define NSLog(FORMAT, ...) fprintf(stderr,"☀️【%s:%d行】☀️ %s\n %s\n\n\n\n\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __func__,[[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

// http://123.57.231.12:82/api.php?
//


//登录接口
#define LOGIN_URL @"http://123.57.231.12:82/api.php?a=login&mobile=%@&password=%@"

//http://122.115.50.74:89/api.php?a=getarealist&id=110000&suball=1
//注册接口

#define Registration_URL @"http://123.57.231.12:82/api.php?a=reg&mobile=%@&password=%@&sms_code=%@&idcard=%@"

//验证码
#define Verification_URL @"http://123.57.231.12:82/api.php?a=getMobilecode&mobile=%@"

//修改密码
#define Forget_URL @"http://123.57.231.12:82/api.php?a=changepwd&token=%@&new_password=%@&old_password=%@"

//地区列表
#define Region_URL @"http://123.57.231.12:82/api.php?a=getarealist"
//获取下一级地区列表
#define NextRegion_URL @"http://123.57.231.12:82/api.php?a=getarealist&id=%@&suball=%@"

//http://192.168.1.111:8080/7ishere/user/saveImg?userName=xgk2059&imgStr=1111&imgName=122
//头像接口
#define Head_URL @"http://123.57.231.12:82/api.php?userName=%@&imgStr=%@&imgName=%@"

//获取文章列表
#define messege_URL @"http://123.57.231.12:82/api.php?a=getArtList"

//获取文章详情
#define message_details_URL @"http://123.57.231.12:82/api.php?a=getArtInfo"
//修改密码
#define newPass_URL @"http://123.57.231.12:82/api.php?a=changepwd&token=%@&new_password=%@&old_password=%@"

//获取医生列表
#define Mydoctor_URL @"http://123.57.231.12:82/api.php?a=mydoctors&token=%@&page=%@&kw=%@"

//http://123.57.231.12:82/api.php?a=mydoctors&token=1_68e499d8eddbb668051f7dc9e3d64f55&page=1&kw=quanbu

//获取医生的预约点列表
#define DoctorTime_URL @"http://123.57.231.12:82/api.php?a=getDoctorTimeitems&token=%@&doctor_id=%@"


//添加预约医生记录
#define AddOrderMlog_URL @"http://123.57.231.12:82/api.php"


//删除预约医生记录
#define RemoveOrderMlog_URL @"http://123.57.231.12:82/api.php?a=removeOrderMlog&token=%@&omid=%@"


//我的医生记录列表
#define MyOrderMlogd_URL @"http://123.57.231.12:82/api.php?a=myOrderMlogs&token=%@&page=%@"


//获取用户健康一般情况
#define GetUserGeneral_URL @"http://123.57.231.12:82/api.php?a=getusergeneral&token=%@"

//修改用户健康一般情况
#define UpUserGeneral_URL @"http://123.57.231.12:82/api.php?a=updateusergeneral&token=%@&body_t=%@&breathe_freq=%@&height=%@&pulse_rate=%@&blood_pressure=%@&weight=%@"


//获取用户健康病史
#define GetUserSick_URL @"http://123.57.231.12:82/api.php?a=getusersick&token=%@"

//修改用户健康病史
#define UpUserSick_URL @"http://123.57.231.12:82/api.php?a=updateusersick&token=%@&self_history=%@&family_history=%@&genetic_history=%@&disability_history=%@"

//获取用户生活方式
#define GetUserLife_URL @"http://123.57.231.12:82/api.php?a=getuserlife&token=%@"

//修改用户生活方式
#define UpUserLife_URL @"http://123.57.231.12:82/api.php?a=updateuserlife&token=%@&pe=%@&food=%@&smoke=%@&drink=%@"



//获取用户心情记录列表历史
#define GetLogMoods_URL  @"http://123.57.231.12:82/api.php?a=getLogMoods&token=%@&page=%@"


//获取用户心情记录
#define getLogMood_URL @"http://123.57.231.12:82/api.php?a=getLogMood&token=%@&log_time=%@"

//添加/修改用户心情记录
#define UpdateLogMood_URL @"http://123.57.231.12:82/api.php?a=updateLogMood&token=%@&log_time=%@&val=%@&memo=%@"

//获取用户体重记录列表历史
#define GetLogWeights_URL @"http://123.57.231.12:82/api.php?a=getLogWeights&token=%@&page=%@"

//获取用户体重记录
#define getLogWeight_URL @"http://123.57.231.12:82/api.php?a=getLogWeight&token=%@&log_time=%@"


//添加/修改用户体重记录列表
#define UpdateLogWeight_URL @"http://123.57.231.12:82/api.php?a=updateLogWeight&token=%@&log_time=%@&val=%@&memo=%@"


//获取用户睡眠记录列表历史
#define GetLogSleeps_URL @"http://123.57.231.12:82/api.php?a=getLogSleeps&token=%@&page=%@"

//获取用户睡眠记录
#define GetLogSleep_URL @"http://123.57.231.12:82/api.php?a=getLogSleep&token=%@log_time=%@"

//添加/修改用户睡眠记录列表
#define UpdateLogSleep_URL @"http://123.57.231.12:82/api.php?a=updateLogSleep&token=%@&log_time=%@&val_sleep=%@&val_wake=%@&memo=%@"

//获取用户运动记录列表历史
#define GetLogSports_URL @"http://123.57.231.12:82/api.php?a=getLogSports&token=%@&page=%@"

//获取用户运动记录
#define GetLogSport_URL @"http://123.57.231.12:82/api.php?a=getLogSport&token=%@&log_time=%@"

//添加/修改用户运动记录
#define UpdateLogSport_URL @"http://123.57.231.12:82/api.php?a=updateLogSport&token=%@&log_time=%@&val_type=%@&val_minutes=%@&memo=%@"

//获取用户血糖记录列表历史
#define GetLogBloods_URL @"http://123.57.231.12:82/api.php?a=getLogBloods&token=%@&page=%@"

//获取用户血糖记录
#define GetLogBlood_URL @"http://123.57.231.12:82/api.php?a=getLogBlood&token=%@&log_time=%@"

//添加/修改用户血糖记录
#define UpdateLogBlood_URL @"http://123.57.231.12:82/api.php?a=updateLogBlood&token=%@&log_time=%@&val_morning_before_eat=%@&val_morning_end_eat=%@&val_noon_before_eat=%@&val_noon_end_eat=%@&val_night_before_eat=%@&val_night_end_eat=%@&memo=%@"

//获取用户血压记录列表历史
#define GetLogloodpresss_URL @"http://123.57.231.12:82/api.php?a=getLogBloodpresss&token=%@&page=%@"

//获取用户血压记录
#define GetLogloodpress_URL @"http://123.57.231.12:82/api.php?a=getLogBloodpress&token=%@&log_time=%@"

//添加/修改用户血压记录列表
#define UpdateLogBloodpress_URL @"http://123.57.231.12:82/api.php?a=updateLogBloodpress&token=%@&log_time=%@&val=%@&val2=%@&memo=%@"

//获取用户血脂记录列表历史
#define GetLogBloodfats_URL @"http://123.57.231.12:82/api.php?a=getLogBloodfats&token=%@&page=%@"

//获取用户血脂记录
#define GetLogBloodfat_URL @"http://123.57.231.12:82/api.php?a=getLogBloodfat&token=%@&log_time=%@"

//添加/修改用户血脂记录列表
#define UpdateLogBloodfat_URL @"http://123.57.231.12:82/api.php?a=updateLogBloodfat&token=%@&log_time=%@&val=%@&memo=%@"





typedef enum {
    ios5,
    ios6,
    ios7,
    noVersion
}SystemVersionType;
/////当地保存用户名 密码 是否第一次登陆
#define IC_USER_NAME @"user_name"
#define IC_USER_PASSWORD @"user_password"
#define IC_USER_ISLOGIN @"user_islogin"


