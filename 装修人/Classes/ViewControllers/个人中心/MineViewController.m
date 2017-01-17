//
//  MineViewController.m
//  装修人
//
//  Created by 熊维东 on 2016/12/1.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import "MineViewController.h"
#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "OrderTableViewController.h"
#import "CouconViewController.h"
#import "FinanceViewController.h"
#import "personalCertificateViewController.h"
#import "EnterpriseCertificationViewController.h"
#import "OpenStoreViewController.h"
#import "AnswerManagerViewController.h"
#import "RequireMangerViewController.h"
#import "LHMyNoteViewController.h"

#import "SettingViewController.h" //设置
#import "HeadViewController.h"//头像信息
#import "ShoppingViewController.h"
#import "ShopStoreManagerViewController.h"//303店铺
#import "GoodsManagerViewController.h"//306商品
#import "EvaluateManagerViewController.h" //305评价
#import "ServiceOrderManagerViewController.h"  //304订单

#import "BecomePersonalServiceViewController.h"//申请成为个人服务商
#import "BecomeEnterpriseServiceViewController.h"//申请成为企业服务商
#import "Config.h"


@class  ServiceManagerView;

@interface MineViewController ()
{
    UIView * bgView;
    UIButton * select_btn ;
    UIButton * Store_btn  ;//店铺管理
    UIButton * Order_btn  ;//订单管理
    UIButton * Goods_btn  ;//店铺管理
    UIButton * Evaluate_btn;//评价管理
    UIVisualEffectView *effectView ;//高斯view
    
    
}
/**
 *  用户头像
 */
@property (weak, nonatomic) IBOutlet UIImageView *user_headImgView;
/**
 *  个人认证状态
 */
@property (weak, nonatomic) IBOutlet UILabel *lb_singleStatus;
/**
 *  企业认证状态
 */
@property (weak, nonatomic) IBOutlet UILabel *lb_enterpriseStatus;
/**
 *  用户名
 */
@property (weak, nonatomic) IBOutlet UILabel *lb_userName;
/**
 *  认证状态
 */
@property (weak, nonatomic) IBOutlet UILabel *lb_certificateStatus;
/**
 *  我的积分
 */
@property (weak, nonatomic) IBOutlet UILabel *lb_myIntegral;
/**
 *  立即注册
 */
@property (weak, nonatomic) IBOutlet UIButton *btn_registerNow;
/**
 *  立即登录
 */
@property (weak, nonatomic) IBOutlet UIButton *btn_loginNow;
/**
 *  背景状态view 的颜色
 */
@property (weak, nonatomic) IBOutlet BGView *bg_StatusView;

/**
 *  数据
 */
@property(strong,nonatomic) NSDictionary * dataDic;


@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    _btn_loginNow.hidden = YES;
    _btn_registerNow.hidden = YES;
    

}
/**
 *  编辑个人头像资料
 *
 *  @param sender ChageHeadImage_btn
 */
- (IBAction)ChageHeadImage_btn:(id)sender {
   
    self.hidesBottomBarWhenPushed = YES;
    HeadViewController * headVC = [[HeadViewController alloc]init];
    [self.navigationController pushViewController:headVC animated:NO];
    self.hidesBottomBarWhenPushed = NO;
}


/**
 *  设置
 *
 *  @param sender SettingTarget_btn
 */
- (IBAction)SettingTarget_btn:(id)sender {
    
    self.hidesBottomBarWhenPushed = YES;
    SettingViewController * settVC = [[SettingViewController alloc]init];
    [self.navigationController pushViewController:settVC animated:NO];
    self.hidesBottomBarWhenPushed = NO;
}
/**
 *  消息
 *
 *  @param sender MessageTarget_btn
 */
- (IBAction)MessageTarget_btn:(id)sender {
    
    
}


-(NSDictionary *)dataDic
{
    if (!_dataDic) {
        
        _dataDic =[ NSDictionary dictionary];
    
    }
    return _dataDic;
}
#pragma mark - 登录
- (IBAction)pushToLoginVC:(id)sender {
    
    LoginViewController *logvc = [[LoginViewController alloc]init];
    [self presentViewController:logvc animated:YES completion:nil];
    
 
}
#pragma mark - 注册
- (IBAction)pushToRegiseterPageVC:(id)sender {
    
    RegisterViewController *registerVC = [[RegisterViewController alloc]init];
    [self presentViewController:registerVC animated:YES completion:nil];
    
}


#pragma mark  -  我的订单
- (IBAction)MyOrderSender:(id)sender {
    
    self.hidesBottomBarWhenPushed=YES;
    OrderTableViewController * detailVC =[[ OrderTableViewController alloc]init];
    [self.navigationController pushViewController:detailVC animated:NO];
    self.hidesBottomBarWhenPushed=NO;

    
}
#pragma mark  -  财务管理
- (IBAction)cashManagerSender:(id)sender {
    
    self.hidesBottomBarWhenPushed=YES;
    FinanceViewController * financeVC =[[ FinanceViewController alloc]init];
    [self.navigationController pushViewController:financeVC animated:NO];
    self.hidesBottomBarWhenPushed=NO;
}

#pragma mark  - 优惠券管理
- (IBAction)couponManagerAction:(id)sender {
    
    self.hidesBottomBarWhenPushed=YES;
    CouconViewController * couponVC =[[ CouconViewController alloc]init];
    [self.navigationController pushViewController:couponVC animated:NO];
    self.hidesBottomBarWhenPushed=NO;
}
#pragma mark  - 服务商中心
- (IBAction)serviceCenter:(id)sender {
    
    [self InitcreatUIofSeviceCenterView];
    
}

#pragma mark  - 个人认证
- (IBAction)single_identification:(id)sender {
    
    self.hidesBottomBarWhenPushed=YES;
    personalCertificateViewController * personalVC =[[personalCertificateViewController alloc]init];
    [self.navigationController pushViewController: personalVC animated:NO];
    self.hidesBottomBarWhenPushed=NO;
}
#pragma mark  - 企业认证
- (IBAction)enterprise_identification:(id)sender {
    
    self.hidesBottomBarWhenPushed=YES;
    EnterpriseCertificationViewController * enterVC =[[ EnterpriseCertificationViewController alloc]init];
    [self.navigationController pushViewController:enterVC animated:NO];
    self.hidesBottomBarWhenPushed=NO;
    
}
#pragma mark  -  申请成为个人服务商
- (IBAction)ApplyToSingleServiver:(id)sender {
    
    self.hidesBottomBarWhenPushed=YES;
    BecomePersonalServiceViewController * personalVC =[[ BecomePersonalServiceViewController alloc]init];
    [self.navigationController pushViewController:personalVC animated:NO];
    self.hidesBottomBarWhenPushed=NO;


}
#pragma mark  -  申请成为企业服务商
- (IBAction)ApplyTo_enterpriseServiver:(id)sender {
    
    self.hidesBottomBarWhenPushed=YES;
    BecomeEnterpriseServiceViewController * enterVC =[[ BecomeEnterpriseServiceViewController alloc]init];
    [self.navigationController pushViewController:enterVC animated:NO];
    self.hidesBottomBarWhenPushed=NO;


}

#pragma mark  -  我的日记
- (IBAction)myDiary:(id)sender {
    LHMyNoteViewController *noteVC = [[LHMyNoteViewController alloc]init];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:noteVC animated:NO];
    self.hidesBottomBarWhenPushed = NO;

}

#pragma mark  -  我的需求
- (IBAction)myRequirement:(id)sender {
 
    self.hidesBottomBarWhenPushed = YES;
    RequireMangerViewController* requireVC = [[RequireMangerViewController alloc]init];
    [self.navigationController pushViewController:requireVC animated:NO];
    self.hidesBottomBarWhenPushed=NO;

 
}
#pragma mark  -  我要开店
- (IBAction)openStoreaction:(id)sender {

    self.hidesBottomBarWhenPushed = YES;
    OpenStoreViewController* openVC = [[OpenStoreViewController alloc]init];
    [self.navigationController pushViewController:openVC animated:NO];
    self.hidesBottomBarWhenPushed=NO;

 
    
}

#pragma mark  -  问答管理
- (IBAction)answerManager:(id)sender {
    
    self.hidesBottomBarWhenPushed = YES;
    AnswerManagerViewController* answerVC = [[AnswerManagerViewController alloc]init];
    [self.navigationController pushViewController:answerVC animated:NO];
    self.hidesBottomBarWhenPushed=NO;

    
}


#pragma mark  - 初始化btn  弹出View效果和动画
-(void)InitcreatUIofSeviceCenterView
{
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
    effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
    bgView = [[NSBundle mainBundle]loadNibNamed:@"ServiceManagerView" owner:self options:nil].lastObject;
    
    effectView.frame = CGRectMake(0, KScreenHeight/2, KScreenWidth, KScreenHeight);
    bgView.frame = CGRectMake(0, KScreenHeight/2, KScreenWidth, KScreenHeight);
    effectView.alpha = 0.9;
    
    [effectView addSubview:bgView];
    [self.view addSubview:effectView];
    
    //选择删除
    select_btn = (UIButton *)[bgView viewWithTag:302];
    [select_btn addTarget: self action:@selector(deleteDismissView:) forControlEvents:UIControlEventTouchUpInside];
    select_btn.adjustsImageWhenHighlighted = NO;
    self.tabBarController.tabBar.hidden = YES;
    
    //店铺管理
    Store_btn =(UIButton*) [effectView viewWithTag:306];
    [Store_btn addTarget: self action:@selector(selectStoreView:) forControlEvents:UIControlEventTouchUpInside];
    Store_btn.adjustsImageWhenHighlighted = NO;
    
    //评价管理
    Evaluate_btn =(UIButton*) [effectView viewWithTag:305];
    [Evaluate_btn addTarget: self action:@selector(selectEvaluteView:) forControlEvents:UIControlEventTouchUpInside];
    Evaluate_btn.adjustsImageWhenHighlighted = NO;
    
    //订单管理
    Order_btn =(UIButton*) [effectView viewWithTag:304];
    [Order_btn addTarget: self action:@selector(selectOrderView:) forControlEvents:UIControlEventTouchUpInside];
    Order_btn.adjustsImageWhenHighlighted = NO;
    
    //商品管理
    Goods_btn =(UIButton*) [effectView viewWithTag:303];
    [Goods_btn addTarget: self action:@selector(selectGoodsView:) forControlEvents:UIControlEventTouchUpInside];
    Goods_btn.adjustsImageWhenHighlighted = NO;
 
    
    [UIView animateWithDuration: 0.35 animations:^{
        
        effectView.frame = CGRectMake(0,0, KScreenWidth, KScreenHeight);
        bgView.frame = CGRectMake(0,0, KScreenWidth, KScreenHeight);
        
    } completion:^(BOOL finished) {
        
    }];
}

#pragma mark -  店铺管理
-(void)selectStoreView:(UIButton *)sender
{

    ShopStoreManagerViewController * shopVC =[[ ShopStoreManagerViewController alloc]init];
    [self.navigationController pushViewController:shopVC animated:NO];
    
}
#pragma mark -  评价管理
-(void)selectEvaluteView:(UIButton *)sender
{
    EvaluateManagerViewController * evaVC = [[EvaluateManagerViewController alloc]init];
    [self.navigationController pushViewController:evaVC animated:NO];
    
}
#pragma mark -  订单管理
-(void)selectOrderView:(UIButton *)sender
{
    
    ServiceOrderManagerViewController * orderVC = [[ServiceOrderManagerViewController alloc]init];
    [self.navigationController pushViewController:orderVC animated:NO];
    
}
#pragma mark -  商品管理
-(void)selectGoodsView:(UIButton *)sender
{
    GoodsManagerViewController * goodsVC = [[GoodsManagerViewController alloc]init];
    [self.navigationController pushViewController:goodsVC animated:NO];
    
}


#pragma mark  -  bgview消失动画
-(void)deleteDismissView:(UIButton * )sender
{
    NSLog(@"消失");
    
    [UIView animateWithDuration: 0.35 animations:^{
        
        bgView.frame = CGRectMake(0, KScreenHeight, KScreenWidth, KScreenHeight);
        effectView.frame = CGRectMake(0, KScreenHeight , KScreenWidth, KScreenHeight);
        
    } completion:^(BOOL finished) {
        
        bgView.hidden = YES;
        effectView.hidden = YES;
        self.tabBarController.tabBar.hidden = NO;

    }];
}



/**
 *  网络请求
 */
-(void)HTTPPOSTRequestAfn
{
    NSDictionary  * param = [NSDictionary dictionary];
    param = @{
              @"userid":@"41fcb53109a5454b8e0e4c27dc49a806",
              };

    DDWeakSelf;
    
    [[HttpRequest shardWebUtil]postNetworkRequestURLString:mine_Url parameters:param success:^(id obj) {
       
        
        weakSelf.dataDic = obj[@"data"];
       
        [SVProgressHUD showSuccessWithStatus:@"加载完毕😁"];

//        NSLog(@"！@-@！请求成功了！ %@ = datadic ",weakSelf.dataDic);
    
        _lb_userName.text = weakSelf.dataDic[@"name"];

         NSString *intergral = [NSString stringWithFormat:@"%@",weakSelf.dataDic[@"integral"]];
                               
        _lb_myIntegral.text =intergral ;
        
        if ([weakSelf.dataDic[@"is_valid"] isEqualToString:@"0"] ) {
            
            _lb_enterpriseStatus.text = @"未认证";
            _lb_singleStatus.text = @"未认证";
            _lb_certificateStatus.text =@"未认证";
            _bg_StatusView.backgroundColor = [UIColor colorWithRed:0.698 green:0.702 blue:0.678 alpha:1.000];
        }
        
        else if ([weakSelf.dataDic[@"is_valid"] isEqualToString:@"1"]) {
           
            _lb_enterpriseStatus.text = @"已认证";
            _lb_certificateStatus.text =@"企业已认证";
            _bg_StatusView.backgroundColor = [UIColor colorWithRed:0.961 green:0.576 blue:0.000 alpha:1.000];

        }else if ([weakSelf.dataDic[@"is_valid"] isEqualToString:@"2"]){
         
            _lb_singleStatus.text = @"已认证";
            _lb_certificateStatus.text =@"个人已认证";
            _bg_StatusView.backgroundColor = [UIColor colorWithRed:0.961 green:0.576 blue:0.000 alpha:1.000];
        }else{
         
            _lb_singleStatus.text= @"已认证";
            _lb_enterpriseStatus.text =@"已认证";
            _lb_certificateStatus.text =@"已认证";
            _bg_StatusView.backgroundColor = [UIColor colorWithRed:0.961 green:0.576 blue:0.000 alpha:1.000];
        }
        
        NSURL * img_URL = [NSURL URLWithString: [NSString stringWithFormat:@"%@%@",img_BaseURL,weakSelf.dataDic[@"photo"]]];
 
       [weakSelf.user_headImgView sd_setImageWithURL:img_URL completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
           
           weakSelf.user_headImgView.image = [self circleImage:weakSelf.user_headImgView.image withParam:0];
           
       }];
        
    } fail:^(NSError *error) {
        
        NSLog(@"请求失败 ！@-@！~~~error = %@",error);
        
    }];
    
    [SVProgressHUD dismiss];

}


/**
 *  圆角处理
 *
 *  @param image 要切的图
 *  @param inset 边角
 *
 *  @return  参数
 */
-(UIImage*)circleImage:(UIImage*)image withParam:(CGFloat) inset {
    
    UIGraphicsBeginImageContext(image.size);
    
    CGContextRef context =UIGraphicsGetCurrentContext();
    
    //圆的边框宽度为1，颜色为白色
    
    CGContextSetLineWidth(context,1);
    
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    
    CGRect rect = CGRectMake(inset, inset, image.size.width - inset *2.0f, image.size.height - inset *2.0f);
    
    CGContextAddEllipseInRect(context, rect);
    
    CGContextClip(context);
    
    //在圆区域内画出image原图
    
    [image drawInRect:rect];
    
    CGContextAddEllipseInRect(context, rect);
    
    CGContextStrokePath(context);
    
    //生成新的image
    
    UIImage *newimg = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newimg;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.hidden = YES;
    
    [self HTTPPOSTRequestAfn];
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
