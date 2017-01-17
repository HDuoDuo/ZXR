
//
//  RootTabBarViewController.m
//  装修人
//
//  Created by 熊维东 on 2016/11/30.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import "RootTabBarViewController.h"
#import "MineViewController.h"
#import "ShoppingViewController.h"
#import "HomeViewController.h"
#import "MydecorationViewController.h"
#import "BaseNavViewController.h"
#import "DecorateViewController.h"

@interface RootTabBarViewController ()
@property(nonatomic ,strong )MineViewController *mineVC ;
@property(nonatomic ,strong )ShoppingViewController  *shopVC ;
@property(nonatomic ,strong )HomeViewController  *HomeVC ;
@property(nonatomic ,strong )DecorateViewController *decorationVC ;
@property(nonatomic ,strong )BaseNavViewController  *baseNavVC ;
@end

@implementation RootTabBarViewController
@synthesize baseNavVC;

-(BaseNavViewController *)baseNavVC
{
    if (nil == baseNavVC) {
        if (nil == baseNavVC) {
            
            baseNavVC = [[BaseNavViewController alloc]initWithRootViewController:baseNavVC];
        } else {
            [baseNavVC popToRootViewControllerAnimated:YES];
        }
        //
    }
    return baseNavVC;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = self;
 
    self.tabBar.tintColor =COLOR(22, 73, 145, 1);
   
    [self loadSubViewControllers];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(showLocationViewWithNotification:) name:@"PresentLocationViewController" object:nil];
  
}


-(MineViewController *)mineVC
{
    if (nil == _mineVC) {
        _mineVC = [[MineViewController alloc]initWithNibName:@"MineViewController" bundle:nil];
        
        _mineVC.tabBarItem.image = [UIImage imageNamed:@"tab_me_active"];
        _mineVC.tabBarItem.title = @"我的";
        
    }
    return _mineVC;
    
}
-(HomeViewController *)HomeVC
{
    if (nil == _HomeVC) {
        _HomeVC = [[HomeViewController alloc]initWithNibName:@"HomeViewController" bundle:nil];
        _HomeVC.tabBarItem.title = @"首页";
        _HomeVC.tabBarItem.image = [UIImage imageNamed:@"tab_home_active"];
        
    }
    return _HomeVC;
    
}
-(ShoppingViewController *)shopVC
{
    if (nil == _shopVC) {
        _shopVC = [[ShoppingViewController alloc]initWithNibName:@"ShoppingViewController" bundle:nil];
        _shopVC.tabBarItem.title = @"购物车";
 
        _shopVC.tabBarItem.image = [UIImage imageNamed:@"tab_shoppingcart_active"];
        
    }
    return _shopVC;
    
}
-(DecorateViewController *)decorationVC
{
    if (nil == _decorationVC) {
//        _decorationVC = [[DecorateViewController alloc]initWithNibName:@"DecorateViewController" bundle:nil];
        
        _decorationVC  = [[DecorateViewController alloc]init];
        _decorationVC.tabBarItem.image = [UIImage imageNamed:@"tab_decoration_active"];
        _decorationVC.tabBarItem.title = @"我的装修";

    }
    return _decorationVC;
    
}


- (void)loadSubViewControllers{
    //懒加载需要用点方法实现取方法
    UINavigationController *homeNav = [[UINavigationController alloc]initWithRootViewController:self.HomeVC];
    UINavigationController *mydecorationNav = [[UINavigationController alloc]initWithRootViewController:self.decorationVC];
    UINavigationController *shopNav = [[UINavigationController alloc]initWithRootViewController:self.shopVC];
    UINavigationController *mineNav = [[UINavigationController alloc]initWithRootViewController:self.mineVC];
    
    self.viewControllers = @[homeNav,mydecorationNav,shopNav,mineNav];
}

#pragma mark - Notification Methods
- (void)showLocationViewWithNotification:(NSNotification *)notification
{
    if(self.presentedViewController)
        [self dismissViewControllerAnimated:NO completion:nil];
    [self presentViewController:self.baseNavVC animated:YES completion:nil];
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
