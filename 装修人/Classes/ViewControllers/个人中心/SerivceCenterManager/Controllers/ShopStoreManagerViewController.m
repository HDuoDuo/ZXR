//
//  ShopStoreManagerViewController.m
//  装修人
//
//  Created by 熊维东 on 2016/12/15.
//  Copyright © 2016年 熊维东. All rights reserved.
//  店铺管理

#import "ShopStoreManagerViewController.h"

@interface ShopStoreManagerViewController ()

@end

@implementation ShopStoreManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [[NSBundle mainBundle]loadNibNamed:@"ShopStoreManagerViewController" owner:self options:nil];
    

    
}
#pragma mark - 保存
-(void)rightItemTapped
{
    NSLog(@" save  pp  ");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
    self.title = @"店铺管理";
    [self setLeftNaviItemWithTitle:@"" imageName:@"nav_return"];
    [self setRightNaviItemWithTitle:@" " imageName:@"font_save"];
    
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
