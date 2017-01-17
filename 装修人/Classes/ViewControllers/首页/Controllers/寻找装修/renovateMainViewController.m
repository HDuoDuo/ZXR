//
//  renovateMainViewController.m
//  装修人
//
//  Created by liuhang on 17/1/17.
//  Copyright © 2017年 熊维东. All rights reserved.
//

#import "renovateMainViewController.h"
#import "comapnyMainTableViewCell.h"
#import "Config.h"
#import "companyMainHeader.h"
static NSString *cellIdentifier = @"comapnyMainTableViewCell";
@interface renovateMainViewController ()<UITableViewDataSource,UITableViewDelegate>
//tableView
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@end

@implementation renovateMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建UI
    [self createUI];
}
- (void)createUI {
    //cellHeight
    self.mainTableView.rowHeight = 166.0f;
    //去除指示器,分割线
    self.mainTableView.showsVerticalScrollIndicator = NO;
    self.mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //注册
    [self.mainTableView registerNib:[UINib nibWithNibName:@"comapnyMainTableViewCell" bundle:nil] forCellReuseIdentifier:cellIdentifier];
}
#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    comapnyMainTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell==nil){
        cell=[[comapnyMainTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault   reuseIdentifier:cellIdentifier];
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 290.0f;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    //header
    companyMainHeader *sectionHeader = [[NSBundle mainBundle]loadNibNamed:@"companyMainHeader" owner:self options:nil].firstObject;
    return sectionHeader;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.title = @"装修公司主页";
    [self setLeftNaviItemWithTitle:@"" imageName:@"nav_return"];
    self.navigationController.navigationBar.barTintColor= [UIColor whiteColor];
    self.navigationController.navigationBar.hidden = NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
