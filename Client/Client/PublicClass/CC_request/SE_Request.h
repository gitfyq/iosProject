//
//  SE_Request.h
//  7ishere_Iphone
//
//  Created by smile_faner on 14-10-30.
//  Copyright (c) 2014年 smile_faner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperationManager.h"
#import "TypeDefine.h"
//AFNetWorking请求完成的block
typedef  void (^AFFinishBlock)(AFHTTPRequestOperation *operation, id responseObject);
//AFNetWorking请求失败的block
typedef  void (^AFErrorBlock)(AFHTTPRequestOperation *operation, NSError *error);
@interface SE_Request : NSObject
#pragma mark 单例
+(SE_Request*)sharedManager;
#pragma mark 登录
//设置成功与失败的block对象和请求地址来从远程地址请求数据
+(void)get_login_request_Username:(NSString *)username Password:(NSString *)password finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock;
//注册
//http://123.57.231.12:82/api.php?a=reg&mobile=%@&password=%@&sms_code=%@&idcard=%@
+ (void)get_resgistrationUserName:(NSString *)username Password:(NSString *)password sms_code:(NSString *)sms_code idcard:(NSString *)idcard finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock;
//头像
+ (void)get_headImageViewUserName:(NSString *)username imgStr:(NSString *)imgStr imgName:(UIImage *)imgName finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock;

//验证码
+(void)get_VerificationMobile:(NSString *)mobile finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock;

//修改密码
+(void)get_forgettoken:(NSString *)token new_password:(NSString *)new_password old_password:(NSString *)old_password finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock;


//地区
+(void)get_region:(NSString *)region finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock;
//获取下级地区
+(void)get_region:(NSString *)region id:(NSString *)id suball:(NSString *)suball finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock;

//获取医生列表
+(void)get_Mydoctortoken:(NSString *)token page:(NSString *)page kw:(NSString *)kw finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock;

#pragma mark 获取医生的预约点列表
+(void)get_MyDoctorTimetoken:(NSString *)token ids:(NSString *)ids finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock;
#pragma mark 添加预约医生记录
+(void)add_OrderMlotoken:(NSString *)token oid:(NSString *)oid 	memo:(NSString *)memo finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock;

//获取用户健康一般情况
+(void)get_UserGeneraltoken:(NSString *)token finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock;

//修改用户健康一般情况
+(void)Up_UserGeneraltoken:(NSString *)token body_t:(NSString *)body_t breathe_freq:(NSString *)breathe_freq height:(NSString *)height pulse_rate:(NSString *)pulse_rate blood_pressure:(NSString *)blood_pressure weight:(NSString *)weight finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock;

//获取用户健康病史
+(void)get_UserSicktoken:(NSString *)token finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock;

//修改用户健康病史
+(void)Up_UserSicktoken:(NSString *)token self_history:(NSString *)self_history family_history:(NSString *)family_history genetic_history:(NSString *)genetic_history disability_history:(NSString *)disability_history finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock;

//获取用户生活方式
+(void)get_UserLifetoken:(NSString *)token finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock;

//修改用户生活方式
+(void)Up_UserLifetoken:(NSString *)token pe:(NSString *)pe food:(NSString *)food smoke:(NSString *)smoke drink:(NSString *)drink finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock;

//获取用户心情记录列表历史
+(void)get_LogMoodstoken:(NSString *)token page:(NSString *)page finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock;

//获取用户心情记录
+(void)get_LogMoodtoken:(NSString *)token log_time:(NSString *)log_time finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock;

//添加/修改用户心情记录
+(void)Up_LogMoodtoken:(NSString *)token log_time:(NSString *)log_time val:(NSString *)val memo:(NSString *)memo finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock;

//获取用户体重记录列表历史
+(void)get_LogWeightstoken:(NSString *)token page:(NSString *)page finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock;

//获取用户体重记录
+(void)get_LogWeighttoken:(NSString *)token log_time:(NSString *)log_time finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock;

//添加/修改用户体重记录列表
+(void)Up_LogWeighttoken:(NSString *)token log_time:(NSString *)log_time val:(NSString *)val memo:(NSString *)memo finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock;

//获取用户睡眠记录列表历史
+(void)get_LogSleepstoken:(NSString *)token page:(NSString *)page finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock;

//获取用户睡眠记录
+(void)get_LogSleeptoken:(NSString *)token log_time:(NSString *)log_time finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock;

//添加/修改用户睡眠记录列表
+(void)Up_LogSleeptoken:(NSString *)token log_time:(NSString *)log_time val_sleep:(NSString *)val_sleep val_wake:(NSString *)val_wake memo:(NSString *)memo finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock;

//获取用户运动记录列表历史
+(void)get_LogSportstoken:(NSString *)token page:(NSString *)page finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock;

//获取用户运动记录
+(void)get_LogSporttoken:(NSString *)token log_time:(NSString *)log_time finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock;

//添加/修改用户运动记录
+(void)Up_LogSporttoken:(NSString *)token log_time:(NSString *)log_time val_type:(NSString *)val_type val_minutes:(NSString *)val_minutes memo:(NSString *)memo finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock;

//获取用户血糖记录列表历史
+(void)get_LogBloodstoken:(NSString *)token page:(NSString *)page finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock;

//获取用户血糖记录
+(void)get_LogBloodtoken:(NSString *)token log_time:(NSString *)log_time finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock;

//添加/修改用户血糖记录
+(void)Up_LogBloodtoken:(NSString *)token log_time:(NSString *)log_time val_morning_before_eat:(NSString *)val_morning_before_eat val_morning_end_eat:(NSString *)val_morning_end_eat val_noon_before_eat:(NSString *)val_noon_before_eat val_noon_end_eat:(NSString *)val_noon_end_eat val_night_before_eat:(NSString *)val_night_before_eat val_night_end_eat:(NSString *)val_night_end_eat memo:(NSString *)memo finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock;




@end
