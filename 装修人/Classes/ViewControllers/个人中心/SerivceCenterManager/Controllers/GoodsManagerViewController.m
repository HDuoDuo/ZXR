//
//  GoodsManagerViewController.m
//  装修人
//
//  Created by 熊维东 on 2016/12/15.
//  Copyright © 2016年 熊维东. All rights reserved.
//  商品管理

#import "GoodsManagerViewController.h"
#import "InbatchGoodsViewController.h"
#import "AddgoodsViewController.h"
#import "Config.h"
#import "OrderManagerCell.h"
#import "LHNetworking.h"
#import "NSDate+LHDate.h"
#import "NSString+MD5.h"
#import "changeGoodsViewController.h"
#import "goodsModel.h"
#define allGoods_url @"http://192.168.1.31:8080/zxrweb/appGoods/list"

static NSString * cellidentitifir =@"OrderManagerCell";
@interface GoodsManagerViewController () <UITableViewDelegate,UITableViewDataSource>
{
    UIButton *btn_Addtime;//添加时间 tag==603 以下依次+1
    UIButton *btn_Sales;//销量
    UIButton *btn_Price;//价格
    UIButton *btn_Inventory;//库存
    
    UIImageView *img_Addtime;//添加时间 tag==301 以下依次+1
    UIImageView *img_Sales;//销量
    UIImageView *img_Price;//价格
    UIImageView *img_Inventory;//库存
    
    UIButton * add_Btn;//添加商品 tag = 601
    UIButton * inbatch_Btn;//批量管理 602
    
    //排序方式,用yes 或者 no 判断升或降序
    NSString *_sortStyle;
    //是否时间升序
    BOOL timeIsAsc;
    //是否销量升序
    BOOL salesvolumeIsAsc;
    //    库存升序 goodscountasc
    //    库存降序 goodscountdesc
    BOOL goodscountIsAsc;
    //记录当前页
    NSString *_currentPage;
}
//数据源数组
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation GoodsManagerViewController
//延迟加载
- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc]init];
        //创建数据模型
        for (NSInteger i = 0; i < 20; i++) {
            goodsModel *model = [[goodsModel alloc]init];
            model.title = @"深睡智慧8H经典款";
            model.desc  = @"公司的股份的三个身份的感受对方公司大股东是干啥";
            model.price = @"¥ 2980";
            model.truePrice = @"200";
            model.number = @"633";
            model.addTime = @"552455255";
            [_dataArray addObject:model];
        }
    }
    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //UI
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
 
    UIView * navView = [[NSBundle mainBundle]loadNibNamed:@"GoodsNavView" owner:self options:nil].lastObject;
    UIView * footView = [[NSBundle mainBundle]loadNibNamed:@"GoodsFooterView" owner:self options:nil].lastObject;
    navView.frame = CGRectMake(0, 64, KScreenWidth, 44);
    footView.frame = CGRectMake(0, KScreenHeight-49, KScreenWidth, 49);
    
    [self.view addSubview:footView];
    [self.view addSubview:navView];
    
    add_Btn= (UIButton*)[self.view viewWithTag:601];
    [add_Btn addTarget:self action:@selector(add_Btn:) forControlEvents:UIControlEventTouchUpInside];
    
    inbatch_Btn = (UIButton *)[self.view viewWithTag:602];
    [inbatch_Btn addTarget:self action:@selector(inbatch_Btn:) forControlEvents:UIControlEventTouchUpInside];
    
    btn_Addtime = (UIButton*)[self.view viewWithTag:603];
    [btn_Addtime addTarget:self action:@selector(btn_Addtime:) forControlEvents:UIControlEventTouchUpInside];

    btn_Sales = (UIButton*)[self.view viewWithTag:604];
    [btn_Sales addTarget:self action:@selector(btn_Sales:) forControlEvents:UIControlEventTouchUpInside];
    
    btn_Price = (UIButton*)[self.view viewWithTag:605];
    [btn_Price addTarget:self action:@selector(btn_Price:) forControlEvents:UIControlEventTouchUpInside];
    
    btn_Inventory = (UIButton*)[self.view viewWithTag:606];
    [btn_Inventory addTarget:self action:@selector(btn_Inventory:) forControlEvents:UIControlEventTouchUpInside];
    
    img_Addtime = [self.view viewWithTag:301];
    img_Sales = [self.view viewWithTag:302];
    img_Price = [self.view viewWithTag:303];
    img_Inventory = [self.view viewWithTag:304];
    
    //设置下拉刷新、上拉加载
    __weak typeof(self) weakSelf = self;
    self.aMytableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf loadData];
    }];
    self.aMytableView.mj_footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
        
    }];
    //第一次刷新
    [self.aMytableView.mj_footer endRefreshing];
}
- (void)loadData {
    //排序默认风格
    _sortStyle = @"salesvolumedesc";
    //默认页
    _currentPage = @"1";
    //请求
    [self requestData];
}
- (void)loadMoreData {
    //转换
    NSInteger page = [_currentPage integerValue];
    NSString *str = [NSString stringWithFormat:@"%ld",++page];
    _currentPage = str;
    [self requestData];
}
#pragma mark -- 数据请求
- (void)requestData {
    __weak typeof(self) weakSekf = self;
    //时间戳
    NSString *timestampStr = [NSDate timestampFromCurrentDate];
    //需加密字符串
    NSString *signStr = [NSString stringWithFormat:@"cqkrszxrappkeyorderby%@pageNo%@pageSize%@shopid%@timestamp%@userId%@",_sortStyle,_currentPage,@"10",@"46161",timestampStr,@"56565"];
    //MD5
    NSString *sign = [NSString MDStringFromString:signStr];
    NSDictionary *parameter =
               @{@"shopid":@"46161",
                 @"userId":@"470bee8b93554fac9f3f4b158e75280c",
                 @"timestamp":timestampStr,
                 @"sign":sign,
                 @"orderby":_sortStyle,
                 @"pageSize":@"10",
                 @"pageNo":_currentPage};
    [[LHNetworking shareInstance] requestWith:Post URL:allGoods_url parameters:parameter progress:nil success:^(id responseObject) {
        //解析
        id jsonObject=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSDictionary *dictOfVlue=(NSDictionary *)jsonObject;
        NSLog(@"%@",dictOfVlue);
        [weakSekf.aMytableView.mj_header endRefreshing];
        [weakSekf.aMytableView.mj_footer endRefreshing];
    } failure:^(NSError *error) {
        NSLog(@"请求失败---%@",error);
    }];
}
/**
 *  添加商品
 *
 *  @param sender add_Btn
 */
-(void)add_Btn:(UIButton*)sender
{
    NSLog(@"添加商品");
    AddgoodsViewController * addVC =[[ AddgoodsViewController alloc]init];
    [self.navigationController pushViewController:addVC animated:NO];
    
}
/**
 *  批量管理
 *
 *  @param sender action
 */
-(void)inbatch_Btn:(UIButton*)sender
{
       NSLog(@"批量管理");
    InbatchGoodsViewController * invatchVC = [[InbatchGoodsViewController alloc]init];
    
    [self.navigationController pushViewController:invatchVC animated:NO];
}
/**
 *  添加时间
 *
 *  @param sender btn_Addtime
 */
-(void)btn_Addtime:(UIButton*)sender
{
    NSLog(@"添加时间");
    if (timeIsAsc) {
        _sortStyle = @"timedesc";
    }else {
        _sortStyle = @"timeasc";
    }
    //旋转
    [self rotation:img_Addtime];
}
/**
 *  销量
 *  @param sender btn_Sales
 */
-(void)btn_Sales:(UIButton*)sender
{
    NSLog(@"销量");
    //销量排序方式
    if (timeIsAsc) {
        _sortStyle = @"salesvolumedesc";
    }else {
        _sortStyle = @"salesvolumeasc";
    }
}
/**
 *  价格
 *
 *  @param sender btn_Price
 */
-(void)btn_Price:(UIButton*)sender
{
    NSLog(@"价格");
    _sortStyle = @"salesvolumeasc";
}
/**
 *  库存
 *
 *  @param sender btn_Inventory
 */

-(void)btn_Inventory:(UIButton*)sender
{
    NSLog(@"库存");
}
/**
*  旋转
*/
- (void)rotation:(UIView *)sender {
    
    if (sender.userInteractionEnabled == NO) {
        [UIView animateWithDuration:0.2f animations:^{
            sender.transform = CGAffineTransformMakeRotation(M_PI);
            //旋转180度
        }];
        sender.userInteractionEnabled = YES;
    }else {
        [UIView animateWithDuration:0.2f animations:^{
            sender.transform = CGAffineTransformMakeRotation(-2 * M_PI);//旋转360度
        }];
        sender.userInteractionEnabled = NO;
    }
}
#pragma  mark  - datasource delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
    
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
    orderCell.model = self.dataArray[indexPath.section];
    return orderCell;
}
#pragma mark -- UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    changeGoodsViewController *changeVC = [[changeGoodsViewController alloc]init];
    changeVC.model = self.dataArray[indexPath.section];
    [self.navigationController pushViewController:changeVC animated:YES];
}
-(void)viewWillAppear:(BOOL)animated
{
    self.title = @"商品管理";
    [self setLeftNaviItemWithTitle:@"" imageName:@"nav_return"];
    self.navigationController.navigationBar.barTintColor= [UIColor whiteColor];
    self.navigationController.navigationBar.hidden = NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
