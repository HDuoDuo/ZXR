//
//  RequireMangerViewController.m
//  装修人
//
//  Created by 熊维东 on 2016/12/15.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import "RequireMangerViewController.h"
#import "RequirementView.h"
#import "Config.h"
static NSString * identifirCell = @"RequirementView";
@interface RequireMangerViewController ()<UITableViewDelegate,UITableViewDataSource>


@end

@implementation RequireMangerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initInterfaceView];
    
}

-(void)initInterfaceView
{
    self.aMytableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight ) style:UITableViewStyleGrouped];

    [self.aMytableView registerNib:[UINib nibWithNibName:@"RequirementView" bundle:nil] forCellReuseIdentifier:identifirCell];
    self.aMytableView.delegate =self;
    self.aMytableView.dataSource = self;
    self.aMytableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.aMytableView];
    
}
#pragma mark - dataSource delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 91;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RequirementView * requireCell = [self.aMytableView dequeueReusableCellWithIdentifier:identifirCell];
   
    if (!requireCell) {
        requireCell = [[RequirementView alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifirCell];
        
    }
    
    requireCell.selectionStyle=  UITableViewCellSelectionStyleNone;
    requireCell.backgroundColor =COLOR(239, 239, 239, 1);
    
    return requireCell;
    
}


-(void)viewWillAppear:(BOOL)animated
{
    self.navigationItem.title =@"我的需求";
    [self setLeftNaviItemWithTitle:@"" imageName:@"nav_return"];
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBar.barTintColor= [UIColor whiteColor];
    
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
