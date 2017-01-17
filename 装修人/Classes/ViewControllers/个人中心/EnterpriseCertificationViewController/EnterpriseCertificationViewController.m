//
//  EnterpriseCertificationViewController.m
//  装修人
//
//  Created by 熊维东 on 2016/12/12.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import "EnterpriseCertificationViewController.h"
#import "Config.h"

@interface EnterpriseCertificationViewController ()
/**
 *  法人信息
 */
@property (weak, nonatomic) IBOutlet UITextField *tf_yourName;
/**
 *  手机号
 */
@property (weak, nonatomic) IBOutlet UITextField *tf_yourPhoneNumber;
/**
 *  身份证ID
 */
@property (weak, nonatomic) IBOutlet UITextField *tf_yourIDCard;
/**
 *  公司资质
 */
@property (weak, nonatomic) IBOutlet UITextField *tf_intelligence;
/**
 *  注册地址
 */
@property (weak, nonatomic) IBOutlet UITextField *tf_companyRegisterAddress;
/**
 *  时间
 */
@property (weak, nonatomic) IBOutlet UITextField *tf_CompanyRegistetime;
/**
 *  背景view
 */
@property (weak, nonatomic) IBOutlet UIView *bgView;
@end

@implementation EnterpriseCertificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

}
/**
 *  上传身份证
 *
 *  @param sender uploadingIDCard
 */
- (IBAction)uploadingIDCard:(id)sender {
}
/**
 *  上传公司执照
 *
 *  @param sender uploadingCompanylicense
 */
- (IBAction)uploadingCompanylicense:(id)sender {
}

#pragma mark  -  tf delegate
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGRect frame = textField.frame;
    CGFloat heights =self.view.frame.size.height;
    // 当前点击textfield的坐标的Y值 + 当前点击textFiled的高度 - （屏幕高度- 键盘高度 - 键盘上tabbar高度）
    int offset = frame.origin.y + 50 - (heights  -216 -35.0);
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyBoard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    float width = self.view.frame.size.width;
    float height = self.view.frame.size.height;
    if(offset > 0){
        
        CGRect rect = CGRectMake(0.0f, -offset,width,height);
        self.view.frame = rect;
    }
    [UIView commitAnimations];
    
    if (_tf_yourName.isFirstResponder ) {
        NSLog(@"您的姓名");
        [_tf_yourName becomeFirstResponder];
        
    }else if (_tf_yourPhoneNumber.isFirstResponder) {
        
        NSLog(@"手机号码");
        [_tf_yourPhoneNumber becomeFirstResponder];
        
    }else if (_tf_yourIDCard.isFirstResponder) {
        
        NSLog(@"手机号码");
        [_tf_yourIDCard becomeFirstResponder];
        
    }
    
    else if (_tf_intelligence.isFirstResponder ) {
        NSLog(@"公司资质");
        [_tf_intelligence becomeFirstResponder];
        
    }else if (_tf_companyRegisterAddress.isFirstResponder) {
        
        NSLog(@"注册地址");
        [_tf_companyRegisterAddress becomeFirstResponder];
        
    }else if (_tf_CompanyRegistetime.isFirstResponder) {
        
        NSLog(@"注册时间");
        [_tf_CompanyRegistetime becomeFirstResponder];
        
    }
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField  == _tf_yourName ) {
        
        //        [[NSUserDefaults standardUserDefaults]setValue:_tf_yourName.text forKey:@"userPhone_id"];
        
        NSLog(@"结束编辑  姓名");
        
    }else if (textField  ==_tf_yourPhoneNumber) {
        
        [CManager validateMobile:_tf_yourPhoneNumber.text];
        
        NSLog(@"结束编辑  手机号");
        
    }
    
    else if (textField  ==_tf_yourPhoneNumber) {
        
        [CManager validateIdentityCard:_tf_yourIDCard.text];
        
        NSLog(@"结束编辑 身份验证");
        
    }
    else if (textField  == _tf_intelligence) {
        
        NSLog(@"结束编辑_tf_intelligence 公司资质");
        
    }

    else if (textField  == _tf_companyRegisterAddress) {
        
        NSLog(@"结束编辑 公司地址");
        
    }
    else if (textField  == _tf_CompanyRegistetime) {
        
        NSLog(@"结束编辑  注册时间");
    }


    [self rectFrame];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self rectFrame];
    [self.tf_yourName resignFirstResponder];
    [self.tf_yourPhoneNumber resignFirstResponder];
    [self.tf_yourIDCard resignFirstResponder];
    [self.tf_intelligence resignFirstResponder];
    [self.tf_CompanyRegistetime resignFirstResponder];
    [self.tf_companyRegisterAddress resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self rectFrame];
    [self.tf_yourName resignFirstResponder];
    [self.tf_yourPhoneNumber resignFirstResponder];
    [self.tf_yourIDCard resignFirstResponder];
    [self.tf_intelligence resignFirstResponder];
    [self.tf_CompanyRegistetime resignFirstResponder];
    [self.tf_companyRegisterAddress resignFirstResponder];
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

/**
 *  申请认证
 *
 *  @param sender commitApplytoAndPostRequst
 */

- (IBAction)commitApplytoAndPostRequst:(id)sender {
    [self POST_requestNetWorking];
}


#pragma mark -  提交申请 post请求
-(void)POST_requestNetWorking
{
    NSDictionary * param = [NSDictionary dictionary];
    
  
    
    NSString * idx= @"1";
    param = @{
              @"name":_tf_yourName.text,
              @"mobile":_tf_yourPhoneNumber.text,
              @"cardid":_tf_yourIDCard.text,
              @"companyname":_tf_intelligence.text,
              @"regaddress":_tf_companyRegisterAddress.text,
              @"regdate":_tf_CompanyRegistetime.text,
              @"id":idx,
              
              };
    
    [[HttpRequest  shardWebUtil]postNetworkRequestURLString:enterprise_CertificateUrl parameters:param success:^(id obj) {
        
        NSLog(@" success !~~!~~!!!!!~~~~~");
        
    } fail:^(NSError *error) {
        NSLog(@"%@ == error",error);
    }];
    
}



-(void)viewWillAppear:(BOOL)animated
{
    self.navigationItem.title =@"企业认证";
    self.navigationController.navigationBar.hidden = NO;
    [self setLeftNaviItemWithTitle:@"" imageName:@"nav_return"];
    self.navigationController.navigationBar.barTintColor= [UIColor whiteColor];

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
