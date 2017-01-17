//
//  ServiceOrderManagerViewController.m
//  装修人
//
//  Created by 熊维东 on 2016/12/15.
//  Copyright © 2016年 熊维东. All rights reserved.
//  服务商订单管理

#import "ServiceOrderManagerViewController.h"
#import "Config.h"
#import "OrderNavView.h"
#import "myOrderCell.h"
#import "OrderManagerCell.h"

static NSString * cellidentitifir =@"OrderManagerCell";
@interface ServiceOrderManagerViewController ()
<UITableViewDelegate,UITableViewDataSource>
{
    UIButton *btn_underWay;// tag 1301 +
    UIButton *btn_done;
    UIButton *btn_closed;
    
    UILabel * lb_underWay;
    UILabel * lb_done;
    UILabel * lb_closed;
}

@end

@implementation ServiceOrderManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initInterfaceView];
}


-(void)initInterfaceView
{
    self.aMytableView= [[UITableView alloc]initWithFrame:CGRectMake(0, 44, KScreenWidth, KScreenHeight) style:UITableViewStyleGrouped];
    self.aMytableView.delegate = self;
    self.aMytableView.dataSource = self;
//    self.aMytableView.separatorStyle =UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.aMytableView];
    
    [self.aMytableView registerNib:[UINib nibWithNibName:@"OrderManagerCell" bundle:nil] forCellReuseIdentifier:cellidentitifir];
    
    UIView * navView = [[NSBundle mainBundle]loadNibNamed:@"OrderNavView" owner:self options:nil].lastObject;
    navView.frame = CGRectMake(0, 64, KScreenWidth, 44);
    [self.view addSubview:navView];
    
    
    
    btn_underWay =(UIButton*)[self.view viewWithTag:1301];
    [btn_underWay setTitleColor:RGBA(22, 73, 145, 1)forState:UIControlStateNormal];
    [btn_underWay addTarget:self action:@selector(btn_underWay:) forControlEvents:UIControlEventTouchUpInside];
    
    btn_done =(UIButton*)[self.view viewWithTag:1302];
    [btn_done setTitleColor:RGBA(22, 73, 145, 1)forState:UIControlStateNormal];
    [btn_done addTarget:self action:@selector(btn_done:) forControlEvents:UIControlEventTouchUpInside];
    
    btn_closed =(UIButton*)[self.view viewWithTag:1303];
    [btn_closed setTitleColor:RGBA(22, 73, 145, 1)forState:UIControlStateNormal];
    [btn_closed addTarget:self action:@selector(btn_closed:) forControlEvents:UIControlEventTouchUpInside];
    
    lb_underWay = (UILabel*) [self.view viewWithTag:1304];
    lb_underWay.backgroundColor = RGBA(22, 73, 145, 1);
    
}
/**
 *  进行中
 *
 *  @param sender btn_underWay
 */
-(void)btn_underWay:(UIButton*)sender
{
    [sender setTitleColor:RGBA(22, 73, 145, 1)forState:UIControlStateNormal];
    lb_underWay = (UILabel*) [self.view viewWithTag:1304];
    lb_underWay.backgroundColor = RGBA(22, 73, 145, 1);
    
    [btn_done setTitleColor:[UIColor darkGrayColor]forState:UIControlStateNormal];
    [btn_closed setTitleColor:[UIColor darkGrayColor]forState:UIControlStateNormal];
    
    lb_done.backgroundColor =[UIColor whiteColor];
    lb_closed.backgroundColor =[UIColor whiteColor];
    
}
/**
 *  已完成
 *
 *  @param sender btn_done
 */
-(void)btn_done:(UIButton*)sender
{
    [sender setTitleColor:RGBA(22, 73, 145, 1)forState:UIControlStateNormal];
    lb_done = (UILabel*) [self.view viewWithTag:1305];
    lb_done.backgroundColor = RGBA(22, 73, 145, 1);
    
    [btn_underWay setTitleColor:[UIColor darkGrayColor]forState:UIControlStateNormal];
    [btn_closed setTitleColor:[UIColor darkGrayColor]forState:UIControlStateNormal];
    
    lb_underWay.backgroundColor =[UIColor whiteColor];
    lb_closed.backgroundColor =[UIColor whiteColor];
}
/**
 * 已关闭
 *
 *  @param sender btn_closed
 */
-(void)btn_closed:(UIButton*)sender
{
    [sender setTitleColor:RGBA(22, 73, 145, 1)forState:UIControlStateNormal];
    lb_closed = (UILabel*) [self.view viewWithTag:1306];
    lb_closed.backgroundColor = RGBA(22, 73, 145, 1);
    
    [btn_done setTitleColor:[UIColor darkGrayColor]forState:UIControlStateNormal];
    [btn_underWay setTitleColor:[UIColor darkGrayColor]forState:UIControlStateNormal];
    
    lb_done.backgroundColor =[UIColor whiteColor];
    lb_underWay.backgroundColor =[UIColor whiteColor];
    
}
#pragma  mark  - datasource delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return  3;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 9;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OrderManagerCell * orderCell =[ self.aMytableView dequeueReusableCellWithIdentifier:cellidentitifir];
    if (!orderCell) {
        orderCell = [[OrderManagerCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellidentitifir];
        
    }
    orderCell.selectionStyle =UITableViewCellSelectionStyleNone;
//    orderCell.backgroundColor = [UIColor clearColor];
    return orderCell;
}

-(void)viewWillAppear:(BOOL)animated
{
    self.title = @"订单管理";
    [self setLeftNaviItemWithTitle:@"" imageName:@"nav_return"];
    self.navigationController.navigationBar.barTintColor= [UIColor whiteColor];
    self.navigationController.navigationBar.hidden = NO;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
