//
//  publishViewController.m
//  装修人
//
//  Created by liuhang on 17/1/17.
//  Copyright © 2017年 熊维东. All rights reserved.
//

#import "publishViewController.h"

@interface publishViewController ()

@end

@implementation publishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    self.title = @"发布需求";
    [self setLeftNaviItemWithTitle:@"" imageName:@"nav_return"];
    self.navigationController.navigationBar.barTintColor= [UIColor whiteColor];
    self.navigationController.navigationBar.hidden = NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
