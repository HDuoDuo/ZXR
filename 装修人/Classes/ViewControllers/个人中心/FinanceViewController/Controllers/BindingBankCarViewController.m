//
//  BindingBankCarViewController.m
//  装修人
//
//  Created by 熊维东 on 2016/12/21.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import "BindingBankCarViewController.h"
#import "AddBankCardViewController.h"
#import "BankCardCell.h"
#import "Config.h"

@interface BindingBankCarViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *bing_tableView;

@end

@implementation BindingBankCarViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initInterfaceView];
}

-(void)initInterfaceView
{
    self.bing_tableView.delegate = self;
    self.bing_tableView.dataSource = self;
    [self.bing_tableView registerNib:[UINib nibWithNibName:@"BankCardCell" bundle:nil] forCellReuseIdentifier:@"bankCell"];

}
/**
 *  添加银行卡
 *
 *  @param sender add_BANKCardAction
 */
- (IBAction)add_BANKCardAction:(id)sender {
    
    self.hidesBottomBarWhenPushed = YES;
    AddBankCardViewController * addVC  =[[AddBankCardViewController alloc]init];
    [self.navigationController pushViewController:addVC animated:NO];
    self.hidesBottomBarWhenPushed = NO;

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
    return 123;
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
    static NSString * bankcellIdentifir = @"bankCell";
    BankCardCell * bankcell =[ self.bing_tableView dequeueReusableCellWithIdentifier:bankcellIdentifir];
    if (!bankcell) {
        bankcell = [[BankCardCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:bankcellIdentifir];
        
    }
    bankcell.selectionStyle =UITableViewCellSelectionStyleNone;
    bankcell.backgroundColor = [UIColor clearColor];
    return bankcell;
}

-(void)viewWillAppear:(BOOL)animated
{
    self.title = @"我的银行卡";
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
