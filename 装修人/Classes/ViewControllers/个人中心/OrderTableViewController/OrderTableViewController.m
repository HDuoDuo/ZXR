//
//  OrderTableViewController.m
//  装修人
//
//  Created by 熊维东 on 2016/12/7.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import "OrderTableViewController.h"
#import "myOrderCell.h"
#import "define.h"
#import "Config.h"

@interface OrderTableViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    BOOL isLighting;
    UIButton * btn_all;
    UIButton * btn_WaitPayfor;
    UIButton * btn_SendingGoods;
    UIButton * btn_receviedGoods;
    UIButton * btn_appraisGoods;
    
    UILabel * lb_all;
    UILabel * lb_WaitPayfor;
    UILabel * lb_SendingGoods;
    UILabel * lb_receviedGoods;
    UILabel * lb_appraisGoods;
    
}


@property(nonatomic,strong)UITableView * tableView;

@end

@implementation OrderTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self initInfoView];
    
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)initInfoView
{
    
    self.title =@"我的订单";
    [self setLeftNaviItemWithTitle:@"" imageName:@"nav_return"];
    
    UIView* bgview =  [[NSBundle mainBundle]loadNibNamed:@"NavOrderView" owner:self options:nil].lastObject;
    bgview.frame = CGRectMake(0, 64, KScreenWidth, 45);
    [self.view addSubview:bgview];
    self.tableView  =[[ UITableView alloc]initWithFrame:CGRectMake(0, 64+45, KScreenWidth, KScreenHeight -64-45) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource =self;
    [self.view addSubview:self.tableView];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"myOrderCell" bundle:nil] forCellReuseIdentifier:@"OrderCell"];
    
    btn_all =(UIButton*)[self.view viewWithTag:1001];
    [btn_all addTarget:self action:@selector(btn_all:) forControlEvents:UIControlEventTouchUpInside];
    [btn_all setTitleColor:UIColorRGBA(22, 73, 145, 1)forState:UIControlStateNormal];
    lb_all = (UILabel*) [self.view viewWithTag:1006];
    lb_all.backgroundColor = UIColorRGBA(22, 73, 145, 1);

    
    btn_WaitPayfor =(UIButton*)[self.view viewWithTag:1002];
    [btn_WaitPayfor addTarget:self action:@selector(btn_WaitPayfor:) forControlEvents:UIControlEventTouchUpInside];
    
    btn_SendingGoods =(UIButton*)[self.view viewWithTag:1003];
    [btn_SendingGoods addTarget:self action:@selector(btn_SendingGoods:) forControlEvents:UIControlEventTouchUpInside];
    
    btn_receviedGoods =(UIButton*)[self.view viewWithTag:1004];
    [btn_receviedGoods addTarget:self action:@selector(btn_receviedGoods:) forControlEvents:UIControlEventTouchUpInside];
    
    btn_appraisGoods =(UIButton*)[self.view viewWithTag:1005];
    [btn_appraisGoods addTarget:self action:@selector(btn_appraisGoods:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
}
#pragma mark - 全部
-(void)btn_all:(UIButton *)sender
{
    btn_all.selected = YES;
    NSLog(@"点了我全部");
    [sender setTitleColor:UIColorRGBA(22, 73, 145, 1)forState:UIControlStateNormal];
    lb_all = (UILabel*) [self.view viewWithTag:1006];
    lb_all.backgroundColor = UIColorRGBA(22, 73, 145, 1);
    
   
    
    [btn_WaitPayfor setTitleColor:[UIColor darkGrayColor]forState:UIControlStateNormal];
    [btn_receviedGoods setTitleColor:[UIColor darkGrayColor]forState:UIControlStateNormal];
    [btn_SendingGoods setTitleColor:[UIColor darkGrayColor]forState:UIControlStateNormal];
    [btn_appraisGoods setTitleColor:[UIColor darkGrayColor]forState:UIControlStateNormal];

    lb_WaitPayfor.backgroundColor =[UIColor whiteColor];
    lb_appraisGoods.backgroundColor =[UIColor whiteColor];
    lb_receviedGoods.backgroundColor =[UIColor whiteColor];
    lb_SendingGoods.backgroundColor =[UIColor whiteColor];
    
    
}
#pragma mark - 待付款
-(void)btn_WaitPayfor:(UIButton *)sender
{
    
    NSLog(@"点了btn_WaitPayfor");
    
    [sender setTitleColor:UIColorRGBA(22, 73, 145, 1)forState:UIControlStateNormal];
    lb_WaitPayfor = (UILabel*) [self.view viewWithTag:1007];
    lb_WaitPayfor.backgroundColor = UIColorRGBA(22, 73, 145, 1);
    
    [btn_all setTitleColor:[UIColor darkGrayColor]forState:UIControlStateNormal];
    [btn_receviedGoods setTitleColor:[UIColor darkGrayColor]forState:UIControlStateNormal];
    [btn_SendingGoods setTitleColor:[UIColor darkGrayColor]forState:UIControlStateNormal];
    [btn_appraisGoods setTitleColor:[UIColor darkGrayColor]forState:UIControlStateNormal];
    
    lb_all.backgroundColor =[UIColor whiteColor];
    lb_appraisGoods.backgroundColor =[UIColor whiteColor];
    lb_receviedGoods.backgroundColor =[UIColor whiteColor];
    lb_SendingGoods.backgroundColor =[UIColor whiteColor];
    
}
#pragma mark - 待发货
-(void)btn_SendingGoods:(UIButton *)sender
{
    
    NSLog(@"点了我btn_SendingGoods");
    
    [sender setTitleColor:UIColorRGBA(22, 73, 145, 1)forState:UIControlStateNormal];
    lb_SendingGoods= (UILabel*) [self.view viewWithTag:1008];
    lb_SendingGoods.backgroundColor =  UIColorRGBA(22, 73, 145, 1);
    
    [btn_all setTitleColor:[UIColor darkGrayColor]forState:UIControlStateNormal];
    [btn_receviedGoods setTitleColor:[UIColor darkGrayColor]forState:UIControlStateNormal];
    [btn_WaitPayfor setTitleColor:[UIColor darkGrayColor]forState:UIControlStateNormal];
    [btn_appraisGoods setTitleColor:[UIColor darkGrayColor]forState:UIControlStateNormal];
    lb_all.backgroundColor =[UIColor whiteColor];
    lb_appraisGoods.backgroundColor =[UIColor whiteColor];
    lb_receviedGoods.backgroundColor =[UIColor whiteColor];
    lb_WaitPayfor.backgroundColor =[UIColor whiteColor];
    
}
#pragma mark - 待收货
-(void)btn_receviedGoods:(UIButton *)sender
{
    NSLog(@"待收货");
    
    [sender setTitleColor:UIColorRGBA(22, 73, 145, 1)forState:UIControlStateNormal];
    lb_receviedGoods = (UILabel*) [self.view viewWithTag:1009];
    lb_receviedGoods.backgroundColor = UIColorRGBA(22, 73, 145, 1);
    
    [btn_all setTitleColor:[UIColor darkGrayColor]forState:UIControlStateNormal];
    [btn_SendingGoods setTitleColor:[UIColor darkGrayColor]forState:UIControlStateNormal];
    [btn_WaitPayfor setTitleColor:[UIColor darkGrayColor]forState:UIControlStateNormal];
    [btn_appraisGoods setTitleColor:[UIColor darkGrayColor]forState:UIControlStateNormal];
    lb_all.backgroundColor =[UIColor whiteColor];
    lb_appraisGoods.backgroundColor =[UIColor whiteColor];
    lb_SendingGoods.backgroundColor =[UIColor whiteColor];
    lb_WaitPayfor.backgroundColor =[UIColor whiteColor];
}



#pragma mark - 评价
-(void)btn_appraisGoods:(UIButton *)sender
{
    
    NSLog(@"我要评价");
    
    [sender setTitleColor:UIColorRGBA(22, 73, 145, 1)forState:UIControlStateNormal];
    lb_appraisGoods = (UILabel*) [self.view viewWithTag:1010];
    lb_appraisGoods.backgroundColor = UIColorRGBA(22, 73, 145, 1);
    
    [btn_all setTitleColor:[UIColor darkGrayColor]forState:UIControlStateNormal];
    [btn_SendingGoods setTitleColor:[UIColor darkGrayColor]forState:UIControlStateNormal];
    [btn_WaitPayfor setTitleColor:[UIColor darkGrayColor]forState:UIControlStateNormal];
    [btn_receviedGoods setTitleColor:[UIColor darkGrayColor]forState:UIControlStateNormal];
    
    lb_all.backgroundColor =[UIColor whiteColor];
    lb_SendingGoods.backgroundColor =[UIColor whiteColor];
    lb_receviedGoods.backgroundColor =[UIColor whiteColor];
    lb_WaitPayfor.backgroundColor =[UIColor whiteColor];
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 215;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellidentifier = @"OrderCell";
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellidentifier forIndexPath:indexPath];
    
    
    // Configure the cell...
    
    return cell;
}


-(void)viewWillAppear:(BOOL)animated{
    
    
    self.navigationController.navigationBar.hidden =NO;
    self.navigationController.navigationBar.barTintColor =[UIColor whiteColor];
    [self setLeftNaviItemWithTitle:@"" imageName:@"nav_return"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
