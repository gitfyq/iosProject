//
//  ForgetViewController.m
//  fetusMother
//
//  Created by apple on 15/4/20.
//  Copyright (c) 2015年 张平辉. All rights reserved.
//

#import "ForgetViewController.h"
#import "SBJson.h"
#import "LoginViewController.h"
#import "Unity.h"
#import "SE_Request.h"

@interface ForgetViewController ()<UITextFieldDelegate>
{
    
    UIImageView *passImage;
    UIImageView *NpassImage;
    
    UITextField *passTextfield;
    UITextField *NpassTextfield;
    
    UIButton *resetButton;
    
    
}

@end

@implementation ForgetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"忘记密码";
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor =[UIColor colorWithRed:243/255.0f green:243/255.0f blue:243/255.0f alpha:1];
    [self createimage];
}

-(void)createimage{
    
    
//    imageone = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, KW , 40)];
//    imageone.image = [UIImage imageNamed:@"文本框bg"];
//    imageone.userInteractionEnabled = YES;
//    [self.view addSubview:imageone];
//    
//    name = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, KW , 40)];
//    name.placeholder = @"手机号码";
//    name.delegate = self;
//    name.keyboardType= UIKeyboardTypeNumberPad;
//    [imageone addSubview:name];

    
    passImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 20, KW-20, 50)];
    passImage .image = [UIImage imageNamed:@"文本框bg"];
    [self.view addSubview:passImage];
    
    NpassImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(passImage.frame)+20, KW-20, 50)];
    NpassImage .image = [UIImage imageNamed:@"文本框bg"];
    [self.view addSubview:NpassImage];
    
    passTextfield = [[UITextField alloc] initWithFrame:CGRectMake(10, 0, KW-20-20, 50)];
    passTextfield.borderStyle = UITextBorderStyleNone;
    passTextfield.placeholder = @"请输入原密码";
    passTextfield.delegate = self;
    passTextfield.font=[UIFont boldSystemFontOfSize:18];
    [passImage addSubview:passTextfield];
    
    NpassTextfield = [[UITextField alloc] initWithFrame:CGRectMake(10, 0, KW-20-20, 50)];
    NpassTextfield.borderStyle = UITextBorderStyleNone;
    NpassTextfield.placeholder = @"请输入新密码";
    NpassTextfield.delegate = self;
    NpassTextfield.font=[UIFont boldSystemFontOfSize:18];
    [NpassImage addSubview:NpassTextfield];

    resetButton = [Unity buttonAddsuperview_superView:self.view _subViewFrame:CGRectMake(10, CGRectGetMaxY(NpassImage.frame)+30, KW-20, 40) _tag:self _action:@selector(resetButton:) _string:@"重置密码" _imageName:@""];
    [resetButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    resetButton .backgroundColor =[UIColor colorWithRed:0/255.0f green:168/255.0f blue:241/255.0f alpha:1.000];
    resetButton.layer.cornerRadius = 4;
    [self.view addSubview:resetButton];
    
}


//修改密码

-(void)resetButton:(UIButton *)btn{
    
     NSString *token=[SGSaveFile getObjectFromSystemWithKey:@"token"];
    NSLog(@"%@",token);
    
    if ([Unity isBlankString:passTextfield.text]) {
        [Unity showErrorAlert:self.view message:@"请输入原密码"];
        
    }else if ([Unity isBlankString:NpassTextfield.text]){
        [Unity showErrorAlert:self.view message:@"请输入新密码"];
    }else{
//        [SE_Request get_forgettoken:token new_password:NpassTextfield.text old_password:passTextfield.text finish:^(AFHTTPRequestOperation *operation, id responseObject) {
//            NSLog(@"%@,%@,%@",token,NpassTextfield.text,passTextfield.text);
//            NSLog(@"%@",responseObject);
////            NSDictionary * dic=[responseObject JSONValue];
//            self.statusStr=responseObject[@"status"];
//            self.info = responseObject [@"info"];
//            
//            if ([self.statusStr isEqualToString:@"1"]) {
//                [Unity showOKAlert:self.view message:@"修改成功"];
//                
//                [self presucc];
//                
//            } else if (![self.statusStr isEqualToString:@"1"]){
//                [Unity showOKAlert:self.view message:self.info];
//                
//            }
//
//        } error:^(AFHTTPRequestOperation *operation, NSError *error) {
//             [Unity showOKAlert:self.view message:@"网络错误"];
//        }];
    }
    
    
    
}

-(void)presucc{
    LoginViewController *lvc = [[LoginViewController alloc] init];
    [self.navigationController  pushViewController:lvc animated:YES];
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
