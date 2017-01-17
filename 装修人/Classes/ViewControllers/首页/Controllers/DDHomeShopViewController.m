//
//  DDSHOPViewController.m
//  装修人
//
//  Created by 熊维东 on 2017/1/10.
//  Copyright © 2017年 熊维东. All rights reserved.
//  商城店铺

#import "DDHomeShopViewController.h"
#import "Config.h"
#import "ShopListCell.h"
#import "DDCollectionContextCell.h"

#import "DDShopListViewController.h"

static NSString * shoplistCellIdentifir = @"ShopListCell";
static NSString * collectionContextCellIdentifir = @"DDCollectionContextCell";
static NSString * headViewID = @"CollectionHeadView";

@class HeaderCRView;

@interface DDHomeShopViewController ()

<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITableViewDelegate,UITableViewDataSource
>
{
    ShopListCell * shopListCell;
    DDCollectionContextCell * collectCell;
    //按键是否高亮
    BOOL ishightlighted ;
    CGFloat kwidth;
    
}

@property(nonatomic,strong)UICollectionView * aCollectionView;
@property(nonatomic,strong)NSMutableArray * ListArray;//列表数据源

@end

@implementation DDHomeShopViewController
-(NSMutableArray *)ListArray
{
    if (!_ListArray) {
        _ListArray = [NSMutableArray array];
    }
    return _ListArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self InterfaceOfShopViewInit];
}
-(void)InterfaceOfShopViewInit
{
    

    
    self.aMytableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 75, KScreenHeight) style:UITableViewStylePlain];
    [self.aMytableView registerNib:[UINib nibWithNibName:@"ShopListCell" bundle:nil] forCellReuseIdentifier:shoplistCellIdentifir];
    self.aMytableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.aMytableView.showsVerticalScrollIndicator = NO;
    self.aMytableView.delegate = self;
    self.aMytableView.dataSource = self;
    [self.view addSubview:self.aMytableView];
    
    
    
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    layout.collectionView.backgroundColor = [UIColor clearColor];
    self.aCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(75, 64, KScreenWidth-75, KScreenHeight-64) collectionViewLayout:layout];
    [self.aCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([DDCollectionContextCell class]) bundle:nil] forCellWithReuseIdentifier:collectionContextCellIdentifir];
    
    [self.aCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headViewID];
    
    
    self.aCollectionView.backgroundColor = kColorWithHex(0xEFEFEF);
    
    
    self.aCollectionView.delegate = self;
    self.aCollectionView.dataSource = self;
    [self.view addSubview:self.aCollectionView];
    
}

#pragma  mark  ----------------  tableView Delegate ---------------
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54.0;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 16;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    shopListCell = [self.aMytableView dequeueReusableCellWithIdentifier:shoplistCellIdentifir];
    
    UIColor  *color = kColorWithHex(0xEFEFEF);
    shopListCell.selectedBackgroundView = [[UIView alloc]initWithFrame:shopListCell.frame];
    shopListCell.selectedBackgroundView.backgroundColor =color;
    
    if (!shopListCell) {
        shopListCell = [[ShopListCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:shoplistCellIdentifir];
    }
    if (indexPath.section ==0 &&indexPath.row == 0) {
        
        [tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:(UITableViewScrollPositionNone)];
    }
    

     return shopListCell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
//    ShopListCell * cell = (ShopListCell*)[tableView cellForRowAtIndexPath:indexPath];
   
 
    
    NSLog(@"%ld,%ld",indexPath.section,indexPath.row);
    
}

#pragma  mark  ----------------- collectionView  Delegate ---------------
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 19;
}
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake( (KScreenWidth -75)/3-15, 115);
}

-(CGSize)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    CGSize size = {320, 40};
    
    return size;
    
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{

    
    UICollectionReusableView *reusableView = nil;
   
    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headViewID forIndexPath:indexPath];
        
        UILabel  * lb_text = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, KScreenWidth, 30)];
        lb_text.backgroundColor = [UIColor redColor];
        lb_text.text = @"你是个傻逼吗";
        [header addSubview:lb_text];
        reusableView = header;
        reusableView.backgroundColor = [UIColor greenColor];
    
        
    }
    
    return reusableView;
    
}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}




#pragma mark --UICollectionViewDelegate
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
 
    
    collectCell = [self.aCollectionView dequeueReusableCellWithReuseIdentifier:collectionContextCellIdentifir forIndexPath:indexPath];
    
    return collectCell;
    
    
}

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    DDCollectionContextCell * cell = (DDCollectionContextCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    NSLog(@" secttion = %ld,  row= %ld   item = %ld" , indexPath.section,indexPath.row,indexPath.item);
    
    //更新操作
    [self.aCollectionView reloadData];
    [self.aCollectionView performBatchUpdates:^{
        [self.aCollectionView reloadItemsAtIndexPaths:@[indexPath]];
        
    } completion:^(BOOL finished) {
        
    }];
    
    //DDShopListViewController入口
    DDShopListViewController * shopListVC = [[DDShopListViewController alloc]init];
    shopListVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:shopListVC animated:NO];
    shopListVC.hidesBottomBarWhenPushed = NO;
    
}

///更新操作
-(void)reloadDataDDCollectionView
{

}


// 和UITableView类似，UICollectionView也可设置段头段尾
//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
//{
//    if([kind isEqualToString:UICollectionElementKindSectionHeader])
//    {
//        UICollectionReusableView *headerView = [_aCollectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"" forIndexPath:indexPath];
//        if(headerView == nil)
//        {
//            headerView = [[UICollectionReusableView alloc] init];
//        }
//        headerView.backgroundColor = [UIColor grayColor];
//        
//        return headerView;
//    }else{
//        
//    }
//    
//    return nil;
//    
//}




-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setLeftNaviItemWithTitle:@"" imageName:@"nav_return"];
    self.navigationController.navigationBar.barTintColor= [UIColor whiteColor];
    self.navigationController.navigationBar.hidden = NO;
 
    ishightlighted = YES;

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
