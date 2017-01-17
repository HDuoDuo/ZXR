//
//  HomeViewController.m
//  装修人
//
//  Created by 熊维东 on 2016/12/1.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import "HomeViewController.h"
#import "LHNavView.h"
#import "SDCycleScrollView.h"
#import "LHMainView.h"
#import "LHTodayActivity.h"
#import "LHRecommandCompanyView.h"
#import "LHRecommandDesignerView.h"
#import "LHForChoiceView.h"
#import "LHNetworking.h"
#import "LHHomePageModel.h"
#import "RenovateCaseViewController.h"
#import "goodShopViewController.h"
#import "DDHomeShopViewController.h"//商城
#import "companyAndPersonViewController.h"
#import "lookRonovateViewController.h"
#import "lookDesignerViewController.h"
#import "installServiceViewController.h"
#import "PublishViewController.h"
@interface HomeViewController ()<SDCycleScrollViewDelegate,UIScrollViewDelegate,UITextFieldDelegate>
//导航View
@property (nonatomic, strong) LHNavView *navView;
// 蒙版
@property (nonatomic, strong) UIView *grayView;
//scrollView
@property (nonatomic, strong) UIScrollView *scrollView;
//sycleView
@property (nonatomic, strong) SDCycleScrollView *cycleView;
//mainView
@property (nonatomic, strong) LHMainView *mainView;
//comanyView
@property (nonatomic, strong) LHRecommandCompanyView *companyView;
//designerView
@property (nonatomic, strong) LHRecommandDesignerView *designerView;
//choiceView
@property (nonatomic, strong) LHForChoiceView *choiceView;
//数据模型
@property (nonatomic, strong) LHHomePageModel *homeModel;
//轮播图片数组
@property (nonatomic, strong) NSMutableArray *scrollImageArray;
@end
@implementation HomeViewController
//懒加载
-(UIView *)grayView {
    if (_grayView == nil) {
        //创建蒙版
        _grayView = [[UIView alloc]initWithFrame:self.view.frame];
        _grayView.backgroundColor = [UIColor grayColor];
        _grayView.alpha = 0.3f;
        //添加手势
        //打开交互
        _grayView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(grayViewOnclicked)];
        [_grayView addGestureRecognizer:tap];
    }
    return _grayView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //设置提示时间
    [SVProgressHUD setMinimumDismissTimeInterval:2.0f];
   //设置页面背景色
    self.view.backgroundColor = COLOR(239, 239, 239, 1);
    //打开交互
    self.view.userInteractionEnabled = YES;
    //创建UI
    [self createUI];
    //数据请求
    [self requestData];
}
#pragma mark -- requestData
- (void)requestData {
    __weak typeof(self) weakSelf = self;
    //提示
//    [SVProgressHUD showWithStatus:@"刷新中"];
    //数据请求
    [[LHNetworking shareInstance]requestWith:Get URL:HomeImage_url parameters:nil progress:nil success:^(id response) {
        //移除提示
        [SVProgressHUD dismiss];
        //解析数据
        weakSelf.homeModel = [LHHomePageModel yy_modelWithJSON:response];
    } failure:^(NSError *error) {
        if ([error.userInfo[@"_kCFStreamErrorCodeKey"] floatValue] == 51) {
            [SVProgressHUD showErrorWithStatus:@"请求超时"];
        }else {
            [SVProgressHUD showErrorWithStatus:@"请求失败"];
        }
    }];
}
//请求成功后重写数据模型set方法从而给相关模型赋值刷新图片
- (void)setHomeModel:(LHHomePageModel *)homeModel {
    _homeModel = homeModel;
    //生成图片数组字符串
    self.scrollImageArray = [[NSMutableArray alloc]init];
    for (ListlunboModel *model in self.homeModel.data.listLunbo) {
        NSString *imgUrlStr = [NSString stringWithFormat:prefixImage_url,model.image];
        [self.scrollImageArray addObject:imgUrlStr];
    }
    //给相关View模块的模型赋值
    self.cycleView.imageURLStringsGroup = self.scrollImageArray;
//  self.companyView.companyModels = self.homeModel.data;
    self.designerView.designerModel = self.homeModel.data;
    self.choiceView.choiceModel = self.homeModel.data;
}
//创建界面
- (void)createUI {
    //scrollView
    [self createScrollView];
    //导航搜索
    [self createNavSearch];
    //轮播视图
    [self sycleScrollView];
    //mainView
    [self createMainView];
    //todayActivityView
    [self createTodayActivityView];
    //推荐公司
    [self createRecommandCompanyView];
    //推荐设计师
    [self createRecommandDesignerView];
    //为你甄选
    [self createForChoiceView];
}
//创建scrollView
- (void)createScrollView {
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
    //去除指示器
    self.scrollView.showsVerticalScrollIndicator = NO;
    //设置代理
    self.scrollView.delegate = self;
    //设置contentSize
    self.scrollView.contentSize = CGSizeMake(self.scrollView.width, 1696);
    [self.view addSubview:self.scrollView];
}
#pragma mark -- UIScrollViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.navView changeBoderColor];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self.navView resetBoderColor];
}
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    if (velocity.y == 0) {
        [self.navView resetBoderColor];
    }
}
#pragma mark - 导航搜索View
- (void)createNavSearch {
    self.navView = [[NSBundle mainBundle]loadNibNamed:@"LHNavView" owner:self options:nil].firstObject;
    //设施输入框代理在本控制器
    self.navView.searchTF.delegate = self;
    [self.view addSubview:self.navView];
    //设置位置大小
    self.navView.sd_layout.leftSpaceToView(self.view, 17).topSpaceToView(self.view,24).heightIs(36).rightSpaceToView(self.view,17);
}
#pragma mark -- UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
//    textField.text = @"搜索装修公司、设计师、商品";
    //移除蒙版
    [self.grayView removeFromSuperview];
    [textField resignFirstResponder];
    textField.text = @"搜索装修公司、设计师、商品";
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    //添加在蒙版
    [self.view addSubview:self.grayView];
    [self.view bringSubviewToFront:self.grayView];
    [self.view bringSubviewToFront:self.navView];
}
#pragma mark -- 蒙版点击
- (void)grayViewOnclicked {
    //移除蒙版
    [self.grayView removeFromSuperview];
    [self.navView.searchTF resignFirstResponder];
    self.navView.searchTF.text = @"搜索装修公司、设计师、商品";
}
#pragma mark - 创建轮播头视图
- (void)sycleScrollView {
    //静态方法创建对象
    self.cycleView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 46, self.scrollView.width, 200) delegate:self placeholderImage:[UIImage imageNamed:@"banner"]];
    //设置pageContro的位置
    self.cycleView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    //添加到View上
    [self.scrollView addSubview:self.cycleView];
}
#pragma mark -- SDCycleScrollViewDelegate
-(void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    //config
}
#pragma mark -- mainView
- (void)createMainView {

    DDWeakSelf;
    self.mainView = [[LHMainView alloc]initWithFrame:CGRectMake(0, 252, self.scrollView.width, 185)];
    //添加
    [self.scrollView addSubview:self.mainView];
    //点击
    self.mainView.tapBlock = ^(NSInteger index) {
        switch (index) {
            case 0:
            {
                //发布需求
                publishViewController *publishVC = [[publishViewController alloc]init];
                publishVC.hidesBottomBarWhenPushed = YES;
                [weakSelf.navigationController pushViewController:publishVC animated:YES];
            }
                break;
            case 1:
            {
                //寻找装修
                lookRonovateViewController *lookRenovate = [[lookRonovateViewController alloc]init];
                lookRenovate.hidesBottomBarWhenPushed = YES;
                [weakSelf.navigationController pushViewController:lookRenovate animated:YES];
            }
                break;
            case 2:
            {
                //找设计
                lookDesignerViewController *lookDesigner = [[lookDesignerViewController alloc]init];
                lookDesigner.hidesBottomBarWhenPushed = YES;
                [weakSelf.navigationController pushViewController:lookDesigner animated:YES];
                
            }
                break;
            case 3:
            {
                //装修案例
                RenovateCaseViewController *RCVC = [[RenovateCaseViewController alloc]init];
                RCVC.hidesBottomBarWhenPushed = YES;
                [weakSelf.navigationController pushViewController:RCVC animated:YES];
            }
                break;
            case 4:
            {
                //安装服务
                installServiceViewController *installServiceVC = [[installServiceViewController alloc]init];
                installServiceVC.hidesBottomBarWhenPushed = YES;
                [weakSelf.navigationController pushViewController:installServiceVC animated:YES];
                
            }
                break;
            case 5:
            {
                //建材商/优质店铺
                goodShopViewController *goodShopVC = [[goodShopViewController alloc]init];
                goodShopVC.hidesBottomBarWhenPushed = YES;
                [weakSelf.navigationController pushViewController:goodShopVC animated:YES];
            }
                break;
            case 6:
            {
                weakSelf.hidesBottomBarWhenPushed = YES;
                DDHomeShopViewController *  shopVC = [[DDHomeShopViewController alloc]init];
                
                [weakSelf.navigationController pushViewController:shopVC animated:NO];
                weakSelf.hidesBottomBarWhenPushed = NO;
             }
                break;
            case 7:
            {
                NSLog(@"%ld",index);
            }
                break;
            default:
                break;
        }
    };
}

#pragma mark -- TodeyActivityView
- (void)createTodayActivityView {
    //创建
    LHTodayActivity *todayActivity = [[NSBundle mainBundle]loadNibNamed:@"LHTodayActivity" owner:self options:nil].firstObject;
    //添加
    [self.scrollView addSubview:todayActivity];
    //设置位置大小
    todayActivity.frame = CGRectMake(0, 443, self.scrollView.width, 198);
}
#pragma mark -- RecommandCompanyView
- (void)createRecommandCompanyView {
    //创建
    self.companyView = [[NSBundle mainBundle]loadNibNamed:@"LHRecommandCompanyView" owner:self options:nil].firstObject;
    //更多按钮点击回调
    DDWeakSelf;
    self.companyView.moreBtnBlock = ^() {
        //建材商/优质店铺
        companyAndPersonViewController *companyAndPersonVC = [[companyAndPersonViewController alloc]init];
        companyAndPersonVC.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:companyAndPersonVC animated:YES];
    };
    //设置位置大小
    self.companyView.frame = CGRectMake(0,647,self.scrollView.width, 164);
    //添加
    [self.scrollView addSubview:self.companyView];
}
#pragma mark -- RecommandDesignerView
- (void)createRecommandDesignerView {
    //创建
    self.designerView = [[NSBundle mainBundle]loadNibNamed:@"LHRecommandDesignerView" owner:self options:nil].firstObject;
    //设置位置大小
    self.designerView.frame = CGRectMake(0, 817, self.scrollView.width, 508);
    [self.scrollView addSubview:self.designerView];
}
#pragma mark -- ForChoiceView
- (void)createForChoiceView {
    self.choiceView = [[NSBundle mainBundle]loadNibNamed:@"LHForChoiceView" owner:self options:nil].firstObject;
    self.choiceView.frame = CGRectMake(0, 1331, self.scrollView.width, 365);
    [self.scrollView addSubview:self.choiceView];
}
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    //重置搜索栏的颜色
    [self.navView resetBoderColor];
    self.navigationController.navigationBar.hidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    //取消网络请求
    [[LHNetworking shareInstance] cancelRquest];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
