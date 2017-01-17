//
//  BecomeEnterpriseServiceViewController.m
//  装修人
//
//  Created by 熊维东 on 2016/12/22.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import "BecomeEnterpriseServiceViewController.h"

@interface BecomeEnterpriseServiceViewController ()

@end

@implementation BecomeEnterpriseServiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewWillAppear:(BOOL)animated
{
    self.title = @"申请企业服务商";
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
