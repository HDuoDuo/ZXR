//
//  ResetPassWViewController.m
//  装修人
//
//  Created by 熊维东 on 2016/11/29.
//  Copyright © 2016年 熊维东. All rights reserved.
//


#import "Config.h"
#import "ResetPassWViewController.h"
#import "LoginViewController.h"

@interface ResetPassWViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *tf_password;
@property (weak, nonatomic) IBOutlet UITextField *tf_surePassword;
@property (weak, nonatomic) IBOutlet UIButton *btn_OKlogin;

@end

@implementation ResetPassWViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 初始化
-(void)initBGView
{
    self.tf_password. delegate=  self;
    self.tf_surePassword.delegate= self;
    
    [_btn_OKlogin addTarget:self action:@selector(btn_OKlogin:) forControlEvents:UIControlEventTouchUpOutside];
    
    
     
    
}
-(void)btn_OKlogin:(UIButton *)sender
{
    NSLog(@"重置密码");
    if (![_tf_surePassword.text isEqualToString:_tf_password.text]) {
        
        [TCTLAlertView showAerltViewWithTitle:@"提示" message:@"2次输入的密码不匹配" cancelButtonTtitle:nil ensuerButtonTitle:@"确认" onSureUsingBlock:^{
            
        } onCancelUsingBlock:^{
        
        }];
    }else{
        
        //网络请求 在跳转
    
        [self requsetResetPSW];
    }
    
    
}
-(void)requsetResetPSW
{
    NSString * url = @"";
    NSDictionary * param =[NSDictionary dictionary];
    param =@{
             
             };
    
    [[HttpRequest shardWebUtil]postNetworkRequestURLString:url parameters:param success:^(id obj) {
       
        NSLog(@"VVVVVVVV");
    } fail:^(NSError *error) {
        
        
        NSLog(@"XXXXXXXX");
    }];
}
#pragma mark  -  tf delegate
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (_tf_password.isFirstResponder ) {
        NSLog(@"输入密码");
        [_tf_password becomeFirstResponder];
        
    }else if (_tf_surePassword.isFirstResponder) {
        
        NSLog(@"确认密码");
        [_tf_surePassword becomeFirstResponder];
        
    }
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField  == _tf_password ) {
        
        [[NSUserDefaults standardUserDefaults]setValue:_tf_password.text forKey:@"userPhone_id"];
        
        NSLog(@"结束编辑  输入密码");
        
    }else if (textField  ==_tf_surePassword) {
        
        NSLog(@"结束编辑  确认密码");
        
    }
    [self rectFrame];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self rectFrame];
    [self.tf_surePassword resignFirstResponder];
    [self.tf_password resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.tf_surePassword resignFirstResponder];
    [self.tf_password resignFirstResponder];
    return YES;
}
//改变状态
-(BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    if (![_tf_password.text isEqualToString:@"" ]&& ![_tf_surePassword.text isEqualToString:@""] )
    {
 
        _btn_OKlogin.backgroundColor = RGBA(22, 73, 145, 1);

    }
    else{
        
        _btn_OKlogin.backgroundColor = RGBA(190, 190, 190, 1);
        
    }
    return  YES;
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


#pragma  mark  - 返回
- (IBAction)nav_backLoginView:(id)sender {
  
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (IBAction)presentToLoginPage:(id)sender {
    
    LoginViewController * logvc= [[LoginViewController alloc]init];
    
    [self presentViewController:logvc animated:YES completion:nil];
    
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
