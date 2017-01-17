//
//  detailsViewController.m
//  装修人
//
//  Created by liuhang on 17/1/11.
//  Copyright © 2017年 熊维东. All rights reserved.
//

#import "detailsViewController.h"
#import "detailTableViewCell.h"
#import "commentCell.h"
#import "Config.h"
#import "detailsHeaderView.h"
#import "commentSectionFooter.h"
#import "commentViewController.h"
#import "ItemCell.h"
#import "AcheckOrderViewController.h"//订单页面
static NSString *cellDtailsIdentifier = @"detailTableViewCell";
static NSString *cellCommentIdentifier = @"commentCell";
static NSString * itemCellidentifir =@"ItemCell";

@interface detailsViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    ItemCell * itemCell ;
    
}
//tableView
@property (weak, nonatomic) IBOutlet UITableView *detailsTableView;
@property(nonatomic,strong)    UITableView * tagTableView ;

@property (strong,nonatomic)UIView * bgView;

//当前cell是否是评价cell
@property (nonatomic, assign) BOOL isComment;
@end

@implementation detailsViewController
@synthesize bgView;
- (void)viewDidLoad {
    [super viewDidLoad];
    //创建UI
    [self createUI];
}
- (void)createUI {
    self.automaticallyAdjustsScrollViewInsets = NO;
    //头视图
    detailsHeaderView *headerView = [[NSBundle mainBundle]loadNibNamed:@"detailsHeaderView" owner:self options:nil].firstObject;
    self.detailsTableView.tableHeaderView = headerView;
    self.detailsTableView.tableHeaderView.height = 642.0f;
    __weak typeof(self) weakSelf = self;
    //点击回调(详情、评价)
    headerView.tappedBlock = ^ {
        weakSelf.isComment = !weakSelf.isComment;
        [weakSelf.detailsTableView reloadData];
    };
    //去除指示器,分割线
    self.detailsTableView.showsVerticalScrollIndicator = NO;
    self.detailsTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //注册
    [self.detailsTableView registerNib:[UINib nibWithNibName:@"detailTableViewCell" bundle:nil] forCellReuseIdentifier:cellDtailsIdentifier];
    [self.detailsTableView registerNib:[UINib nibWithNibName:@"commentCell" bundle:nil] forCellReuseIdentifier:cellCommentIdentifier];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (tableView == _tagTableView) {
        
        return 3;
    }
    else{
        if (self.isComment) {
            
            return 2;
        }
        return 10;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DDWeakSelf;
   
    if (tableView == weakSelf.tagTableView) {
 
        itemCell  = [self.tagTableView dequeueReusableCellWithIdentifier:itemCellidentifir];
        
        if (!itemCell) {
            itemCell = [[ItemCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:itemCellidentifir];
            
        }
        if ( indexPath.section == 0&& indexPath.row ==2) {
            
            [itemCell.lb_buyQulity setHidden:NO];
            [itemCell.btn_add setHidden:NO];
            [itemCell.btn_decrease setHidden:NO];
            [itemCell.lb_countNumber setHidden:NO];
            [itemCell.lb_colorValue setHidden:YES];
            [itemCell.lb_colortitle setHidden:YES];
            
        }
        return itemCell;
        
    }

    if ( tableView == weakSelf.detailsTableView ) {
        
        
         if (self.isComment) {
            commentCell *cell=[tableView dequeueReusableCellWithIdentifier:cellCommentIdentifier];
            if(cell==nil){
                cell=[[commentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellCommentIdentifier];
            }
            return cell;
            //商品展示cell
        }else {
            detailTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellDtailsIdentifier];
            if(cell==nil){
                cell=[[detailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellDtailsIdentifier];
            }
            return cell;
        }
        
        return nil;
        
    }
  
    return nil;

}


#pragma mark -- UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == _tagTableView) {
        
        return 68.0f;
    }else{
        
        if (self.isComment) {
            return 300.0f;
        }
        return 200.0f;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (tableView == _tagTableView) {
        
        return 0;
    }
    else{
        if (!self.isComment) {
            return 287.0f;
        }
        return 0;
        
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    
    if (tableView == _tagTableView) {
        
        return nil;
    }
    else{
        if (!self.isComment) {
            UIView *sectionHeaderView = [[NSBundle mainBundle]loadNibNamed:@"sectionTableViewHeader" owner:self options:nil].firstObject;
            return sectionHeaderView;
        }
        return nil;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    if (tableView == _tagTableView) {
        
        return 0;
    }
    else{
        if (self.isComment) {
            return 45.0f;
        }
        return 0;
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (tableView == _tagTableView) {
        
        return nil;
    }
    else{
        if (self.isComment) {
            commentSectionFooter *sectionFooterView = [[NSBundle mainBundle]loadNibNamed:@"commentSectionFooter" owner:self options:nil].firstObject;
            sectionFooterView.moreCommentBlock = ^ {
                commentViewController *commentVC = [[commentViewController alloc]init];
                UINavigationController *navComment = [[UINavigationController alloc]initWithRootViewController:commentVC];
                [self presentViewController:navComment animated:YES completion:nil];
            };
            return sectionFooterView;
        }
        return nil;
    }
}
- (IBAction)backBtn {
    
    [self leftItemTapped];
}
- (IBAction)shopBtn {
    NSLog(@"购物按钮点击");
}


#pragma  mark ----加入购物车 ------
- (IBAction)btn_addShopCar:(id)sender {
    
    NSLog(@"xxxxxxxxx");
    self.tabBarController.tabBar.hidden = YES;
    
    bgView  =  [[NSBundle mainBundle]loadNibNamed:@"AddShopCarView" owner:self options:nil].lastObject;
    
    
    UIButton* btn_ComeTureOK = (UIButton*)[bgView viewWithTag:997];
    [btn_ComeTureOK addTarget:self action:@selector(addShopCarOrder:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * btn_delete = (UIButton*)[bgView viewWithTag:998];
    [btn_delete addTarget:self action:@selector(deleteDismissViewsss:) forControlEvents:UIControlEventTouchUpInside];
    
    self.tagTableView =(UITableView*)[bgView viewWithTag:999];
    self.tagTableView.delegate = self;
    self.tagTableView.dataSource = self;
    [self.tagTableView registerNib:[UINib nibWithNibName:@"ItemCell" bundle:nil] forCellReuseIdentifier:@"ItemCell"];
    
    
    bgView.frame = CGRectMake(0, KScreenHeight/2, KScreenWidth, KScreenHeight);
    
    [UIView animateWithDuration: 0.35 animations:^{
        
        bgView.frame = CGRectMake(0,0, KScreenWidth, KScreenHeight);
        
    } completion:^(BOOL finished) {
        
    }];
    
    [self.view addSubview:bgView];
    
}

#pragma mark - 加入购物车 订单页面 ---- 
-(void)addShopCarOrder:(UIButton*)sender
{
    //进入订单
    AcheckOrderViewController * cv = [[AcheckOrderViewController alloc]init];
    cv.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController: cv  animated:NO];
    cv.hidesBottomBarWhenPushed = NO;
}
#pragma mark  -  bgview消失动画
-(void)deleteDismissViewsss:(UIButton * )sender
{
    NSLog(@"消失");
    
    [bgView removeFromSuperview];

    [UIView animateWithDuration: 0.35 animations:^{
        
        bgView.frame = CGRectMake(0, KScreenHeight, KScreenWidth, KScreenHeight);
        
    } completion:^(BOOL finished) {
        
        bgView.hidden = YES;
        
        self.tabBarController.tabBar.hidden = YES;
        
    }];
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title = @"商品详情";
    [self setLeftNaviItemWithTitle:@"" imageName:@"detail_nav_return"];
    [self setRightNaviItemWithTitle:@"" imageName:@"detail_nav_shop_cart"];
    self.navigationController.navigationBar.hidden = YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
