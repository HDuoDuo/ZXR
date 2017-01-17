//
//  SettingViewController.m
//  装修人
//
//  Created by 熊维东 on 2017/1/5.
//  Copyright © 2017年 熊维东. All rights reserved.
//  设置信息

#import "SettingViewController.h"
#import "QuitLoginCell.h"
#import "SettingCell.h"
#import "SwitchCell.h"

#import "Config.h"

static NSString * identifirSettingCell = @"SettingCell";
static NSString * identifirSwitchCell = @"SwitchCell";
static NSString * identifirQuitLoginCell = @"QuitLoginCell";

typedef NS_ENUM(NSInteger, TypecCell)
{
    TypecCellWithSwitchCell = 0,
    TypecCellWithSettingCell,
    TypecCellWithQuitLoginCell,
};
@interface SettingViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    SwitchCell * switchCell;
    SettingCell *settingCell;
    QuitLoginCell* quitCell;
    
}
@property(assign,nonatomic)TypecCell typecCell;

@end

@implementation SettingViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self settingInterFaceViewInit];
    
}

-(void)settingInterFaceViewInit
{
    
    self.aMytableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight) style:UITableViewStyleGrouped];
    self.aMytableView.delegate =self;
    self.aMytableView.dataSource = self;
    
    
    [self.aMytableView registerNib:[UINib nibWithNibName:@"SettingCell"  bundle:nil] forCellReuseIdentifier:identifirSettingCell];
    [self.aMytableView registerNib:[UINib nibWithNibName:@"SwitchCell"  bundle:nil] forCellReuseIdentifier:identifirSwitchCell];
    [self.aMytableView registerNib:[UINib nibWithNibName:@"QuitLoginCell"  bundle:nil] forCellReuseIdentifier:identifirQuitLoginCell];
    self.aMytableView.separatorInset =UIEdgeInsetsZero;
    
    
    
    [self.view addSubview:self.aMytableView];
    
}
#pragma mark   ------- datasoruceDelegate --------
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 2;
        
    }else if (section == 1)
    {
        return 2;
    }
    else if (section == 2)
    {
        return 1 ;
    }
    return 1 ;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 44;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 3) {
        
        return 100;
    }
    return 10.0;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    settingCell  =[ self.aMytableView dequeueReusableCellWithIdentifier:identifirSettingCell];
    switchCell   =[ self.aMytableView dequeueReusableCellWithIdentifier:identifirSwitchCell];
    quitCell  = [ self.aMytableView dequeueReusableCellWithIdentifier:identifirQuitLoginCell];
    
    if (indexPath.section ==0 ) {
        
        if (indexPath.row == 0 ) {
            
            if ( !switchCell ) {
                
                switchCell = [[SwitchCell alloc ]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifirSwitchCell];
            }
            
            return switchCell;
        }
        
        if ( !settingCell ) {
            
            settingCell = [[SettingCell alloc ]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifirSettingCell];
        }
        else if ( indexPath.row == 1) {
            
            settingCell.lb_titleText.text = @"清除缓存";
            settingCell.lb_nameText.text = @"当前缓存22.5M";
            
        }
        settingCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        return settingCell;
      
    }
    else if (indexPath.section == 1 ||indexPath.section == 2 )
    {
        if ( !settingCell ) {
            
            settingCell = [[SettingCell alloc ]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifirSettingCell];
        }
        
        if (indexPath.section == 1 && indexPath.row == 0) {
            
            settingCell.lb_titleText.text = @"关于装修人";
            settingCell.lb_nameText.text = @"当前版本V1.20";
        }
        
        else if (indexPath.section == 1 && indexPath.row == 1) {
            
            settingCell.lb_titleText.text = @"意见反馈";
            settingCell.lb_nameText.text = @"";
        }
        
        else if (indexPath.section == 2 && indexPath.row == 0) {
            
            settingCell.lb_titleText.text = @"维权管理";
            settingCell.lb_nameText.text = @"";
        }
        
        settingCell.selectionStyle = UITableViewCellSelectionStyleNone;
        settingCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        return settingCell;
        
    }
    if ( !quitCell ) {
        
        quitCell = [[QuitLoginCell alloc ]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifirQuitLoginCell];
    }
    
    quitCell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return  quitCell;
    
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@" section = %ld  row = %ld,", indexPath.section,indexPath.row);
    
}


-(void)viewWillAppear:(BOOL)animated
{
    self.title = @"设置";
    [self setLeftNaviItemWithTitle:@"" imageName:@"nav_return"];
    
    self.navigationController.navigationBar.barTintColor= [UIColor whiteColor];
    self.navigationController.navigationBar.hidden = NO;
    
}
#pragma mark - 保存操作
- (void)rightItemTapped
{
    //methods
    
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
