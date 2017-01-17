//
//  CouconViewController.m
//  装修人
//
//  Created by 熊维东 on 2016/12/8.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import "CouconViewController.h"
#import "couponCell.h"
#import "invalidationCell.h"
#import "Config.h"
typedef NS_ENUM(NSInteger ,TYPE_Cell) {
    TYPE_CellcouponCell = 0,
    TYPE_CellinvalidationCell ,
};
@interface CouconViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UIButton * btn_Used;
    UIButton * btn_Unused;
    UILabel * lb_Used;
    UILabel * lb_Unused;
}

@property(nonatomic ,assign)TYPE_Cell   typecell;

@end

@implementation CouconViewController
@synthesize typecell;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    [self initCouponView];
 
}
//初始化
-(void)initCouponView
{
    self.title = @"优惠券";
    [self setLeftNaviItemWithTitle:@"" imageName:@"nav_return"];
    
    UIView* bgview =  [[NSBundle mainBundle]loadNibNamed:@"CouponView" owner:self options:nil].lastObject;
    bgview.frame = CGRectMake(0, 64, KScreenWidth, 45);
    [self.view addSubview:bgview];
    
    self.aMytableView   =[[ UITableView alloc]initWithFrame:CGRectMake(0, 64+45, KScreenWidth, KScreenHeight -64-45) style:UITableViewStyleGrouped];
    self.aMytableView.delegate = self;
    self.aMytableView.dataSource =self;
    self.aMytableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.aMytableView];


    [self.aMytableView registerNib:[UINib nibWithNibName:@"couponCell" bundle:nil] forCellReuseIdentifier:@"couponCell"];
    [self.aMytableView registerNib:[UINib nibWithNibName:@"invalidationCell" bundle:nil] forCellReuseIdentifier:@"invalidationCell"];
    
    btn_Used = (UIButton*)[self.view viewWithTag:201];
    btn_Unused= (UIButton*)[self.view viewWithTag:202];
    [btn_Used addTarget:self action:@selector(btn_usedCoupon:) forControlEvents:UIControlEventTouchUpInside];
    [btn_Unused addTarget:self action:@selector(btn_unuseCoupon:) forControlEvents:UIControlEventTouchUpInside];

    lb_Used = (UILabel *)[self.view viewWithTag:203];
    lb_Unused = (UILabel *)[self.view viewWithTag:204];
    lb_Used.backgroundColor = COLOR(221, 62, 34, 1);
    

    
}
#pragma mark-可使用优惠券
-(void)btn_usedCoupon:(UIButton*) sender
{
    
    NSLog(@"1111");
    typecell = TYPE_CellcouponCell;
    lb_Used.backgroundColor = COLOR(221, 62, 34, 1);
    [btn_Used setTitleColor:COLOR(221, 62, 34, 1) forState:UIControlStateNormal];

    [btn_Unused setTitleColor:[UIColor darkGrayColor]forState:UIControlStateNormal];
    lb_Unused.backgroundColor =[UIColor whiteColor];
    
    [self.aMytableView reloadData];
}
#pragma mark- 不可使用优惠券
-(void)btn_unuseCoupon:(UIButton*) sender
{
   
    NSLog(@"2222");
    typecell = TYPE_CellinvalidationCell;
  
    lb_Unused.backgroundColor = COLOR(221, 62, 34, 1);
    [btn_Unused setTitleColor:COLOR(221, 62, 34, 1) forState:UIControlStateNormal];
    
    [btn_Used setTitleColor:[UIColor darkGrayColor]forState:UIControlStateNormal];
    lb_Used.backgroundColor =[UIColor whiteColor];
   [self.aMytableView reloadData];
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden = NO;
    [self setLeftNaviItemWithTitle:@"" imageName:@"nav_return"];
    self.navigationController.navigationBar.barTintColor =[UIColor whiteColor];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 1 ;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
  
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0;
}
 
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    couponCell *couCell = [self.aMytableView dequeueReusableCellWithIdentifier:@"couponCell"  ];
    invalidationCell *invalidationcell = [self.aMytableView dequeueReusableCellWithIdentifier:@"invalidationCell"  ];
    
    switch (typecell) {
        case TYPE_CellcouponCell:
            if (!couCell) {
                couCell = [[couponCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"couponCell"];
    
            }
            couCell.selectionStyle = UITableViewCellSelectionStyleNone;
            [couCell setBackgroundColor:[UIColor clearColor]];

            return couCell;

            break;
        case TYPE_CellinvalidationCell:
            if (!invalidationcell) {
                invalidationcell = [[invalidationCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"invalidationCell"];
                
            }
            invalidationcell.selectionStyle = UITableViewCellSelectionStyleNone;
            [invalidationcell setBackgroundColor:[UIColor clearColor]];
            return invalidationcell;
            break;
            
            
        default:
            break;
    }
 
     return invalidationcell;
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
