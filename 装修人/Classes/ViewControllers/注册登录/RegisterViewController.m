//
//  RegisterViewController.m
//  装修人
//
//  Created by 熊维东 on 2016/11/29.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import "RegisterViewController.h"
#import "Config.h"

@interface RegisterViewController ()<UITextFieldDelegate,UIAlertViewDelegate,UIGestureRecognizerDelegate>
{
    int seconds;
    NSTimer * timerInterval;//验证码倒计时
    BOOL isLightButton;
 
    NSString * BasePassWord;
    NSString *timeSp;
    
}

/**
 获取验证码
 */
@property (weak, nonatomic) IBOutlet UIButton *getCodeNumber;

/**
 图形验证码
 */
@property (weak, nonatomic) IBOutlet UIImageView *code_ImageView;

/**
 注册成功
 */
@property (weak, nonatomic) IBOutlet UIButton *login_Success;

/**
  正选反选勾勾
 */
@property (weak, nonatomic) IBOutlet UIButton *seleceted_tureOrFalse;
/**
 *  用户协议
 */
@property (weak, nonatomic) IBOutlet UIButton *btn_protocol;

/**
 tf，属性
 */

@property (weak, nonatomic) IBOutlet UITextField *tf_UserPhone;
@property (weak, nonatomic) IBOutlet UITextField *tf_CheckCode;
@property (weak, nonatomic) IBOutlet UITextField *tf_SettingPsword;
@property (weak, nonatomic) IBOutlet UITextField *tf_SurePsword;
@property (weak, nonatomic) IBOutlet UITextField *tf_imageCode;




@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initbgView];
    
}
#pragma mark - tf delegate
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
 
    CGRect frame = textField.frame;
    CGFloat heights = self.view.frame.size.height;
    // 当前点击textfield的坐标的Y值 + 当前点击textFiled的高度 - （屏幕高度- 键盘高度 - 键盘上tabbar高度）
    
    // 在这一部 就是了一个 当前textfile的的最大Y值 和 键盘的最全高度的差值，用来计算整个view的偏移量
    
    int offset = frame.origin.y + 42- ( heights - 216.0-35.0);//键盘高度216
    
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyBoard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    
    float width = self.view.frame.size.width;
    float height = self.view.frame.size.height;
    if(offset > 0)
    {
        CGRect rect = CGRectMake(0.0f, -offset,width,height);
        self.view.frame = rect;
        
    }
    [UIView commitAnimations];
    
    if (_tf_UserPhone.isFirstResponder ) {
        NSLog(@"手机号");
        [_tf_UserPhone becomeFirstResponder];
        
    }else if (_tf_CheckCode.isFirstResponder) {
        
        NSLog(@"验证码");
        [_tf_CheckCode becomeFirstResponder];
        
    }
    else if (_tf_SettingPsword.isFirstResponder)
    {
        NSLog(@"设置密码");
        [_tf_SettingPsword becomeFirstResponder];
    }
    else if (_tf_SurePsword.isFirstResponder){
        
        NSLog(@"确认密码");
        
        [_tf_SurePsword becomeFirstResponder];
        
    } else  if(_tf_imageCode.isFirstResponder){
        
        NSLog(@"图形验证编辑");
        
        [_tf_imageCode becomeFirstResponder];
        
    }
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    
    if (textField  == _tf_UserPhone ) {
        
        [CManager validateMobile:_tf_UserPhone.text];
      
        [[NSUserDefaults standardUserDefaults]setValue:_tf_UserPhone.text forKey:@"user_id"];
        NSLog(@"结束编辑  用户名 %@",_tf_UserPhone.text);
        
    }else if (textField  ==_tf_CheckCode) {
        
        NSLog(@"结束编辑  验证码");
    }
    
    else if (textField  == _tf_SettingPsword)
    {
        
     BasePassWord = [HttpRequest base64StringFromText:_tf_SettingPsword.text];
    [[NSUserDefaults standardUserDefaults]setValue:_tf_SettingPsword.text forKey:@"user_psd"];
        NSLog(@"结束编辑  设置密码 %@" ,BasePassWord);
        
    }
    else if (textField == _tf_SurePsword )
    {
        
        NSLog(@"结束编辑  设置密码 %@" ,BasePassWord);
 
    }
    else if (textField == _tf_imageCode)
    {
        NSLog(@"结束编辑  图形验证");
    }
    else if ([textField.text  isEqual:[NSNull null]]) {
        
        textField.text =  @"";
        
    }
    [self rectFrameAnimationEnd];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self commonMethods];
    [self rectFrameAnimationEnd];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self commonMethods];
    
    return YES;
}

-(void)rectFrameAnimationEnd{
    
    [self.view endEditing:YES];
  
    NSTimeInterval animationDuration = 0.30f;
    
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    
    [UIView setAnimationDuration:animationDuration];
    
    CGRect rect = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height);
    
    self.view.frame = rect;
    
    [UIView commitAnimations];
}

-(void)commonMethods{
    
    [_tf_UserPhone resignFirstResponder];
    [_tf_CheckCode resignFirstResponder];
    [_tf_SettingPsword resignFirstResponder];
    [_tf_SurePsword resignFirstResponder];
    [_tf_imageCode resignFirstResponder];
    
}


#pragma mark- 获取验证码
-(void)UserSecuritycodeTargetActionWithButton:(UIButton *)bt_numberCode{
    NSLog(@"获取验证码");
     if (_tf_UserPhone.text.length == 11) {
        seconds = 60 ;
        timerInterval =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeCountdown:) userInfo:nil repeats:YES];
        
         //验证码请求
        [self RequestgetCaptcha];
        [[NSRunLoop mainRunLoop] addTimer:timerInterval forMode:NSDefaultRunLoopMode];
        
    }
    else if (_tf_UserPhone.text.length == 0){
   
        [JHSysAlertUtil presentAlertViewWithTitle:@"提示" message:@"手机格式不正确" cancelTitle:@"取消" defaultTitle:@"确定" distinct:YES cancel:^{

            NSLog(@"cao zuo 1");
        } confirm:^{
            NSLog(@"cao zuo 2");

        }] ;
     
       
        
    }else{
        [JHSysAlertUtil presentAlertViewWithTitle:@"提示" message:@"手机格式不正确" cancelTitle:@"取消" defaultTitle:@"确定" distinct:YES cancel:^{
            
            NSLog(@"cao zuo 1");
        } confirm:^{
            NSLog(@"cao zuo 2");
            
        }] ;
     }
    
}


//倒计中时
-(void)timeCountdown :(NSTimer *)timer
{
    seconds--;
  
   [ _getCodeNumber setBackgroundColor:[UIColor colorWithWhite:0.784 alpha:1.000]];
    
    NSString *title = [NSString stringWithFormat:@"%d秒后重试",seconds ];
    
    [_getCodeNumber setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [_getCodeNumber setEnabled:NO];
    
    [_getCodeNumber setTitle:title forState:UIControlStateNormal];
    
    if (seconds == 0 ) {
        
        [_getCodeNumber setEnabled:YES];
    
        [_getCodeNumber setBackgroundColor:[UIColor colorWithRed:0.047 green:0.498 blue:0.855 alpha:1.000]];
        
        [_getCodeNumber setTitle:@"获取验证码" forState: UIControlStateNormal];
        
        [self releaseTimer];
    }
    
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
-(void)viewWillAppear:(BOOL)animated
{
    NSDate *date = [NSDate date];
    NSTimeZone *zone =  [NSTimeZone timeZoneForSecondsFromGMT:8];
    NSInteger interval = [zone secondsFromGMTForDate: date];
    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    // 时间转换成时间戳
    timeSp = [NSString stringWithFormat:@"%.f",[localeDate timeIntervalSince1970] *1000];
    
}

#pragma mark - 返回
- (IBAction)navBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}



//初始化
-(void)initbgView
{
    
    [self initCodeImageView];

    
    UITapGestureRecognizer * gestureSingle = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(touchImageView_code:)];
    self.tf_UserPhone.delegate =self;
    self.tf_SurePsword.delegate  =self;
    self.tf_CheckCode.delegate  =self;
    self.tf_SettingPsword.delegate  =self;
    self.tf_SurePsword.delegate  =self;
    self.tf_imageCode.delegate  =self;
    
    gestureSingle.delegate = self;
    gestureSingle.numberOfTapsRequired=1;
    [self.view  addGestureRecognizer:gestureSingle];

    //获取验证码
    [self.getCodeNumber setBackgroundColor:COLOR(22, 73, 145, 1)];
    self.getCodeNumber.layer.cornerRadius = 6     ;
    [self.getCodeNumber setTitle:@"获取验证码" forState: UIControlStateNormal];
    [self.getCodeNumber setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
    [self.getCodeNumber addTarget:self action:@selector(UserSecuritycodeTargetActionWithButton:) forControlEvents:UIControlEventTouchUpInside];
    
    //同意用户协议
    [_seleceted_tureOrFalse  addTarget:self action:@selector(tureOrFalse:) forControlEvents:UIControlEventTouchUpInside];
    [_seleceted_tureOrFalse setImage:[UIImage imageNamed:@"btn_select_mormal"] forState:UIControlStateNormal];
    //注册成功
    [_login_Success addTarget:self action:@selector(RegisterSuccess:) forControlEvents:UIControlEventTouchUpInside ];
 
    
}
-(void)initCodeImageView{
 
    [_code_ImageView sd_setImageWithURL:[NSURL URLWithString:imageCode_Url] placeholderImage:[UIImage imageNamed:@""] options:SDWebImageRefreshCached];
    

}
//图形验证码
-(void)touchImageView_code:(UITapGestureRecognizer * )sender
{
    [self initCodeImageView];
}

/**
 选择钩钩

 @param sender sender tureOrFalse
 */
#pragma mark - 钩钩
-(void)tureOrFalse:(UIButton*)sender
{
    
    sender.selected = !sender.selected;
    if (sender.selected == YES) {
        isLightButton = YES;
        [_seleceted_tureOrFalse setImage:[UIImage imageNamed:@"btn_select_active"] forState:UIControlStateNormal];
        
    }else{
        isLightButton = NO;
        [_seleceted_tureOrFalse setImage:[UIImage imageNamed:@"btn_select_mormal"] forState:UIControlStateNormal];
    }
}



/**
 获取短信验证码请求
 */
#pragma mark - 短信验证码
-(void)RequestgetCaptcha
{

    NSString * userid = [[NSUserDefaults standardUserDefaults]objectForKey:@"user_id"];

    
    NSString * common=[NSString stringWithFormat:@"cqkrszxrappkeyloginName%@timestamp%@",userid,timeSp];
    NSString * sign = [HttpRequest md5:common];
    
    NSDictionary* params = [NSDictionary dictionary];
    
    params = @{
                @"loginName" : userid,
                @"timestamp" : timeSp,//时间戳
                @"sign": sign,
               
               };
    [[HttpRequest shardWebUtil] postNetworkRequestURLString:GetCaptcha_Url parameters:params success:^(id obj) {
        
        NSLog(@"success ！~~~~");
        
    } fail:^(NSError *error) {
        
        NSLog(@"xxxxxxx ！~~~~");
        
        
    }];
    
    
    
}

/**
  获取图形验证码请求
  */
-(void)RequestGetValidateCode
{
    
    NSDictionary* params = [NSDictionary dictionary];
    
    params = @{
               @"validateCode" : _tf_imageCode.text,//短信验证码
            
               };
    
    [[HttpRequest shardWebUtil] postNetworkRequestURLString:imageCode_Url parameters:params success:^(id obj) {
        
        NSLog(@" 验证码 success ！~~~~");
        
    } fail:^(NSError *error) {
        
        NSLog(@" 验证码发送xxxxxxx ！~~~~");
        
        
    }];
    
    
    
}
/**
  注册请求验证
 */
-(void)RequestForRegister
{
//    NSString * ps1 = [[NSUserDefaults standardUserDefaults]objectForKey:@"password1"];
//    NSString * ps2 = [[NSUserDefaults standardUserDefaults]objectForKey:@"passwordEntry"];

    
    
    NSString * userid = [[NSUserDefaults standardUserDefaults]objectForKey:@"user_id"];

    NSLog(@"userid = %@, _tf_SurePsword = %@, _tf_imageCode= %@,_tf_CheckCode= %@,timeS==%@",userid,_tf_SurePsword.text,_tf_imageCode.text,_tf_CheckCode.text,timeSp);
    
    NSString * sign =   [HttpRequest md5: [NSString stringWithFormat:@"loginName%@password%@validateCode%@captcha%@timesramp%@",userid,_tf_SurePsword.text,_tf_imageCode.text,_tf_CheckCode.text,timeSp] ];
    
    
    NSDictionary* params = [NSMutableDictionary dictionary];
  
    params = @{

                   @"loginName" : userid,
                   @"password" : BasePassWord,
                   @"password" : BasePassWord,
                   @"validateCode" : _tf_imageCode.text,//图形验证码
                   @"captcha" : _tf_CheckCode.text,//短信验证码
                   @"timestamp" :  timeSp,
                   @"sign" :  sign,
            
                   };
        
        
        [[HttpRequest shardWebUtil] postNetworkRequestURLString:Base_Url parameters:params success:^(id obj) {
            
            [JHSysAlertUtil presentAlertViewWithTitle:@"提示" message:@"注册成功" confirmTitle:@"确定" handler:^{
                
            }];

            NSLog(@"注册成功   ---------    直接进首页");
            
            NSLog(@"success ！~~~~");
            
        } fail:^(NSError *error) {
            
            NSLog(@"xxxxxxx ！~~~~");
        
        }];
   
}

/**
 注册成功
 
 @param sender 注册成功
 */
-(void)RegisterSuccess:(UIButton*)sender
{
    NSLog(@"点击到了");
    
    if (![_tf_UserPhone.text isEqualToString: @""] && ![_tf_CheckCode.text isEqualToString: @""] && ![_tf_SurePsword.text isEqualToString: @"" ]&& ![_tf_imageCode.text isEqualToString: @""] && isLightButton == YES ) {
        
        [self RequestForRegister];

    } else {
    
        [TCTLAlertView showAerltViewWithTitle:@"提示" message:@"请填写完注册信息" cancelButtonTtitle:nil ensuerButtonTitle:@"确定" onSureUsingBlock:^{
            
        } onCancelUsingBlock:^{
            
        }];
 
    }

    if (_tf_UserPhone.text.length == 0  ||_tf_UserPhone.text.length != 11) {
        
        
        [TCTLAlertView showAerltViewWithTitle:@"提示" message:@"手机格式不正确" cancelButtonTtitle:nil ensuerButtonTitle:@"确定" onSureUsingBlock:^{
            
        } onCancelUsingBlock:^{
            
        }];
   
        
  
    }
    else if (_tf_CheckCode.text.length != 6  )
    {
        
        [TCTLAlertView showAerltViewWithTitle:@"提示" message:@"验证码输入错误" cancelButtonTtitle:nil ensuerButtonTitle:@"确定" onSureUsingBlock:^{
            
        } onCancelUsingBlock:^{
            
        }];
        
    }
    else  if ( _tf_SettingPsword.text.length <= 6 && _tf_SettingPsword.text.length >16)
    {
        [TCTLAlertView showAerltViewWithTitle:@"提示" message:@"输入的密码格式错误" cancelButtonTtitle:nil ensuerButtonTitle:@"确定" onSureUsingBlock:^{
            
        } onCancelUsingBlock:^{
            
        }];
        
    
    }
    else if ( ![_tf_SurePsword.text isEqualToString:_tf_SettingPsword.text])
        
    {
   
        
        [TCTLAlertView showAerltViewWithTitle:@"提示" message:@"输入的密码不匹配" cancelButtonTtitle:nil ensuerButtonTitle:@"确定" onSureUsingBlock:^{
            
        } onCancelUsingBlock:^{
            
        }];
        
  
    }
    else if (_tf_imageCode.text.length != 4)
    {
        [TCTLAlertView showAerltViewWithTitle:@"提示" message:@"验证码格式不正确" cancelButtonTtitle:nil ensuerButtonTitle:@"确定" onSureUsingBlock:^{
            
        } onCancelUsingBlock:^{
            
        }];
 
    }
    else if (isLightButton == NO)
    {
        [TCTLAlertView showAerltViewWithTitle:@"提示" message:@"请同意装修人用户协议" cancelButtonTtitle:nil ensuerButtonTitle:@"确定" onSureUsingBlock:^{
            
        } onCancelUsingBlock:^{
            
        }];
 
    }
    else{
        
        [self RequestForRegister];
        
 
    }
    
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
