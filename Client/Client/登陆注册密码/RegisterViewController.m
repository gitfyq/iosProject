//
//  RegisterViewController.m
//  fetusMother
//
//  Created by  on 15/4/8.
//  Copyright (c) 2015年 . All rights reserved.
//

#import "RegisterViewController.h"


//#import "LoginViewController.h"

@interface RegisterViewController ()<UITextFieldDelegate>
{
    
    UIImageView *imageone;
    UIImageView *imagetwe;
    UIImageView *imagetreed;
    UIImageView *imagefour;
    
    UITextField *name;
    UITextField *passworda;
    UITextField *card;
    UITextField *passwordb;
    
    UIButton *buttons;
    
    UIButton *dlButton;
    UIButton *DlButton;

}

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"注册";
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    self.view.backgroundColor =[UIColor colorWithRed:243/255.0f green:243/255.0f blue:243/255.0f alpha:1];
    
    [self createViews];
    
}

-(void)createViews
{
    
    
    imageone = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, KW , 40)];
    imageone.image = [UIImage imageNamed:@"文本框bg"];
    imageone.userInteractionEnabled = YES;
    [self.view addSubview:imageone];
    
    name = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, KW , 40)];
    name.placeholder = @"手机号码";
    name.delegate = self;
    name.keyboardType= UIKeyboardTypeNumberPad;
    [imageone addSubview:name];
    

    
    imagetwe = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imageone.frame)+10, KW , 40)];
    imagetwe.image = [UIImage imageNamed:@"文本框bg"];
    imagetwe.userInteractionEnabled = YES;
    [self.view addSubview:imagetwe];

    
    passworda = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, KW, 40)];
    passworda.backgroundColor = [UIColor whiteColor];
    passworda.keyboardType = UIKeyboardTypeDecimalPad;
    passworda.delegate = self;
    passworda.placeholder = @"短信息验证码";
    [imagetwe addSubview:passworda];
    

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(self.view.frame.size.width-90, 0, 90, 40);
    button.layer.cornerRadius = 5;
    button.backgroundColor =[UIColor colorWithRed:0/255.0f green:168/255.0f blue:241/255.0f alpha:1.000];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    [button setTitle:@"获取验证码" forState:UIControlStateNormal];
    [button setTintColor:[UIColor whiteColor]];
    
    [button addTarget:self action:@selector(buttonClick11:) forControlEvents:UIControlEventTouchUpInside];
    [passworda addSubview:button];

    
    
    imagetreed = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imagetwe.frame)+10, KW , 40)];
    imagetreed.image = [UIImage imageNamed:@"文本框bg"];
    imagetreed.userInteractionEnabled = YES;
    [self.view addSubview:imagetreed];
    
    
    card = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, KW, 40)];
    card.backgroundColor = [UIColor whiteColor];
    card.keyboardType= UIKeyboardTypeNumberPad;
    card.placeholder = @"身份证证号";
    [imagetreed addSubview:card];

    
    
    imagefour = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imagetreed.frame)+10, KW , 40)];
    imagefour.image = [UIImage imageNamed:@"文本框bg"];
    imagefour.userInteractionEnabled = YES;
    [self.view addSubview:imagefour];
    
    
    passwordb = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, KW, 40)];
    passwordb.backgroundColor = [UIColor whiteColor];
    
    passwordb.placeholder = @"密码";
    [imagefour addSubview:passwordb];

    
    buttons = [UIButton buttonWithType:UIButtonTypeCustom];
    buttons.frame = CGRectMake(10, CGRectGetMaxY(imagefour.frame)+15, KW-20, 40);
    buttons.layer.cornerRadius = 4;
    buttons.backgroundColor =[UIColor colorWithRed:0/255.0f green:168/255.0f blue:241/255.0f alpha:1.000];
    
    [buttons setTitle:@"立即注册" forState:UIControlStateNormal];
    [buttons setTintColor:[UIColor whiteColor]];
    
    [buttons addTarget:self action:@selector(buttonClick22:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttons];
    
    dlButton = [Unity buttonAddsuperview_superView:self.view _subViewFrame:CGRectMake(KW/3, CGRectGetMaxY(buttons.frame)+15, 60, 15) _tag:self _action:@selector(buttonClicks:) _string:@"已注册?"_imageName:@""];
    [dlButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    DlButton = [Unity buttonAddsuperview_superView:self.view _subViewFrame:CGRectMake(KW/3+60, CGRectGetMaxY(buttons.frame)+15, 30, 15) _tag:self _action:@selector(buttonClickd:) _string:@"登陆"_imageName:@""];
    [dlButton setTitleColor:[UIColor colorWithRed:77/255.0f green:206/255.0f blue:236/255.0f alpha:1] forState:UIControlStateNormal];
    


}
//登陆
-(void)buttonClicks:(UIButton *)button
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
-(void)buttonClickd:(UIButton *)button
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
//获取验证码
-(void)buttonClick11:(UIButton *)button
{
       if ([Unity isBlankString:name.text]) {
        [Unity showErrorAlert:self.view message:@"请输入手机号"];
        
    }else{
        [SE_Request get_VerificationMobile:name.text finish:^(AFHTTPRequestOperation *operation, id responseObject) {
            //             NSDictionary * dic=[responseObject JSONValue];
            self.statusStr=responseObject[@"status"];
            self.info = responseObject[@"info"];
            if ([self.statusStr isEqualToString:@"0"]) {
                NSLog(@"fghjkl");
                [Unity showOKAlert:self.view message:self.info];
            }
        } error:^(AFHTTPRequestOperation *operation, NSError *error) {
            [Unity showOKAlert:self.view message:self.info];
        }];
    }

    
    
}
//注册
-(void)buttonClick22:(UIButton *)button
{
   
    if ([Unity isBlankString:name.text]) {
        [Unity showErrorAlert:self.view message:@"手机号不能为空"];
    }else if ([Unity isBlankString:passworda.text]){
        [Unity showErrorAlert:self.view message:@"验证码不能为空"];
    }else if ([Unity isBlankString:passwordb.text]){
        [Unity showErrorAlert:self.view message:@"密码不能为空"];
    }else if ([Unity isBlankString:card.text]){
        [Unity showErrorAlert:self.view message:@"身份证证号不能为空"];
    }else{
        
        [SE_Request get_resgistrationUserName:name.text Password:passwordb.text sms_code:passworda.text idcard:card.text finish:^(AFHTTPRequestOperation *operation, id responseObject) {
            self.statusStr=responseObject[@"status"];
            self.info = responseObject [@"info"];
            if ([self.statusStr isEqualToString:@"1"]) {
                [self persuccView];
                }else if (![self.statusStr isEqualToString:@"1"]){
            [Unity showOKAlert:self.view message:self.info];
                    NSLog(@"%@",self.info);
            }

        } error:^(AFHTTPRequestOperation *operation, NSError *error) {
            [Unity hideHUD];
            [Unity showErrorAlert:self.view message:@"您的网速不稳定。"];
        }];
        
        
    }
    
    
}

-(void)persuccView{
    [self.navigationController popToRootViewControllerAnimated:YES];
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
    
    [name resignFirstResponder];
    [passwordb resignFirstResponder];
    [passworda resignFirstResponder];
  
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
