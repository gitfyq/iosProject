//
//  SE_Request.m
//  7ishere_Iphone
//
//  Created by smile_faner on 14-10-30.
//  Copyright (c) 2014年 smile_faner. All rights reserved.
//

#import "SE_Request.h"

@implementation SE_Request
#pragma mark 单例
+(SE_Request*)sharedManager
{
    static SE_Request *manager;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        manager=[[SE_Request alloc] init];
    });
    return manager;
}
#pragma mark 登录
+(void)get_login_request_Username:(NSString *)username Password:(NSString *)password finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    //回应的数据格式为xml,缺省为json格式
    manager.responseSerializer=[AFXMLParserResponseSerializer serializer];
    //二进制
    
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    //设置可接受的内容类型
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json",@"text/html", nil];
    
    [manager GET:[NSString stringWithFormat:LOGIN_URL,username,password] parameters:nil success:finishBlock failure:errorBlock];
}
//注册

+(void)get_resgistrationUserName:(NSString *)username Password:(NSString *)password sms_code:(NSString *)sms_code idcard:(NSString *)idcard finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock{
        AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
        manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json",@"text/html", nil];
        NSLog(@"%@",[NSString stringWithFormat:Registration_URL,username,password,sms_code,idcard]);
        [manager GET:[NSString stringWithFormat:Registration_URL,username,password,sms_code,idcard] parameters:nil success:finishBlock failure:errorBlock];
}

//验证码
+(void)get_VerificationMobile:(NSString *)mobile finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    
     manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json",@"text/html", nil];
    
    [manager GET:[NSString stringWithFormat:Verification_URL,mobile] parameters:nil success:finishBlock failure:errorBlock];
    
    
}

//修改密码

+(void)get_forgettoken:(NSString *)token new_password:(NSString *)new_password old_password:(NSString *)old_password finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json",@"text/html", nil];
    [manager GET:[NSString stringWithFormat:Forget_URL,token,new_password,old_password] parameters:nil success:finishBlock failure:errorBlock];
    
}

//获取地区
+(void)get_region:(NSString *)region finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
     manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json",@"text/html", nil];
    [manager GET:[NSString stringWithFormat:Region_URL] parameters:nil success:finishBlock failure:errorBlock];
}

//获取下级地区
+(void)get_region:(NSString *)region id:(NSString *)id suball:(NSString *)suball finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json",@"text/html", nil];
    [manager GET:[NSString stringWithFormat:NextRegion_URL,id,suball] parameters:nil success:finishBlock failure:errorBlock];
}


//获取医生列表
+(void)get_Mydoctortoken:(NSString *)token page:(NSString *)page kw:(NSString *)kw finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json",@"text/html", nil];
    [manager GET:[NSString stringWithFormat:Mydoctor_URL,token,page,kw] parameters:nil success:finishBlock failure:errorBlock];
}
#pragma mark 获取医生的预约点列表
+(void)get_MyDoctorTimetoken:(NSString *)token ids:(NSString *)ids finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json",@"text/html", nil];
    [manager GET:[NSString stringWithFormat:DoctorTime_URL,token,ids] parameters:nil success:finishBlock failure:errorBlock];
}
#pragma mark 添加预约医生记录?a=addOrderMlog&token=%@&oid=%@&memo=%@"
+(void)add_OrderMlotoken:(NSString *)token oid:(NSString *)oid 	memo:(NSString *)memo finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock{
    AFHTTPRequestOperationManager *rom=[AFHTTPRequestOperationManager manager];
    rom.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"text/html",@"application/json", nil];
    NSDictionary *parameter=@{@"a":@"addOrderMlog",@"token":token,@"oid":oid,@"memo":memo};
    [rom POST:AddOrderMlog_URL parameters:parameter success:finishBlock failure:errorBlock];
}



//获取用户健康一般情况
+(void)get_UserGeneraltoken:(NSString *)token finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json",@"text/html", nil];
    [manager GET:[NSString stringWithFormat:GetUserGeneral_URL,token] parameters:nil success:finishBlock failure:errorBlock];
}

//修改用户健康一般情况
+(void)Up_UserGeneraltoken:(NSString *)token body_t:(NSString *)body_t breathe_freq:(NSString *)breathe_freq height:(NSString *)height pulse_rate:(NSString *)pulse_rate blood_pressure:(NSString *)blood_pressure weight:(NSString *)weight finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json",@"text/html", nil];
    [manager GET:[NSString stringWithFormat:UpUserGeneral_URL,token,body_t,breathe_freq,height,pulse_rate,blood_pressure,weight] parameters:nil success:finishBlock failure:errorBlock];
}

//获取用户健康病史
+(void)get_UserSicktoken:(NSString *)token finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json",@"text/html", nil];
    [manager GET:[NSString stringWithFormat:GetUserSick_URL,token] parameters:nil success:finishBlock failure:errorBlock];
}
//修改用户健康病史
+(void)Up_UserSicktoken:(NSString *)token self_history:(NSString *)self_history family_history:(NSString *)family_history genetic_history:(NSString *)genetic_history disability_history:(NSString *)disability_history finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock{
    
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json",@"text/html", nil];
    [manager GET:[NSString stringWithFormat:UpUserSick_URL,token,self_history,family_history,genetic_history,disability_history] parameters:nil success:finishBlock failure:errorBlock];
    
}

//获取用户生活方式
+(void)get_UserLifetoken:(NSString *)token finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json",@"text/html", nil];
    [manager GET:[NSString stringWithFormat:GetUserLife_URL,token] parameters:nil success:finishBlock failure:errorBlock];
}

//修改用户生活方式
+(void)Up_UserLifetoken:(NSString *)token pe:(NSString *)pe food:(NSString *)food smoke:(NSString *)smoke drink:(NSString *)drink finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json",@"text/html", nil];
    [manager GET:[NSString stringWithFormat:UpUserLife_URL,token,pe,food,smoke,drink] parameters:nil success:finishBlock failure:errorBlock];
}
//获取用户心情记录列表历史
+(void)get_LogMoodstoken:(NSString *)token page:(NSString *)page finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json",@"text/html", nil];
    [manager GET:[NSString stringWithFormat:GetLogMoods_URL,token,page] parameters:nil success:finishBlock failure:errorBlock];
}
//获取用户心情记录
+(void)get_LogMoodtoken:(NSString *)token log_time:(NSString *)log_time finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json",@"text/html", nil];
    [manager GET:[NSString stringWithFormat:getLogMood_URL,token,log_time] parameters:nil success:finishBlock failure:errorBlock];
}
//添加/修改用户心情记录
+(void)Up_LogMoodtoken:(NSString *)token log_time:(NSString *)log_time val:(NSString *)val memo:(NSString *)memo finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json",@"text/html", nil];
    [manager GET:[NSString stringWithFormat:UpdateLogMood_URL,token,log_time,val,memo] parameters:nil success:finishBlock failure:errorBlock];
}
//获取用户体重记录列表历史
+(void)get_LogWeightstoken:(NSString *)token page:(NSString *)page finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json",@"text/html", nil];
    [manager GET:[NSString stringWithFormat:GetLogWeights_URL,token,page] parameters:nil success:finishBlock failure:errorBlock];
}
//获取用户体重记录
+(void)get_LogWeighttoken:(NSString *)token log_time:(NSString *)log_time finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json",@"text/html", nil];
    [manager GET:[NSString stringWithFormat:getLogWeight_URL,token,log_time] parameters:nil success:finishBlock failure:errorBlock];
}
//添加/修改用户体重记录列表
+(void)Up_LogWeighttoken:(NSString *)token log_time:(NSString *)log_time val:(NSString *)val memo:(NSString *)memo finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json",@"text/html", nil];
    [manager GET:[NSString stringWithFormat:UpdateLogWeight_URL,token,log_time,val,memo] parameters:nil success:finishBlock failure:errorBlock];
}
//获取用户睡眠记录列表历史
+(void)get_LogSleepstoken:(NSString *)token page:(NSString *)page finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json",@"text/html", nil];
    [manager GET:[NSString stringWithFormat:GetLogSleeps_URL,token,page] parameters:nil success:finishBlock failure:errorBlock];
}
//获取用户睡眠记录
+(void)get_LogSleeptoken:(NSString *)token log_time:(NSString *)log_time finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json",@"text/html", nil];
    [manager GET:[NSString stringWithFormat:GetLogSleep_URL,token,log_time] parameters:nil success:finishBlock failure:errorBlock];
}

//添加/修改用户睡眠记录列表
+(void)Up_LogSleeptoken:(NSString *)token log_time:(NSString *)log_time val_sleep:(NSString *)val_sleep val_wake:(NSString *)val_wake memo:(NSString *)memo finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json",@"text/html", nil];
    [manager GET:[NSString stringWithFormat:UpdateLogSleep_URL,token,log_time,val_sleep,val_wake,memo] parameters:nil success:finishBlock failure:errorBlock];
    
}
//获取用户运动记录列表历史
+(void)get_LogSportstoken:(NSString *)token page:(NSString *)page finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json",@"text/html", nil];
    [manager GET:[NSString stringWithFormat:GetLogSports_URL,token,page] parameters:nil success:finishBlock failure:errorBlock];
}
//获取用户运动记录
+(void)get_LogSporttoken:(NSString *)token log_time:(NSString *)log_time finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock{
    
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json",@"text/html", nil];
    [manager GET:[NSString stringWithFormat:GetLogSport_URL,token,log_time] parameters:nil success:finishBlock failure:errorBlock];
}
//添加/修改用户运动记录
+(void)Up_LogSporttoken:(NSString *)token log_time:(NSString *)log_time val_type:(NSString *)val_type val_minutes:(NSString *)val_minutes memo:(NSString *)memo finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json",@"text/html", nil];
    [manager GET:[NSString stringWithFormat:UpdateLogSport_URL,token,log_time,val_type,val_minutes,memo] parameters:nil success:finishBlock failure:errorBlock];
}
//获取用户血糖记录列表历史
+(void)get_LogBloodstoken:(NSString *)token page:(NSString *)page finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json",@"text/html", nil];
    [manager GET:[NSString stringWithFormat:GetLogBloods_URL,token,page] parameters:nil success:finishBlock failure:errorBlock];
}
//获取用户血糖记录
+(void)get_LogBloodtoken:(NSString *)token log_time:(NSString *)log_time finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json",@"text/html", nil];
    [manager GET:[NSString stringWithFormat:GetLogBlood_URL,token,log_time] parameters:nil success:finishBlock failure:errorBlock];
}

//添加/修改用户血糖记录
+(void)Up_LogBloodtoken:(NSString *)token log_time:(NSString *)log_time val_morning_before_eat:(NSString *)val_morning_before_eat val_morning_end_eat:(NSString *)val_morning_end_eat val_noon_before_eat:(NSString *)val_noon_before_eat val_noon_end_eat:(NSString *)val_noon_end_eat val_night_before_eat:(NSString *)val_night_before_eat val_night_end_eat:(NSString *)val_night_end_eat memo:(NSString *)memo finish:(AFFinishBlock)finishBlock error:(AFErrorBlock)errorBlock{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json",@"text/html", nil];
    [manager GET:[NSString stringWithFormat:UpdateLogBlood_URL,token,log_time,val_morning_before_eat,val_morning_end_eat,val_noon_before_eat,val_noon_end_eat,val_night_before_eat,val_night_end_eat,memo] parameters:nil success:finishBlock failure:errorBlock];
    
}
@end
