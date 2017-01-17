//
//  DDShopListViewController.m
//  装修人
//
//  Created by 熊维东 on 2017/1/11.
//  Copyright © 2017年 熊维东. All rights reserved.
//

#import "DDShopListViewController.h"
#import "GoodListCellW.h"
#import "GoodListCellH.h"
#import "Config.h"
#import "detailsViewController.h"//详情页

static NSString * const identifirCellH = @"GoodListCellH";
static NSString * const identifirCellW = @"GoodListCellW";

@interface DDShopListViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    GoodListCellH * cellH;
    GoodListCellW * cellW;
    BOOL  isChagelayout;
    
    
}

@property(copy,nonatomic)void(^reloadDataFinish)(NSInteger number);

@property (weak, nonatomic) IBOutlet UICollectionView *aShopCollectionView;

//切换布局
@property (weak, nonatomic) IBOutlet UIButton *btn_Check;

@end

@implementation DDShopListViewController

//切换布局
- (IBAction)btn_ChangeCheck:(id)sender {
    
    _btn_Check.selected = !_btn_Check.selected;
   
    if (_btn_Check.selected) {
      
        isChagelayout = YES;
        
        [self.aShopCollectionView reloadData];
        
    
    }else{
        isChagelayout = NO;
        
        [self.aShopCollectionView reloadData];
        
    }
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   
    
    self.aShopCollectionView.delegate =self;
    self.aShopCollectionView.dataSource = self;
    
    [_btn_Check addTarget:self action:@selector(btn_ChangeCheck:) forControlEvents:UIControlEventTouchUpInside];
    
 
    [self.aShopCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([GoodListCellW class]) bundle:nil] forCellWithReuseIdentifier:@"GoodListCellW"];
   
    [self.aShopCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([GoodListCellH class]) bundle:nil] forCellWithReuseIdentifier:@"GoodListCellH"];
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (isChagelayout == NO) {
 
        return CGSizeMake( KScreenWidth/2-10 , 220);
        
    }
    else{
 
        return CGSizeMake( KScreenWidth , 100);
    }
    
}
//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (isChagelayout == NO) {

        return UIEdgeInsetsMake(5, 5, 5, 5);

    }
    return UIEdgeInsetsMake(0, 0, 0, 0);
   
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
 
    DDWeakSelf;

    [weakSelf.aShopCollectionView performBatchUpdates:^{
        
        [self.aShopCollectionView reloadItemsAtIndexPaths:@[indexPath]];
        
    } completion:^(BOOL finished) {
        
    }];
    
    if (isChagelayout == NO) {
        cellW = [self.aShopCollectionView dequeueReusableCellWithReuseIdentifier:identifirCellW forIndexPath:indexPath];
        
        return cellW;
    }
    else{
        cellH = [self.aShopCollectionView dequeueReusableCellWithReuseIdentifier:identifirCellH forIndexPath:indexPath];
        
        return cellH;
    }
    
    


}
// allows multiple insert/delete/reload/move calls to be animated 这个方法会在第一个 block 中处理 insert/delete/reload/move 等操作
- (void)performBatchUpdates:(void (^)(void))updates completion:(void (^)(BOOL finished))completion
{
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath

{
    //这个方法会在第一个 block 中处理 insert/delete/reload/move 等操作，等操作完成之后会执行第二个block。更新代码
  
    detailsViewController * dVC = [[detailsViewController alloc]init];
    dVC.hidesBottomBarWhenPushed= YES;
    [self.navigationController pushViewController:dVC animated:NO];
    dVC.hidesBottomBarWhenPushed = NO;
    
    
    [self.aShopCollectionView performBatchUpdates:^{
        
        [self.aShopCollectionView reloadItemsAtIndexPaths:@[indexPath]];
        
    } completion:^(BOOL finished) {
        
    }];
    NSLog(@"%ld,%ld",indexPath.section,indexPath.row);
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setLeftNaviItemWithTitle:@"" imageName:@"nav_return"];
    self.navigationController.navigationBar.barTintColor= [UIColor whiteColor];
    self.navigationController.navigationBar.hidden = NO;
    isChagelayout = NO;
    
    
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
