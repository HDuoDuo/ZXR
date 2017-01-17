//
//  personalCertificateViewController.m
//  装修人
//
//  Created by 熊维东 on 2016/12/9.
//  Copyright © 2016年 熊维东. All rights reserved.
//



#import "personalCertificateViewController.h"
#import "Config.h"

@interface personalCertificateViewController ()<UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIActionSheetDelegate>

@property (weak, nonatomic) IBOutlet UITextField *tf_yourName;
@property (weak, nonatomic) IBOutlet UITextField *tf_yourPhoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *tf_yourIDCard;

@property (weak, nonatomic) IBOutlet UIImageView *image_uploadFrontView;//正面照
@property (weak, nonatomic) IBOutlet UIImageView *image_uploadBackView;//反面照
@property (strong,nonatomic) UIImagePickerController * imagaPickerController;

@property (nonatomic, strong) JHSysImgPickerUtil *imgPickerUtil;

@end

@implementation personalCertificateViewController
@synthesize imagaPickerController;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    
    
    [self initInterfaceView];
}
-(void)initInterfaceView
{
    _tf_yourName.delegate = self;
    _tf_yourPhoneNumber.delegate = self;
    _tf_yourIDCard.delegate =self;
    
    
    
    
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
              @"id":idx,
              };
    
    [[HttpRequest  shardWebUtil]postNetworkRequestURLString:single_CertificateUrl parameters:param success:^(id obj) {
        
        NSLog(@" success !~~!~~!!!!!~~~~~");
        
    } fail:^(NSError *error) {
        NSLog(@"%@ == error",error);
    }];
    
}
#pragma  mark - 上传身份证正面
//上传正面
- (IBAction)uploadFrontAction:(id)sender {
    
   
    self.imgPickerUtil = [[JHSysImgPickerUtil alloc]init];
    
    [self.imgPickerUtil pickImageEditing:NO handler:^(UIImage *image) {
        
    
    _image_uploadFrontView.image =image;

    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
        
    [self saveImage:image];
    NSLog(@"@@~~在这里使用选取的图片: %@", image);
        
    }];
    
}
 
#pragma  mark - 上传身份证反面
- (IBAction)uploadBackIDcardAction:(id)sender {
    
    
    self.imgPickerUtil = [[JHSysImgPickerUtil alloc]init];
    
    [self.imgPickerUtil pickImageEditing:YES handler:^(UIImage *image) {
        
        
        _image_uploadBackView.image =image;
        
        NSLog(@"@@~~在这里使用选取的图片: %@", image);
        
        UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
        
        [self saveImage:image];
    }];

}
-(void)UpImageviewAndHttpsQequset
{
    NSDictionary *param = [NSDictionary dictionary];
    NSData * imageData ;
    [[HttpRequest  shardWebUtil]uploadImageWithUrl:@"" WithParams:param image:imageData filename:@"" mimeType:@"" completion:^(id dic) {
        
        NSLog(@"图片处理");
    } errorBlock:^(NSError *error) {
        NSLog(@"处理错误");
        
    }];
    
}


// 取消选取调用的方法
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 照片存到本地后的回调
- (void)image:(UIImage*)image didFinishSavingWithError:(NSError*)error contextInfo:(void*)contextInfo{
    if (!error) {
        //图片请求
        [self  UpImageviewAndHttpsQequset ];
        NSLog(@"存储成功");
    } else {
        NSLog(@"存储失败：%@", error);
    }
}
#pragma mark - 保存图片
- (void)saveImage:(UIImage *)currentImage {
    //设置照片的品质
    NSData *imageData = UIImageJPEGRepresentation(currentImage, 0.5);
    
    NSLog(@"%@",NSHomeDirectory());
    // 获取沙盒目录
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/currentImage.png"];
    // 将图片写入文件
    [imageData writeToFile:filePath atomically:NO];
}
#pragma  mark - 保存提交申请
- (IBAction)CommitCertificateAction:(id)sender {
    
    [self POST_requestNetWorking];
    
}

#pragma mark - 调用相册 > ios8
-(void)ActionSheetforPhtotAlbumONE
{
    
}
#pragma mark - 调用相册 < ios8
-(void)ActionSheetforPhtotAlbumTWO
{
    
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
    
    [self rectFrame];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self rectFrame];
    [self.tf_yourName resignFirstResponder];
    [self.tf_yourPhoneNumber resignFirstResponder];
    [self.tf_yourIDCard resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self rectFrame];
    [self.tf_yourName resignFirstResponder];
    [self.tf_yourPhoneNumber resignFirstResponder];
    [self.tf_yourIDCard resignFirstResponder];
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





-(void)viewWillAppear:(BOOL)animated
{
    self.navigationItem.title =@"个人认证";
    [self setLeftNaviItemWithTitle:@"" imageName:@"nav_return"];
    self.navigationController.navigationBar.hidden = NO;
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
