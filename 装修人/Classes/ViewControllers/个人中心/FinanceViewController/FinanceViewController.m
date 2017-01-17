//
//  FinanceViewController.m
//  装修人
//
//  Created by 熊维东 on 2016/12/9.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import "FinanceViewController.h"
#import "BindingBankCarViewController.h"
@interface FinanceViewController ()

@end

@implementation FinanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.


    
    
}
-(void)nav_back
{
    [self.navigationController popViewControllerAnimated:YES];

}
/**
 *  我的银行卡
 *
 *  @param sender MybankCardAction
 */
- (IBAction)MybankCardAction:(id)sender {
    
    self.hidesBottomBarWhenPushed = YES;

    BindingBankCarViewController * bindVC =[[BindingBankCarViewController alloc]init];
    [self.navigationController pushViewController:bindVC animated:NO];

 
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    self.title = @"财务管理";
    
    [self setLeftNaviItemWithTitle:@"" imageName:@"nav_return"];
    
    self.navigationController.navigationBar.barTintColor= [UIColor whiteColor];
    
    self.navigationController.navigationBar.hidden = NO;
    
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
