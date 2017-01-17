//
//  goodShopViewController.m
//  装修人
//
//  Created by liuhang on 17/1/16.
//  Copyright © 2017年 熊维东. All rights reserved.
//

#import "goodShopViewController.h"
#import "goodShopTableViewCell.h"
static NSString *cellIdentifier = @"goodShopTableViewCell";
@interface goodShopViewController ()<UITableViewDataSource,UITableViewDelegate>
//tableView
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@end

@implementation goodShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建UI
    [self createUI];
}
- (void)createUI {
    //cellHeight
    self.mainTableView.rowHeight = 240.0f;
    //去除指示器,分割线
    self.mainTableView.showsVerticalScrollIndicator = NO;
    self.mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //注册
    [self.mainTableView registerNib:[UINib nibWithNibName:@"goodShopTableViewCell" bundle:nil] forCellReuseIdentifier:cellIdentifier];
}
#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    goodShopTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell==nil){
        cell=[[goodShopTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault   reuseIdentifier:cellIdentifier];
    }
    return cell;
}
#pragma mark -- UITableViewDelegate
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title = @"优质店铺";
    [self setLeftNaviItemWithTitle:@"" imageName:@"nav_return"];
    self.navigationController.navigationBar.barTintColor= [UIColor whiteColor];
    self.navigationController.navigationBar.hidden = NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
@end
