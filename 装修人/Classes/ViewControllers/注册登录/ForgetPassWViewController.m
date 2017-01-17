//
//  ForgetPassWViewController.m
//  装修人
//
//  Created by 熊维东 on 2016/11/29.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import "Config.h"
#import "ForgetPassWViewController.h"
#import "ResetPassWViewController.h"
@interface ForgetPassWViewController ()<UITextFieldDelegate,UIGestureRecognizerDelegate>
{
    int seconds;
    NSTimer * timerInterval;//验证码倒计时
    NSString *timeSp;
    
    
}

@property (weak, nonatomic) IBOutlet UIButton *NextActionWithForgetpsw;//下一步
@property (weak, nonatomic) IBOutlet UITextField *tf_phoneNum;
@property (weak, nonatomic) IBOutlet UITextField *tf_codeNumber;
@property (weak, nonatomic) IBOutlet UITextField *tf_imageCode;
@property (weak, nonatomic) IBOutlet UIButton *btn_getCodeNumber;
@property (weak, nonatomic) IBOutlet UIImageView *code_ImageView;

@end

@implementation ForgetPassWViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initbgView];
    
}
#pragma mark - 初始化
-(void)initbgView
{
    self.tf_phoneNum. delegate=  self;
    self.tf_codeNumber.delegate= self;
    [self initCodeImageView];
    
    
    UITapGestureRecognizer * gestureSingle = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(touchImageView_code:)];

    gestureSingle.delegate = self;
    gestureSingle.numberOfTapsRequired=1;
    [self.view  addGestureRecognizer:gestureSingle];
}

-(void)initCodeImageView{
    
    [_code_ImageView sd_setImageWithURL:[NSURL URLWithString:imageCode_Url] placeholderImage:[UIImage imageNamed:@""] options:SDWebImageRefreshCached];
    
    
}
//图形验证码
-(void)touchImageView_code:(UITapGestureRecognizer * )sender
{
    [self initCodeImageView];
}

- (IBAction)EnterToResetPassword:(id)sender {

    ResetPassWViewController * resetVC =[[ResetPassWViewController alloc]init];

    [self presentViewController:resetVC animated:YES completion:nil];
};

#pragma mark  -  tf delegate
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (_tf_phoneNum.isFirstResponder ) {
        NSLog(@"手机号");
        [_tf_phoneNum becomeFirstResponder];
        
    }else if (_tf_codeNumber.isFirstResponder) {
        
        NSLog(@"验证码");
        [_tf_codeNumber becomeFirstResponder];
        
    }

    else if (_tf_imageCode.isFirstResponder) {
        
        NSLog(@"图形验证码");
        [_tf_imageCode becomeFirstResponder];
        
    }

}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField  == _tf_phoneNum ) {
        
        [CManager validateMobile:_tf_phoneNum.text];

        
        NSLog(@"结束编辑  iphoneNum");
        
    }else if (textField  ==_tf_codeNumber) {
        

        NSLog(@"结束编辑  验证码");
        
    }
    else if (textField  ==_tf_imageCode) {
        
        
        NSLog(@"结束编辑  图形验证码");
        
    }
    [self rectFrame];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self rectFrame];
    [self.tf_codeNumber resignFirstResponder];
    [self.tf_imageCode resignFirstResponder];
    [self.tf_phoneNum resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.tf_codeNumber resignFirstResponder];
    [self.tf_imageCode resignFirstResponder];

    [self.tf_phoneNum resignFirstResponder];
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

//改变状态
-(BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    if (![_tf_phoneNum.text isEqualToString:@"" ]&& ![_tf_phoneNum.text isEqualToString:@""]&&![_tf_imageCode.text isEqualToString:@""])
    {
  
        
        _NextActionWithForgetpsw.backgroundColor = RGBA(22, 73, 145, 1);

    }
    else{
        
        _NextActionWithForgetpsw.backgroundColor = RGBA(190, 190, 190, 1);
        
    }
    return  YES;
}

#pragma mark- 获取验证码
-(void)UserSecuritycodeTargetActionWithButton:(UIButton *)bt_numberCode{
    
    NSLog(@"获取验证码");
    
    if (_tf_phoneNum.text.length == 11) {
        seconds = 60 ;
        timerInterval =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeCountdown:) userInfo:nil repeats:YES];
    
        [[NSRunLoop mainRunLoop] addTimer:timerInterval forMode:NSDefaultRunLoopMode];
        
        
    }
    else{
          [CManager validateMobile:_tf_phoneNum.text];
    }
    
}

//倒计中时
-(void)timeCountdown :(NSTimer *)timer
{
    seconds--;
   
    [_btn_getCodeNumber setBackgroundColor:COLOR(22, 73, 145, 1)];
    
    NSString *title = [NSString stringWithFormat:@"%d秒后重试",seconds ];
    
    [_btn_getCodeNumber setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [_btn_getCodeNumber setEnabled:NO];
    
    [_btn_getCodeNumber setTitle:title forState:UIControlStateNormal];
    
    if (seconds == 0 ) {
        
        [_btn_getCodeNumber setEnabled:YES];
    
        [_btn_getCodeNumber setBackgroundColor:[UIColor colorWithRed:0.047 green:0.498 blue:0.855 alpha:1.000]];
        [_btn_getCodeNumber setTitle:@"获取验证码" forState: UIControlStateNormal];
        
        [self releaseTimer];
        
    }
    NSLog(@"%d", seconds);
    
}
//如果登陆成功，停止验证码的倒数，
- (void)releaseTimer {
    if (timerInterval) {
        if ([timerInterval respondsToSelector:@selector(isValid)]) {
            if ([timerInterval isValid]) {
                [timerInterval invalidate];
                timerInterval = nil;
                seconds = 60;
            }
        }
    }
}
//页面消失，进入后台不显示该页面，关闭定时器
-(void)viewDidDisappear:(BOOL)animated
{
    //关闭定时器
    [super viewDidDisappear:animated];
    [self releaseTimer];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self releaseTimer];
    
}
#pragma  mark  - 返回
- (IBAction)nav_backLoginView:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
