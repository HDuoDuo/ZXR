//
//  MydecorationViewController.m
//  装修人
//
//  Created by 熊维东 on 2016/12/1.
//  Copyright © 2016年 熊维东. All rights reserved.
//  我的装修

#import "MydecorationViewController.h"
#import "SignContractViewController.h"
#import "FirstDesignViewController.h"
#import "PaymentViewController.h"
#import "DesignerDetailViewController.h"

@interface MydecorationViewController ()

@end

@implementation MydecorationViewController
/**
 *  签订合同
 *
 *  @param sender signaContract_btn
 */
- (IBAction)signaContract_btn:(id)sender {
    NSLog(@"签订合同");
   
    self.hidesBottomBarWhenPushed= YES;
    SignContractViewController * signVC=[[SignContractViewController alloc]init];
    [self.navigationController pushViewController:signVC animated:NO];
     self.hidesBottomBarWhenPushed = NO;
}
/**
 *  付款
 *
 *  @param sender payment_btn
 */
- (IBAction)payment_btn:(id)sender {
    NSLog(@"支付");
    
    self.hidesBottomBarWhenPushed= YES;
    PaymentViewController * payVC = [[PaymentViewController alloc]init];
    [self.navigationController pushViewController:payVC animated:NO];

     self.hidesBottomBarWhenPushed = NO;
}

/**
 *  设计师详情
 *
 *  @param sender designerdetail_btn
 */
- (IBAction)designerdetail_btn:(id)sender {
    NSLog(@"设计师详情");
    
    
    self.hidesBottomBarWhenPushed= YES;
    DesignerDetailViewController * desVC = [[DesignerDetailViewController alloc]init];
    [self.navigationController pushViewController:desVC animated:NO];
    self.hidesBottomBarWhenPushed = NO;

}

/**
 *  设计初稿
 *
 *  @param sender first mold design
 */
- (IBAction)firstDesign_btn:(id)sender {
    NSLog(@"设计初稿");
    
    self.hidesBottomBarWhenPushed= YES;
    FirstDesignViewController * firstVC = [[FirstDesignViewController alloc]init];
    [self.navigationController pushViewController:firstVC animated:NO];
    self.hidesBottomBarWhenPushed = NO;

}






- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
