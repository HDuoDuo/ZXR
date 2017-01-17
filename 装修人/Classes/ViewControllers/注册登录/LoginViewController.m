//
//  LoginViewController.m
//  装修人
//
//  Created by 熊维东 on 2016/11/29.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "ForgetPassWViewController.h"
#import "Config.h"
@interface LoginViewController ()<UITextFieldDelegate>
{
    NSString * timeSp;
    NSString * userID;
    NSString * userPSD;
}
@property (weak, nonatomic) IBOutlet UIView *viewOfUserbd;//第一个边框View
@property (weak, nonatomic) IBOutlet UIView *viewOfPassword;//第一个边框View
@property (weak, nonatomic) IBOutlet UITextField *tf_User;//手机号
@property (weak, nonatomic) IBOutlet UITextField *tf_password;//手机密码
@property (weak, nonatomic) IBOutlet UIButton *LoginInSuccess;//登录
@property (weak, nonatomic) IBOutlet UIBarButtonItem *NavBackItem;

@end

@implementation LoginViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initWithBgView];
    
    
}
//返回个人中心
- (IBAction)backNavToSinglePage:(id)sender {
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

#pragma mark - 初始化视图
-(void)initWithBgView
{
    self.tf_password.delegate = self;
    self.tf_User.delegate = self;
    
}

-(void)viewWillAppear:(BOOL)animated
{
    NSDate *date = [NSDate date];
    NSTimeZone *zone =  [NSTimeZone timeZoneForSecondsFromGMT:8];
    NSInteger interval = [zone secondsFromGMTForDate: date];
    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    // 时间转换成时间戳
    timeSp = [NSString stringWithFormat:@"%.f",[localeDate timeIntervalSince1970] *1000];
    
}
//验证登录
-(void)HttpsPostRequestForLogin
{
  
    //  密码base64

    // sign（username  password  mobileLogin  timestamp）
    //15730073763   123456
    
//    NSString * userid = [[NSUserDefaults standardUserDefaults]objectForKey:@"user_id"];
//    NSString * psdid = [[NSUserDefaults standardUserDefaults]objectForKey:@"user_psd"];
    NSString * userid =@"15730073763";
    NSString * psdid = @"123456";
    NSString *BasePassWord = [HttpRequest base64StringFromText:psdid];
    NSString *  mobileLogin =@"true";
    
    NSString * sign =   [HttpRequest md5: [NSString stringWithFormat:@"loginName%@password%@mobileLogin%@timestamp%@",userid, psdid,mobileLogin,timeSp] ];
    
    
    NSDictionary* params = [NSMutableDictionary dictionary];
    
    params = @{
               
               @"username" : userid,
               @"password" : psdid,
               @"mobileLogin":mobileLogin,
               @"timestamp" :  timeSp,
               @"sign" :  sign,
               
               };
    
    [[HttpRequest shardWebUtil] postNetworkRequestURLString:LoginSuccess_Url parameters:params success:^(id obj) {
        
        NSLog(@"请求成功   --success ！~~~~-------    直接进个人中心");
        
    } fail:^(NSError *error) {
        
        NSLog(@"xxxxxxx ！~~~~ %@",error);
        
    }];
    
}

#pragma mark - 登录账号
- (IBAction)loginAction:(id)sender {
    
    [self HttpsPostRequestForLogin];
    
}
#pragma mark - 注册账号
- (IBAction)RegistActionWithLog:(id)sender {

    RegisterViewController * registVC= [[RegisterViewController alloc]init];
   
    [self presentViewController:registVC animated:YES completion:nil];
    
    
}
#pragma mark - 忘记密码
- (IBAction)forgetPSWordAction:(id)sender {
   
    ForgetPassWViewController * passVc=[[ForgetPassWViewController alloc]init];
    //[self.navigationController pushViewController:passVc animated:YES];
    [self presentViewController:passVc animated:YES completion:nil];
    
}

#pragma mark - textfiled delegate
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (_tf_User.isFirstResponder ) {
        
        NSLog(@"手机号");
        
        [_tf_User becomeFirstResponder];
        
    }else if (_tf_password.isFirstResponder) {
        
        NSLog(@"密码");
       
        [_tf_password becomeFirstResponder];
        
    }
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    
    
    if (textField  == _tf_User ) {
        
        [CManager validateMobile:_tf_User.text];
        [[NSUserDefaults standardUserDefaults]setValue:_tf_User.text forKey:@"userPhone_id"];
        NSLog(@"结束编辑  iphoneNum");
        
    }else if (textField  ==_tf_password) {
        
         NSLog(@"结束编辑  mima");
        [[NSUserDefaults standardUserDefaults]setValue:_tf_password.text forKey:@"user_password"];
    }
   
    [self rectFrame];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self rectFrame];
    [self.tf_User resignFirstResponder];
    [self.tf_password resignFirstResponder];
}
#pragma mark- 回收键盘
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.tf_User resignFirstResponder];
    [self.tf_password resignFirstResponder];
    
    return YES;
}

-(void)rectFrame{
   
    [self.view endEditing:YES];
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    CGRect rect = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height);
    self.view.frame = rect;
    [UIView commitAnimations];
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
