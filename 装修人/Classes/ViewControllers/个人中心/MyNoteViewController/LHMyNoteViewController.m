//
//  LHMyNoteViewController.m
//  装修人
//
//  Created by liuhang on 16/12/14.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import "LHMyNoteViewController.h"
#import "LHMyNoteCell.h"
#import "LHLookNoteViewController.h"
#import "makeNoteViewController.h"
static NSString *cellIdentifier = @"LHMyNoteCell";

@interface LHMyNoteViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *mainTableView;
@end

@implementation LHMyNoteViewController
//延迟加载
- (UITableView *)mainTableView {
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height) style:UITableViewStylePlain];
        //cell高度
        _mainTableView.rowHeight = 100.0f;
        //去除指示器,分割线
        _mainTableView.showsVerticalScrollIndicator = NO;
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        //注册
        [_mainTableView registerNib:[UINib nibWithNibName:@"LHMyNoteCell" bundle:nil] forCellReuseIdentifier:cellIdentifier];
        //设置代理
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;        
    }
    return _mainTableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //创建UI
    [self createUI];
}
- (void)createUI {
    //添加tableView
    [self.view addSubview:self.mainTableView];
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LHMyNoteCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell==nil) {
        cell=[[LHMyNoteCell alloc] initWithStyle:UITableViewCellStyleDefault   reuseIdentifier:cellIdentifier];
    }
    return cell;
}
#pragma mark -- UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    LHLookNoteViewController *lookNoteVC = [[LHLookNoteViewController alloc]init];
    lookNoteVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:lookNoteVC animated:NO];
}
#pragma mark -- 系统方法
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.title = @"我的日记";
    self.navigationController.navigationBar.hidden = NO;
    [self setLeftNaviItemWithTitle:@"" imageName:@"nav_return"];
    [self setRightNaviItemWithTitle:@"" imageName:@"nav_add"];
    self.navigationController.navigationBar.barTintColor =[UIColor whiteColor];
}
- (void)rightItemTapped {
    makeNoteViewController *makeNoteVC = [[makeNoteViewController alloc]init];
    makeNoteVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:makeNoteVC animated:NO];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
