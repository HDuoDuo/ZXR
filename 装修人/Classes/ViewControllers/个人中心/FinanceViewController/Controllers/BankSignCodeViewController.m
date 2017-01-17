//
//  BankSignCodeViewController.m
//  装修人
//
//  Created by 熊维东 on 2016/12/21.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import "BankSignCodeViewController.h"
#import "BindingBankCarViewController.h"
@interface BankSignCodeViewController ()

@end

@implementation BankSignCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
/**
 *  完成绑定
 *
 *  @param sender FinishedBindingBankcard
 */
- (IBAction)FinishedBindingBankcard:(id)sender {

    [self.navigationController popToViewController: self.navigationController.viewControllers[2] animated:NO];
    
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
