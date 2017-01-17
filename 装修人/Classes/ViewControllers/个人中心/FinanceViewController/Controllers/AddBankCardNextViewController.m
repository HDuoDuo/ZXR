//
//  AddBankCardNextViewController.m
//  装修人
//
//  Created by 熊维东 on 2016/12/21.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import "AddBankCardNextViewController.h"
#import "BankSignCodeViewController.h"
@interface AddBankCardNextViewController ()

@end

@implementation AddBankCardNextViewController
/**
 *  下一步 获取验证码页面
 *
 *  @param sender getNextSignCode
 */
- (IBAction)getNextSignCode:(id)sender {
    
    self.hidesBottomBarWhenPushed =YES;

    BankSignCodeViewController * bankSignVC = [[BankSignCodeViewController alloc]init];
    [self.navigationController pushViewController:bankSignVC animated:NO];
    
 
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    self.title = @"添加银行卡";
    [self setLeftNaviItemWithTitle:@"" imageName:@"nav_return"];
    self.navigationController.navigationBar.barTintColor= [UIColor whiteColor];
    self.navigationController.navigationBar.hidden = NO;
    
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
