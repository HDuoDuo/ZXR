//
//  RenovateCaseViewController.m
//  装修人
//
//  Created by liuhang on 17/1/16.
//  Copyright © 2017年 熊维东. All rights reserved.
//

#import "RenovateCaseViewController.h"
#import "CaseTableViewCell.h"
static NSString *cellIdentifier = @"CaseTableViewCell";
@interface RenovateCaseViewController ()<UITableViewDelegate,UITableViewDataSource>
//tableView
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@end

@implementation RenovateCaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建UI
    [self createUI];
}
- (void)createUI {
    //cellHeight
    self.mainTableView.rowHeight = 225.0f;
    //去除指示器,分割线
    self.mainTableView.showsVerticalScrollIndicator = NO;
    self.mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //注册
    [self.mainTableView registerNib:[UINib nibWithNibName:@"CaseTableViewCell" bundle:nil] forCellReuseIdentifier:cellIdentifier];
}

#pragma mark -- UITableViewDelegate,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CaseTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell==nil){
        
        cell=[[CaseTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault   reuseIdentifier:cellIdentifier];
    }
    return cell;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title = @"装修案例";
    [self setLeftNaviItemWithTitle:@"" imageName:@"nav_return"];
    self.navigationController.navigationBar.barTintColor= [UIColor whiteColor];
    self.navigationController.navigationBar.hidden = NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
@end
