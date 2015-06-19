//
//  LoginViewController.m
//  fetusMother
//
//  Created by abc on 15/4/8.
//  Copyright (c) 2015年. All rights reserved.
//

#import "LoginViewController.h"

#import "RegisterViewController.h"

#import "RootTabBarViewController.h"

#import "SBJson.h"

#import "ForgetViewController.h"

#import "Unity.h"

#import "HomeViewController.h"
#import "SE_Request.h"
#import "PersonalController.h"



@interface LoginViewController ()<UITextFieldDelegate>
{
    UIImageView *background;
    UIImageView *NameImage;
    UIImageView *PassImage;
    UILabel *NameLabel;
    UILabel *PassLabel;
    UITextField *name;
    UITextField *password;
    UIButton *fgButton;
    UIButton *zcButton;

}

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"登陆";
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor =  [UIColor colorWithRed:245/255.0f green:245/255.0f blue:245/255.0f alpha:1.000];
    

    //self.view.
    
    [self createViews];
    
}

-(void)createViews
{
    
    NameImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 20, KW - 20, 50)];
    NameImage.image = [UIImage imageNamed:@"bg_01"];
    NameImage.userInteractionEnabled = YES;
    [self.view addSubview:NameImage];
    
    NameLabel = [Unity lableViewAddsuperview_superView:NameImage _subViewFrame:CGRectMake(5, 15, 60, 20) _string:@"手机号  |" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor blackColor] _textAlignment:NSTextAlignmentLeft];
    
    
    name = [[UITextField alloc] initWithFrame:CGRectMake(61, 0, KW - 20 - 60, 50)];
    
    name.delegate = self;
    name.keyboardType= UIKeyboardTypeNumberPad;
    
    [NameImage addSubview:name];
    
    
    
    PassImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(NameImage.frame), KW - 20, 50)];
    PassImage.image = [UIImage imageNamed:@"bg_02"];
    PassImage.userInteractionEnabled = YES;
    [self.view addSubview:PassImage];
    
    PassLabel = [Unity lableViewAddsuperview_superView:PassImage _subViewFrame:CGRectMake(5, 15, 60, 20) _string:@"密  码  |" _lableFont:[UIFont systemFontOfSize:14] _lableTxtColor:[UIColor blackColor] _textAlignment:NSTextAlignmentLeft];
    
    
    password = [[UITextField alloc] initWithFrame:CGRectMake(61, 0, KW - 20 - 60, 50)];
    password.secureTextEntry=YES;
    password.delegate = self;
    password.keyboardType= UIKeyboardTypeDefault;
    
    [PassImage addSubview:password];

    
    fgButton = [Unity buttonAddsuperview_superView:self.view _subViewFrame:CGRectMake(12, CGRectGetMaxY(PassImage.frame)+10, 100, 30) _tag:self _action:@selector(fgbtnButton) _string:@"忘记密码？" _imageName:@""];
    [fgButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    zcButton = [Unity buttonAddsuperview_superView:self.view _subViewFrame:CGRectMake(KW-100-10, CGRectGetMaxY(PassImage.frame)+10, 100, 30) _tag:self _action:@selector(buttonClicks:) _string:@"用户注册" _imageName:@""];
    [zcButton setTitleColor:[UIColor colorWithRed:77/255.0f green:206/255.0f blue:236/255.0f alpha:1] forState:UIControlStateNormal];

    

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(15, CGRectGetMaxY(PassImage.frame)+100, KW-30, 40);
    button.layer.cornerRadius = 4;
    
     button.backgroundColor =[UIColor colorWithRed:0/255.0f green:168/255.0f blue:241/255.0f alpha:1.000];
    
    [button setTitle:@"马上登陆" forState:UIControlStateNormal];
    [button setTintColor:[UIColor whiteColor]];
    
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    
    
}

//登陆
-(void)buttonClick:(UIButton *)button
{
    name.text=@"13370183330";
    password.text=@"111111";
    if ([Unity isBlankString:name.text]) {
        [Unity showErrorAlert:self.view message:@"请输入手机号"];
    }else if ([Unity isBlankString:password.text]){
        [Unity showErrorAlert:self.view message:@"请输入密码"];
    }else {
        
        [SE_Request get_login_request_Username:name.text Password:password.text finish:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            NSDictionary * dic=[responseObject JSONValue];
            self.statusStr=dic[@"status"];
            self.info = dic[@"info"];
            
            if ([[dic objectForKey:@"status"] isEqualToString:@"1"]){
                NSDictionary * dd= [dic objectForKey:@"data"];
                NSString * token=[dd objectForKey:@"token"];
                [[NSUserDefaults standardUserDefaults] setObject:token forKey:@"token"];
                [SGSaveFile saveObjectToSystem:token forKey:@"token"];
                    NSLog(@"111111%@",token);
                        }
                        NSLog(@"%@",dic);
            if ([self.statusStr isEqualToString:@"1"]) {
                [Unity showOKAlert:self.view message:@"登陆成功"];
                [SGSaveFile saveObjectToSystem:@"YES" forKey:IC_USER_ISLOGIN];
                    [self presucc];
                } else if (![self.statusStr isEqualToString:@"1"]){
                    [Unity showOKAlert:self.view message:self.info];
                    }
            
        } error:^(AFHTTPRequestOperation *operation, NSError *error) {
            [Unity showOKAlert:self.view message:@"网络错误"];
        }];
        
    }
    
    
    
    //[self presucc];
}

-(void)presucc{
//    [SGSaveFile saveObjectToSystem:@"YES" forKey:IC_USER_ISLOGIN];
//    [self.navigationController popViewControllerAnimated:YES];
//    self.backidNameValue (name.text);
    
   
    NSString *isLogin=[SGSaveFile getObjectFromSystemWithKey:IC_USER_ISLOGIN];
    if (!isLogin) {
        [SGSaveFile saveObjectToSystem:@"NO" forKey:IC_USER_ISLOGIN];
        
        
        
        RootTabBarViewController *rvc = [[RootTabBarViewController alloc]init];
        
        [self presentViewController:rvc animated:NO completion:^{
            
        }];
        
        
    }else{
        
//        RootTabBarViewController *rvc = [[RootTabBarViewController alloc]init];
//        
//        [self presentViewController:rvc animated:NO completion:^{
//            
//        }];

    
        PersonalController *prv = [[PersonalController alloc] initWithStyle:UITableViewStyleGrouped];
        [self.navigationController pushViewController:prv animated:YES];

    }

    
}

//忘记密码

-(void)fgbtnButton{
    
    ForgetViewController *fvc = [[ForgetViewController alloc] init];
    
    [self.navigationController pushViewController:fvc animated:NO];
    
}

//注册
-(void)buttonClicks:(UIButton *)button
{
    NSLog(@"6666666666");
    RegisterViewController *r = [[RegisterViewController alloc]init];
    
    [self.navigationController pushViewController:r animated:YES];
}

//注册
-(void)buttonClickd:(UIButton *)button
{
    RegisterViewController *r = [[RegisterViewController alloc]init];
   
    [self.navigationController pushViewController:r animated:YES];

}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [self becomeFirstResponder];
    
    return YES;
}

#pragma mark-once 代理关闭键盘
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return  YES;
}

#pragma mark-once 触摸手势关闭键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
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
