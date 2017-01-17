//
//  HeadViewController.m
//  装修人
//
//  Created by 熊维东 on 2017/1/5.
//  Copyright © 2017年 熊维东. All rights reserved.
//   账户信息

#import "HeadViewController.h"
#import "HeadViewCell.h"
#import "SettingCell.h"
#import "Config.h"

static NSString * headCellIdentifier = @"HeadViewCell";
static NSString * settingIdentifirCell = @"SettingCell";

typedef NS_ENUM(NSInteger, TypecCell)
{
    TypecCellWithSettingHeadImageCell = 0,
    TypecCellWithSettingCell,
};

@interface HeadViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    HeadViewCell * headCell;
    SettingCell *settingCell;
    
}
@property(assign,nonatomic)TypecCell typecCell;

@end



@implementation HeadViewController

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
    
    [self.aMytableView registerNib:[UINib nibWithNibName:@"HeadViewCell"  bundle:nil] forCellReuseIdentifier:headCellIdentifier];
    [self.aMytableView registerNib:[UINib nibWithNibName:@"SettingCell"  bundle:nil] forCellReuseIdentifier:settingIdentifirCell];
    self.aMytableView.separatorInset =UIEdgeInsetsZero;
  
    [self.view addSubview:self.aMytableView];
    
}
#pragma mark   ------- datasoruceDelegate --------
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
        
    }else if (section == 1)
    {
        return 4;
    }
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
        return 55;
    }
    return 44;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10.0;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    headCell  =[ self.aMytableView dequeueReusableCellWithIdentifier:headCellIdentifier];
    settingCell  =[ self.aMytableView dequeueReusableCellWithIdentifier:settingIdentifirCell];
  
    if (indexPath.section == 0) {
        
        if (!headCell  ) {
            
            headCell = [[HeadViewCell alloc ]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:headCellIdentifier];
        }
        headCell.selectionStyle = UITableViewCellSelectionStyleNone;
        headCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        headCell.headimage.image = [self circleImage: headCell.headimage.image withParam:0];
        
        return headCell;
        
    }else if(indexPath.section == 1){
      
        if (!settingCell) {
            
            settingCell = [[SettingCell alloc ]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:settingIdentifirCell];
        }
        settingCell.selectionStyle = UITableViewCellSelectionStyleNone;
        settingCell.accessoryType =UITableViewCellAccessoryDisclosureIndicator;

        if (indexPath.row == 0) {
    
            settingCell.lb_titleText.text =  @"昵称";
            settingCell.lb_nameText.text = @"我被青春闪了腰啊~";
            
        }
       else if (indexPath.row == 1) {
           settingCell.lb_titleText.text =  @"所在城市";
           settingCell.lb_nameText.text = @"chongq";
        }
       else if (indexPath.row == 2) {
           
           settingCell.lb_titleText.text =  @"手机号码";
           settingCell.lb_nameText.text = @"chongq";
           
       }
       else if (indexPath.row == 3) {
           
           settingCell.lb_titleText.text =  @"修改密码";
           settingCell.lb_nameText.text = @"chongq";
       }
       
        return settingCell;
     
    }
 
    else{
      
        settingCell.accessoryType =UITableViewCellAccessoryDisclosureIndicator;
        settingCell.selectionStyle = UITableViewCellSelectionStyleNone;

        if (indexPath.row == 0) {
            
            settingCell.lb_titleText.text =  @"住房状态";
            settingCell.lb_nameText.text = @"chongq";
            
        }
        else if (indexPath.row == 1) {
            settingCell.lb_titleText.text =  @"收货地址";
            settingCell.lb_nameText.text = @"chongq";
        }
        return settingCell;
    }

    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@" section = %ld  row = %ld,", indexPath.section,indexPath.row);
    
 
    if (indexPath.section == 0) {
        if (indexPath.row == 0 ) {
            
            NSLog(@"dd dddd  ");
        }
    }
    
}

/**
 *  圆角处理
 *
 *  @param image 要切的图
 *  @param inset 边角
 *
 *  @return  参数
 */
-(UIImage*)circleImage:(UIImage*)image withParam:(CGFloat) inset {
    
    UIGraphicsBeginImageContext(image.size);
    
    CGContextRef context =UIGraphicsGetCurrentContext();
    
    //圆的边框宽度为1，颜色为白色
    
    CGContextSetLineWidth(context,1);
    
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    
    CGRect rect = CGRectMake(inset, inset, image.size.width - inset *2.0f, image.size.height - inset *2.0f);
    
    CGContextAddEllipseInRect(context, rect);
    
    CGContextClip(context);
    
    //在圆区域内画出image原图
    
    [image drawInRect:rect];
    
    CGContextAddEllipseInRect(context, rect);
    
    CGContextStrokePath(context);
    
    //生成新的image
    
    UIImage *newimg = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newimg;
    
}


-(void)viewWillAppear:(BOOL)animated
{
    self.title = @"账号信息";
    [self setLeftNaviItemWithTitle:@"" imageName:@"nav_return"];
    [self setRightNaviItemWithTitle:@" " imageName:@"font_save"];
    
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
