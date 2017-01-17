//
//  companyAndPersonViewController.m
//  装修人
//
//  Created by liuhang on 17/1/16.
//  Copyright © 2017年 熊维东. All rights reserved.
//

#import "companyAndPersonViewController.h"
#import "personTableViewCell.h"
#import "companyTableViewCell.h"
static NSString *personCellIdentifier = @"personTableViewCell";
static NSString *companyCellIdentifier = @"companyTableViewCell";
@interface companyAndPersonViewController ()<UITableViewDelegate,UITableViewDataSource>
//tableView
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
//当前页面是否个人界面
@property (nonatomic, assign) BOOL isPerson;
@end

@implementation companyAndPersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
}
- (void)createUI {
    //首先加载个人界面
    self.isPerson = YES;
    //设置tableView
    //cellHeight
    self.mainTableView.rowHeight = 250.0f;
    //去除指示器,分割线
    self.mainTableView.showsVerticalScrollIndicator = NO;
    self.mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //注册
    [self.mainTableView registerNib:[UINib nibWithNibName:@"personTableViewCell" bundle:nil] forCellReuseIdentifier:personCellIdentifier];
    [self.mainTableView registerNib:[UINib nibWithNibName:@"companyTableViewCell" bundle:nil] forCellReuseIdentifier:companyCellIdentifier];
    //设置导航标题视图
    UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 120, 30)];
    titleView.backgroundColor = [UIColor redColor];
    
    UIButton *personBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 30)];
    [personBtn setTitle:@"个人" forState:UIControlStateNormal];
    [personBtn addTarget:self action:@selector(personOnclicked:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *companyBtn = [[UIButton alloc]initWithFrame:CGRectMake(60, 0, 60, 30)];
    [companyBtn setTitle:@"公司" forState:UIControlStateNormal];
    [companyBtn addTarget:self action:@selector(companyOnclicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [titleView addSubview:personBtn];
    [titleView addSubview:companyBtn];
    
    self.navigationItem.titleView = titleView;
}
- (void)personOnclicked:(UIButton *)sender {
    NSLog(@"个人");
    self.isPerson = YES;
    [self.mainTableView reloadData];
}
- (void)companyOnclicked:(UIButton *)sender{
    NSLog(@"公司");
    self.isPerson = NO;
    [self.mainTableView reloadData];
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (!self.isPerson) {
        companyTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:companyCellIdentifier];
        if(cell==nil){
            cell=[[companyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:companyCellIdentifier];
        }
        return cell;
    }else {
        personTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:personCellIdentifier];
        if(cell==nil){
            cell=[[personTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:personCellIdentifier];
        }
        return cell;
        }
    return nil;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setLeftNaviItemWithTitle:@"" imageName:@"nav_return"];
    self.navigationController.navigationBar.barTintColor= [UIColor whiteColor];
    self.navigationController.navigationBar.hidden = NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
