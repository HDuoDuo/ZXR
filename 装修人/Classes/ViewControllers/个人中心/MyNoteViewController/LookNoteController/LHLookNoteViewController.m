//
//  LHLookNoteViewController.m
//  装修人
//
//  Created by liuhang on 16/12/14.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import "LHLookNoteViewController.h"

@interface LHLookNoteViewController ()

@end

@implementation LHLookNoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)preciousBtn {
    NSLog(@"上一个");
}
- (IBAction)nextBtn {
    NSLog(@"下一个");
}
#pragma mark -- 系统方法
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.title = @"查看日记";
    self.navigationController.navigationBar.hidden = NO;
    [self setLeftNaviItemWithTitle:@"" imageName:@"nav_return"];
    [self setRightNaviItemWithTitle:@"" imageName:@"nav_delete"];
    self.navigationController.navigationBar.barTintColor =[UIColor whiteColor];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
