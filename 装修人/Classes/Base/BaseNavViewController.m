//
//  BaseNavViewController.m
//  装修人
//
//  Created by 熊维东 on 2016/11/30.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import "BaseNavViewController.h"
#import "Config.h"
@interface BaseNavViewController ()

@end

@implementation BaseNavViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.delegate = self;
    self.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationBar.barTintColor = COLOR(22, 73, 145, 1);
    
}

//返回按钮
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    viewController.hidesBottomBarWhenPushed = YES;
    [super pushViewController:viewController animated:animated];
    
}
-(void)nav_back
{
     [self.navigationController popViewControllerAnimated:YES];
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
