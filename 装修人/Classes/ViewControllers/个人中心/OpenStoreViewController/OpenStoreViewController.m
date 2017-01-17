//
//  OpenStoreViewController.m
//  装修人
//
//  Created by 熊维东 on 2016/12/12.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import "OpenStoreViewController.h"
#import "Config.h"
#import "AFNetworking.h"


@interface OpenStoreViewController ()<UIImagePickerControllerDelegate ,UITextFieldDelegate>
{
    NSString *filePath;
//    NSData *imageData ;
    NSString * data ;
    NSDictionary *dict;
    NSString *fullPath;//图片全路径
    
    
}
@property (weak, nonatomic) IBOutlet UIImageView *hideCameraView;
/**
 *  店铺logo
 */
@property (weak, nonatomic) IBOutlet UIImageView *storeLogoview;
/**
 *  需要隐藏的lb
 */
@property (weak, nonatomic) IBOutlet UILabel *lb_unalbehide;
/**
 *  店铺名称
 */
@property (weak, nonatomic) IBOutlet UITextField *tf_StoreName;
/**
 *  店铺简介
 */
@property (weak, nonatomic) IBOutlet UITextField *tf_shopContenttext;

/**
 *  经营范围
 */
@property (weak, nonatomic) IBOutlet UITextField *tf_scopeOfBusiness;
/**
 *  门店地址
 */
@property (weak, nonatomic) IBOutlet UITextField *tf_addressOfStore;
/**
 * 联系电话
 */
@property (weak, nonatomic) IBOutlet UITextField *tf_contactNumber;
/**
 *  pickerViewController
 */
@property (nonatomic, strong) JHSysImgPickerUtil *imgPickerUtil;
/**
 *  参数
 */
@property(nonatomic,strong) NSDictionary * param ;
/**
 *  申请开店
 */
@property (weak, nonatomic) IBOutlet UIButton *Btn_subcommit;

@end

@implementation OpenStoreViewController
@synthesize param;
-(NSDictionary *)param
{
    if (!param) {
        param = [NSDictionary dictionary];
    }
    return param;
}
/**
 *  提交申请开店
 *
 *  @param sender submitApplications
 */
- (IBAction)submitApplications:(id)sender {
    
    NSLog(@"申请开店");
   
    
    if (![_tf_StoreName.text isEqualToString:@"" ]&& ![_tf_contactNumber.text isEqualToString:@""] && ![_tf_addressOfStore.text isEqualToString:@""]&&![_tf_scopeOfBusiness.text isEqualToString:@""] && ![_tf_shopContenttext.text isEqualToString:@""]) {
        
        NSLog(@"xxxx");
     
        [self UploadImage];

        
    }else{

        [TCTLAlertView showAerltViewWithTitle:@"提示" message:@"请完整填写开店信息" cancelButtonTtitle:nil ensuerButtonTitle:@"OK" onSureUsingBlock:^{
            
        } onCancelUsingBlock:^{
            
        }];
    }
    
    // [self httpsRequestNetworking];

 //    [TCTLAlertView  showAerltViewWithTitle:@"xx" message:@"" cancelButtonTtitle:@"取消" ensuerButtonTitle:@"OK" onSureUsingBlock:^{
//        
//        
//        
//    } onCancelUsingBlock:^{
//        
//        [self UpImageviewAndHttpsQequset];
//
//        
//    }];
       
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initUserinterface];
}

-(void)initUserinterface
{
    UITapGestureRecognizer * singletap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(changeHStoreLogoView:)];
    singletap.delegate = self;
    singletap.numberOfTapsRequired = 1;
    self.storeLogoview.userInteractionEnabled = YES;
    [self.storeLogoview  addGestureRecognizer:singletap];
    self.storeLogoview.layer.cornerRadius = 8;
    
    self.tf_StoreName.delegate = self;
    self.tf_contactNumber.delegate =self;
    self.tf_addressOfStore.delegate = self;
    self.tf_scopeOfBusiness.delegate = self;
    self.tf_shopContenttext.delegate = self;
    
 
    
}

/**
 *  上传 信息
 */
-(void)httpsRequestNetworking
{
    /*
    userId,//用户ID String 不能为空
    shopLogo,//店铺logo MultipartFile  不能为空
    name,//店铺名称 String 不能为空
    managescope,//经营范围 String 不能为空
    address,//实体店地址 String 不能为空
    mobile,//手机号 String 不能为空
     */
    
    UIImage *image = [UIImage imageWithContentsOfFile:fullPath];
    NSData *imageData = UIImageJPEGRepresentation(image,0.5);
  //  NSDictionary *param2 = [NSDictionary dictionary];
    
   // NSLog(@"%@",imageData);
    param= @{
            
             @"userId":@"1",
             @"name": _tf_StoreName.text,
             @"managescope":_tf_scopeOfBusiness.text,
             @"address":_tf_addressOfStore.text,
             @"mobile":_tf_contactNumber.text,
         //    @"shopLogo":imageData,

             };
    
        NSLog(@"%@",param);
    
     [[HttpRequest shardWebUtil]postNetworkRequestURLString:openStore_Url parameters:param success:^(id obj) {

         
         NSLog(@" %@ 请求成功  马上上传图片",obj);
         
         data  = obj[@"data"];
         
         NSLog(@"%@ = data",data);
         
         

     } fail:^(NSError *error) {
        
         NSLog(@" 访问失败 %@ = error " ,error);
     }];
}


/**
 *  调用相册 更换logo
 *
 *  @param sender changeHStoreLogoView
 */
-(void)changeHStoreLogoView:(UITapGestureRecognizer *)sender
{
    NSLog(@"更换头像");
    
    self.imgPickerUtil = [[JHSysImgPickerUtil alloc]init];
    
    [self.imgPickerUtil pickImageEditing:YES handler:^(UIImage *image) {
        
        // 保存图片至本地，方法见下文
        [self saveImage:image withName:@"currentImage.png"];
        
        //读取路径进行上传
        fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"currentImage.png"];
        UIImage *savedImage = [[UIImage alloc] initWithContentsOfFile:fullPath];
        
        [_storeLogoview setImage:savedImage];//图片赋值显示
      
        NSLog(@"%@ path",fullPath);

        _lb_unalbehide.hidden = YES;

 
    
        
    }];
}
#pragma  mark - 上传图片

-(void)UploadImage
{
  
    UIImage *image = [UIImage imageWithContentsOfFile:fullPath];
    NSData *imageData = UIImageJPEGRepresentation(image,0.5);
    NSDictionary *param2 = [NSDictionary dictionary];
   
    NSLog(@"%@",imageData);
    
     param2= @{
               @"userId":@"1",
               @"name": _tf_StoreName.text,
               @"managescope":_tf_scopeOfBusiness.text,
               @"address":_tf_addressOfStore.text,
               @"mobile":_tf_contactNumber.text,
              };
 
    
    [[HttpRequest shardWebUtil]uploadFileWithURL:openStore_Url params:param2 fileKey:@"shopLogo" filePath:fullPath completeHander:^(NSURLResponse *response, NSData *datas, NSError *connectionError) {
    
        NSLog(@" 上传成功后 data =%@  "  , datas);
        
        _lb_unalbehide.hidden = YES;
    
        if (connectionError) {
            NSLog(@"请求出错 %@",connectionError);
        }else{
            NSLog(@"请求返回：\n%@",response);
        }

    }];
    
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
    
    if (_tf_StoreName.isFirstResponder ) {
        NSLog(@"店铺名");
        [_tf_StoreName becomeFirstResponder];
        
    }else if (_tf_shopContenttext.isFirstResponder) {
        
        NSLog(@"店铺内容");
        [_tf_shopContenttext becomeFirstResponder];
        
    }else if (_tf_scopeOfBusiness.isFirstResponder) {
        
        NSLog(@"经营范围");
        [_tf_scopeOfBusiness becomeFirstResponder];
        
    }
    
    else if (_tf_addressOfStore.isFirstResponder ) {
        NSLog(@"门店地址");
        [_tf_addressOfStore becomeFirstResponder];
        
    }else if (_tf_contactNumber.isFirstResponder) {
        
        NSLog(@"联系电话");
        [_tf_contactNumber becomeFirstResponder];
        
    }
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    
   
    

    if (textField  == _tf_StoreName ) {
        
        NSLog(@"结束编辑  店铺名");
        
    }else if (textField  ==_tf_shopContenttext) {
        
        
        NSLog(@"结束编辑  店铺简介内容");
        
    }
    
    else if (textField  ==_tf_scopeOfBusiness   ) {
        
        
        NSLog(@"结束编辑 经营范围");
        
    }
    else if (textField  == _tf_addressOfStore) {
        
        NSLog(@"结束编辑  门店地址");
        
    }
 
    else if (textField  ==_tf_contactNumber  ) {
        
        NSLog(@"结束编辑  联系点话");
    }


    

    [self rectFrame];
    
}
//改变状态
-(BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
     if (![_tf_StoreName.text isEqualToString:@"" ]&& ![_tf_contactNumber.text isEqualToString:@""] && ![_tf_addressOfStore.text isEqualToString:@""]&&![_tf_scopeOfBusiness.text isEqualToString:@""] && ![_tf_shopContenttext.text isEqualToString:@""]) {
         
         _Btn_subcommit.backgroundColor = RGBA(22, 73, 145, 1);
     }
     else{
      
         _Btn_subcommit.backgroundColor = RGBA(190, 190, 190, 1);
 
     }
    return  YES;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self rectFrame];
    [self.tf_StoreName resignFirstResponder];
    [self.tf_shopContenttext resignFirstResponder];
    [self.tf_scopeOfBusiness resignFirstResponder];
    [self.tf_addressOfStore resignFirstResponder];
    [self.tf_contactNumber resignFirstResponder];
 
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
 
    [self rectFrame];
    [self.tf_StoreName resignFirstResponder];
    [self.tf_shopContenttext resignFirstResponder];
    [self.tf_scopeOfBusiness resignFirstResponder];
    [self.tf_addressOfStore resignFirstResponder];
    [self.tf_contactNumber resignFirstResponder];
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


// 取消选取调用的方法
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [self dismissViewControllerAnimated:YES completion:nil];

}

#pragma mark - 保存图片至沙盒（应该是提交后再保存到沙盒,下次直接去沙盒取）
- (void) saveImage:(UIImage *)currentImage withName:(NSString *)imageName
{
    
     NSData *imageData  = UIImageJPEGRepresentation(currentImage, 0.5);
    // 获取沙盒目录
    
    NSString *fullPaths = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:imageName];
    // 将图片写入文件
    
    [imageData writeToFile:fullPaths atomically:NO];
}


//进入程序时从沙盒拿图片 后者去服务端下载
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationItem.title =@"我要开店";
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
