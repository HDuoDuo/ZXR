//
//  ShoppingViewController.m
//  装修人
//
//  Created by 熊维东 on 2016/12/1.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import "ShoppingViewController.h"
#import "AcheckOrderViewController.h"
#import "PublishViewController.h"
#import "Config.h"
#import "ItemCell.h"
@interface ShoppingViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UIView * bgView;
    ItemCell * itemCell ;
    
}
@property(nonatomic,strong)    UITableView * tagTableView ;
@end

@implementation ShoppingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

   

    
}
//发布需求
- (IBAction)publishRequirement:(id)sender {
    
    PublishViewController * pvc =[[ PublishViewController alloc]init];
    pvc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:pvc animated:NO];
    pvc.hidesBottomBarWhenPushed = NO;


}

//去付款
- (IBAction)payment:(id)sender {
}

//我的订单
- (IBAction)myOrder:(id)sender {
    
    
    AcheckOrderViewController * cv = [[AcheckOrderViewController alloc]init];
    cv.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController: cv  animated:NO];
    cv.hidesBottomBarWhenPushed = NO;
    
}
//弹框
- (IBAction)pushActionView:(id)sender {
   
    NSLog(@"xxxxxxxxx");
    self.tabBarController.tabBar.hidden = YES;

    bgView  =  [[NSBundle mainBundle]loadNibNamed:@"AddShopCarView" owner:self options:nil].lastObject;
    
    UIButton * button = (UIButton*)[bgView viewWithTag:998];
    [button addTarget:self action:@selector(deleteDismissViewsss:) forControlEvents:UIControlEventTouchUpInside];
 
    self.tagTableView =(UITableView*)[bgView viewWithTag:999];
    self.tagTableView.delegate = self;
    self.tagTableView.dataSource = self;
    
    [self.tagTableView registerNib:[UINib nibWithNibName:@"ItemCell" bundle:nil] forCellReuseIdentifier:@"ItemCell"];
    NSLog(@"%@",self.tagTableView);
    
    
    bgView.frame = CGRectMake(0, KScreenHeight/2, KScreenWidth, KScreenHeight);
    
    [UIView animateWithDuration: 0.35 animations:^{
        
        bgView.frame = CGRectMake(0,0, KScreenWidth, KScreenHeight);
        
    } completion:^(BOOL finished) {
        
    }];

    [self.view addSubview:bgView];

}
#pragma mark  -  bgview消失动画
-(void)deleteDismissViewsss:(UIButton * )sender
{
    NSLog(@"消失");
    
    [UIView animateWithDuration: 0.35 animations:^{
        
        bgView.frame = CGRectMake(0, KScreenHeight, KScreenWidth, KScreenHeight);
        
    } completion:^(BOOL finished) {
        
        bgView.hidden = YES;
 
        self.tabBarController.tabBar.hidden = NO;
        
    }];
}



#pragma  mark - ----- delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 68;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    static NSString * Cellidentifir =@"ItemCell";
   
    itemCell  = [self.tagTableView dequeueReusableCellWithIdentifier:Cellidentifir];
   
    if (!itemCell) {
        
        itemCell = [[ItemCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Cellidentifir];
        
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
