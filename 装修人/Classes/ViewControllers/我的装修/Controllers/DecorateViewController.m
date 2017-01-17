//
//  DecorateViewController.m
//  装修人
//
//  Created by 熊维东 on 2017/1/9.
//  Copyright © 2017年 熊维东. All rights reserved.
//

#import "DecorateViewController.h"
#import "DDContentCell.h"
#import "DDSectionCell.h"
#import "DDHeadView.h"
#import "DDFooterView.h"
#import "Config.h"

static NSString  * ddContenCellIdentifir = @"DDContentCell";
static NSString  * ddSectionCellIdentifir = @"DDSectionCell";
//static NSString  * ddFooterCellIdentifir = @"DDFooterCell";
//static NSString  * ddHeaderCellIdentifir = @"DDHeadViewCell";
@interface DecorateViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    DDContentCell * contenCell;
    DDSectionCell * sectionCell;
    DDFooterView * footView;
    DDHeadView * headView;

    
}

@end

@implementation DecorateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self DecorateInterfaceInit];
}
-(void)DecorateInterfaceInit
{
    self.aMytableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight) style:UITableViewStylePlain];
    
    [self.aMytableView registerNib:[UINib nibWithNibName:@"DDContentCell" bundle:nil] forCellReuseIdentifier:ddContenCellIdentifir];
    [self.aMytableView registerNib:[UINib nibWithNibName:@"DDSectionCell" bundle:nil] forCellReuseIdentifier:ddSectionCellIdentifir];
  
    
    headView = [[NSBundle mainBundle]loadNibNamed:@"DDHeadView" owner:self options:nil].lastObject;
    footView = [[NSBundle mainBundle]loadNibNamed:@"DDFooterView" owner:self options:nil].lastObject;
    
    self.aMytableView.tableHeaderView = headView;
    self.aMytableView.tableFooterView = footView;
  
    
    self.aMytableView.delegate =self;
    self.aMytableView.dataSource =self;
    self.aMytableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
    
    UIView * bgview = [[ UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
    UIImageView * bgImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tab_bj"]];
    [bgview addSubview:bgImage];
    [self.aMytableView setBackgroundView:bgview];
    [self.view addSubview:self.aMytableView ];
    
    
}

#pragma mark  -  datasoruce delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    CGFloat height =  [FontEngine strReturnHeight:contenCell.lb_dealWithMsgContext.text font:[UIFont systemFontOfSize:15] strWidth:KScreenWidth-115];

//    if ([model.str sel_isEqualToString@""]) {
//        
//        return height;
//    }
//    else{
//        return height+;
//        
//    }
    return 80;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
   
    return 60;
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    sectionCell = [self.aMytableView dequeueReusableCellWithIdentifier:ddSectionCellIdentifir];
 
   
    if (!sectionCell) {
        sectionCell = [[DDSectionCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ddSectionCellIdentifir];
    }
    
    return sectionCell;
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    contenCell = [self.aMytableView dequeueReusableCellWithIdentifier:ddContenCellIdentifir];
    
    if (!contenCell) {
        contenCell = [[DDContentCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ddContenCellIdentifir];
    }
    
    contenCell.backgroundColor = [UIColor clearColor];
    contenCell.selectionStyle = UITableViewCellSelectionStyleNone;
    

   // contenCell.lb_dealWithMsgContext.text = @"";

    
    return contenCell;
    
    
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@" section = %ld, row = %ld",indexPath.section,indexPath.row);
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    
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
