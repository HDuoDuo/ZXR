//
//  InbatchGoodsViewController.m
//  装修人
//
//  Created by 熊维东 on 2016/12/20.
//  Copyright © 2016年 熊维东. All rights reserved.
//  批量管理

#import "InbatchGoodsViewController.h"
#import "Config.h"
#import "LHInbatchGoodsViewCell.h"
#import "LHInbatchGoodsModel.h"
static NSString *cellIdentifier = @"LHInbatchGoodsViewCell";
static BOOL allSelected = NO;
@interface InbatchGoodsViewController ()<UITableViewDelegate,UITableViewDataSource>
//商品tableView
@property (weak, nonatomic) IBOutlet UITableView *goodsTableView;
//数据模型数组
@property (nonatomic, strong) NSMutableArray *dataArray;
@end
@implementation InbatchGoodsViewController
//懒加载
- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc]init];
        for (NSInteger i = 0; i < 20; i++) {
            LHInbatchGoodsModel *model = [[LHInbatchGoodsModel alloc]init];
            [_dataArray addObject:model];
        }
    }
    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //创建UI
    [self createUI];
}
- (void)createUI {
    //cell高度
    _goodsTableView.rowHeight = 102.0f;
    //去除指示器,分割线
    _goodsTableView.showsVerticalScrollIndicator = NO;
    _goodsTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //注册
    [_goodsTableView registerNib:[UINib nibWithNibName:@"LHInbatchGoodsViewCell" bundle:nil] forCellReuseIdentifier:cellIdentifier];    
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LHInbatchGoodsViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell==nil){
        cell=[[LHInbatchGoodsViewCell alloc] initWithStyle:UITableViewCellStyleDefault   reuseIdentifier:cellIdentifier];
    }
    cell.model = self.dataArray[indexPath.row];
    return cell;
}
//下架点击
- (IBAction)takeOffBtn {
    NSLog(@"点击了下架");
}
-(void)rightItemTapped
{
    NSLog(@"选择还是取消");
    allSelected = !allSelected;
    for (LHInbatchGoodsModel *model in self.dataArray) {
        model.selected = allSelected;
    }
    [self.goodsTableView reloadData];
}
-(void)viewWillAppear:(BOOL)animated
{
    self.title = @"批量管理";
    
    [self setLeftNaviItemWithTitle:@"" imageName:@"nav_return"];
    [self setRightNaviItemWithTitle:@"" imageName:@"nav_select"];
    
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
