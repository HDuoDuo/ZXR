//
//  EvaluateManagerViewController.m
//  装修人
//
//  Created by 熊维东 on 2016/12/15.
//  Copyright © 2016年 熊维东. All rights reserved.
//   评价管理

#import "EvaluateManagerViewController.h"
#import "CWStarRateView.h"
#import "EvaluateCell.h"
#import "EvaluateNavView.h"
#import "Config.h"
#import "Evalute.h"


static NSString * Evacellidentifir = @"EvaluateCell";
@interface EvaluateManagerViewController ()<CWStarRateViewDelegate,UITableViewDelegate,UITableViewDataSource>
{
    UIButton *btn_all;//tag = 1101+
    UIButton *btn_good;
    UIButton *btn_medium;
    UIButton *btn_bad;
    
    UILabel * lb_all;
    UILabel * lb_good;
    UILabel * lb_medium;
    UILabel * lb_bad;
    NSString *timeSp;
    CWStarRateView * starRateView;
    EvaluateCell * evacell;
    
    BOOL isFirstBtn;
    BOOL isHearderRefresh;
}
/**
 *  type 评价类型
 */
@property(strong,nonatomic)  NSString * type;

/**
 *  所有评价数据
 */
@property(strong,nonatomic)  NSMutableArray * dataAllArray;

/**
 *  其他数据
 */
@property(strong,nonatomic)  NSMutableArray * dataOtherArray;



@end

@implementation EvaluateManagerViewController
@synthesize type;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self initInterfaceViewAndaMytableView];
    
    
}
/**
 *  懒加载
 *
 *  @return dataAllArray
 */
-(NSMutableArray *)dataAllArray
{
    if (!_dataAllArray) {
        _dataAllArray = [NSMutableArray array];
        
    }
    return _dataAllArray;
}

/**
 *  懒加载
 *
 *  @return dataOtherArray
 */
-(NSMutableArray *)dataOtherArray
{
    if (!_dataOtherArray) {
       
        _dataOtherArray = [NSMutableArray array];
    }
    return _dataOtherArray;
}

#pragma mark - 初始化
-(void)initInterfaceViewAndaMytableView
{
    
    self.aMytableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 44, KScreenWidth , KScreenHeight) style:UITableViewStyleGrouped];
    self.aMytableView.delegate = self;
    self.aMytableView.dataSource = self;
    self.aMytableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.aMytableView];
    
    
    
    [self.aMytableView registerNib:[UINib nibWithNibName:@"EvaluateCell" bundle:nil] forCellReuseIdentifier:Evacellidentifir];
    EvaluateNavView * view = [[NSBundle mainBundle]loadNibNamed:@"EvaluateNavView" owner:self options:nil].lastObject ;
    view.frame = CGRectMake(0, 64, KScreenWidth, 44);
    [self.view addSubview:view];
    
    self.aMytableView.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
        
        isHearderRefresh = YES;
        
        if (btn_all.selected == YES) {
            
            [self EvaluteAllPOSTRequst];

        }
        else{
            [self HttpsPostRequestForEvaluteManager];
        }
        
        
        
    }];
    
    
    btn_all =(UIButton*)[self.view viewWithTag:1101];
    [btn_all setTitleColor:RGBA(22, 73, 145, 1)forState:UIControlStateNormal];
    [btn_all addTarget:self action:@selector(btn_all:) forControlEvents:UIControlEventTouchUpInside];
    isFirstBtn = YES;
    
   
    
    btn_good =(UIButton*)[self.view viewWithTag:1102];
    [btn_good setTitleColor:RGBA(22, 73, 145, 1)forState:UIControlStateNormal];
    [btn_good addTarget:self action:@selector(btn_good:) forControlEvents:UIControlEventTouchUpInside];
    
    btn_medium =(UIButton*)[self.view viewWithTag:1103];
    [btn_medium setTitleColor:RGBA(22, 73, 145, 1)forState:UIControlStateNormal];
    [btn_medium addTarget:self action:@selector(btn_medium:) forControlEvents:UIControlEventTouchUpInside];
    
    btn_bad =(UIButton*)[self.view viewWithTag:1104];
    [btn_bad setTitleColor:RGBA(22, 73, 145, 1)forState:UIControlStateNormal];
    [btn_bad addTarget:self action:@selector(btn_bad:) forControlEvents:UIControlEventTouchUpInside];
    
    lb_all = (UILabel*) [self.view viewWithTag:1105];
    lb_all.backgroundColor = RGBA(22, 73, 145, 1);
    
    

    
}
/**
 *  全部评价
 *
 *  @param sender btn_all
 */
-(void)btn_all:(UIButton*)sender
{
    NSLog(@"点了我全部");
    isFirstBtn = YES;

    [sender setTitleColor:RGBA(22, 73, 145, 1)forState:UIControlStateNormal];
    lb_all = (UILabel*) [self.view viewWithTag:1105];
    lb_all.backgroundColor = RGBA(22, 73, 145, 1);
    
    [btn_medium setTitleColor:[UIColor darkGrayColor]forState:UIControlStateNormal];
    [btn_bad setTitleColor:[UIColor darkGrayColor]forState:UIControlStateNormal];
    [btn_good setTitleColor:[UIColor darkGrayColor]forState:UIControlStateNormal];
    
    lb_bad.backgroundColor =[UIColor whiteColor];
    lb_good.backgroundColor =[UIColor whiteColor];
    lb_medium.backgroundColor =[UIColor whiteColor];
    
    [self EvaluteAllPOSTRequst];
    
    
}
/**
 *  好评
 *
 *  @param sender btn_good
 */
-(void)btn_good:(UIButton*)sender
{
    type = @"1";
    isFirstBtn = NO;
    
    [sender setTitleColor:RGBA(22, 73, 145, 1)forState:UIControlStateNormal];
    lb_good = (UILabel*) [self.view viewWithTag:1106];
    lb_good.backgroundColor = RGBA(22, 73, 145, 1);
    
    [btn_medium setTitleColor:[UIColor darkGrayColor]forState:UIControlStateNormal];
    [btn_bad setTitleColor:[UIColor darkGrayColor]forState:UIControlStateNormal];
    [btn_all setTitleColor:[UIColor darkGrayColor]forState:UIControlStateNormal];
    
    lb_bad.backgroundColor =[UIColor whiteColor];
    lb_all.backgroundColor =[UIColor whiteColor];
    lb_medium.backgroundColor =[UIColor whiteColor];
    
    [self HttpsPostRequestForEvaluteManager];
}
/**
 *  中评
 *
 *  @param sender btn_medium
 */
-(void)btn_medium:(UIButton*)sender
{
    type = @"2";
    isFirstBtn = NO;

    [sender setTitleColor:RGBA(22, 73, 145, 1)forState:UIControlStateNormal];
    lb_medium = (UILabel*) [self.view viewWithTag:1107];
    lb_medium.backgroundColor = RGBA(22, 73, 145, 1);
    
    [btn_good setTitleColor:[UIColor darkGrayColor]forState:UIControlStateNormal];
    [btn_bad setTitleColor:[UIColor darkGrayColor]forState:UIControlStateNormal];
    [btn_all setTitleColor:[UIColor darkGrayColor]forState:UIControlStateNormal];
    lb_bad.backgroundColor =[UIColor whiteColor];
    lb_all.backgroundColor =[UIColor whiteColor];
    lb_good.backgroundColor =[UIColor whiteColor];
    
    [self HttpsPostRequestForEvaluteManager];
    
    
}
/**
 *  差评
 *
 *  @param sender btn_bad
 */
-(void)btn_bad:(UIButton*)sender
{
    
    type = @"3";
    isFirstBtn = NO;

    [sender setTitleColor:RGBA(22, 73, 145, 1)forState:UIControlStateNormal];
    lb_bad = (UILabel*) [self.view viewWithTag:1108];
    lb_bad.backgroundColor = RGBA(22, 73, 145, 1);
    
    [btn_medium setTitleColor:[UIColor darkGrayColor]forState:UIControlStateNormal];
    [btn_good setTitleColor:[UIColor darkGrayColor]forState:UIControlStateNormal];
    [btn_all setTitleColor:[UIColor darkGrayColor]forState:UIControlStateNormal];
    
    lb_good.backgroundColor =[UIColor whiteColor];
    lb_all.backgroundColor =[UIColor whiteColor];
    lb_medium.backgroundColor =[UIColor whiteColor];
    
    [self HttpsPostRequestForEvaluteManager];
    
}



/**
 *  全部评价
 */
-(void)EvaluteAllPOSTRequst
{
    isFirstBtn = YES;

//    [SVProgressHUD showProgress:1.0 status:@"努力记载中......"];
    [SVProgressHUD show];
    
    NSString * userid =@"41fcb53109a5454b8e0e4c27dc49a806";
    NSDictionary* params = [NSMutableDictionary dictionary];
    
    params = @{
               
               @"userid" : userid,
               
               };
    
    
    DDWeakSelf;
    
    [[HttpRequest shardWebUtil] postNetworkRequestURLString:evaluteAll_evaluteUrl parameters:params success:^(id obj) {
        
            if ([[obj valueForKey:@"code"] isEqualToString:@"SUC"]) {
                
                [SVProgressHUD showSuccessWithStatus:@"加载完毕😁"];
                
                if (weakSelf.dataAllArray.count > 0) {
                
                   [weakSelf.dataAllArray removeAllObjects];

                }
                    
                    NSMutableArray * dataArr ;
                    dataArr = obj[@"data"];
                    
                    for (NSDictionary *dic in dataArr) {
                        
                        Evalute * evalute = [Evalute new];
                        
                        [evalute selSetValue:dic];
                        
                        [weakSelf.dataAllArray addObject:evalute];
                        
              
                }
             
                NSLog(@"%@",_dataAllArray);


        }else{
               
                NSLog(@"数据错误");
   
                if (isHearderRefresh) {
                   
                    if ( weakSelf.dataAllArray ) {
                        [weakSelf.dataAllArray removeAllObjects];
                    }
                }
            }
  
        [weakSelf.aMytableView reloadData];

    }
     
        fail:^(NSError *error) {
            
            NSLog(@" 失败了xxxxxxx ！~~~~ %@",error);
            
        }];
    
        [SVProgressHUD dismiss];
 
    
}

/**
 *  网络好评中评差评
 */
-(void)HttpsPostRequestForEvaluteManager
{
 
 
  //  [SVProgressHUD showProgress:10.0 status:@"努力记载中......"];

 
    [SVProgressHUD show];
    
    NSString * userid =@"41fcb53109a5454b8e0e4c27dc49a806";
    NSDictionary* params = [NSMutableDictionary dictionary];
    
    params = @{
               
               @"userid" : userid,
               @"type" : type,
               
               };
  
    DDWeakSelf;
    [[HttpRequest shardWebUtil] postNetworkRequestURLString:evalute_MangaerUrl parameters:params success:^(id obj) {
        
       if ([[obj valueForKey:@"code"] isEqualToString:@"SUC"]) {
            
            [SVProgressHUD showSuccessWithStatus:@"加载完毕😁"];
           
            if (weakSelf.dataOtherArray.count > 0) {
                
                [weakSelf.dataOtherArray removeAllObjects];
                
            }
           
                NSMutableArray * dataArr  ;
            
                dataArr = obj[@"data"];
            
                for (NSDictionary *dic in dataArr) {
                
                    Evalute * evalute = [Evalute new];
                
                    [evalute selSetValue:dic];
                
                    [weakSelf.dataOtherArray addObject:evalute];
                
                }
            
                [weakSelf.aMytableView reloadData];
           }
        
        } fail:^(NSError *error) {
            
            [SVProgressHUD showErrorWithStatus:@"Error"];
            
            NSLog(@" 失败了xxxxxxx ！~~~~ %@",error);
         
        }];
    
 
        [SVProgressHUD dismiss];

}



#pragma mark - datasource delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if ( isFirstBtn ==YES) {
        return _dataAllArray.count;
    }
    return  _dataOtherArray.count;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return  9;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    Evalute * evalute = _dataAllArray[indexPath.section];
    CGFloat appraise = [evalute.appraise integerValue];
    CGFloat deliveryspeedappraise =[evalute.deliveryspeedappraise integerValue];
    CGFloat serverappraise =[evalute.serverappraise integerValue];
    CGFloat averageScore =  (appraise + deliveryspeedappraise +serverappraise)/3;
    NSInteger numberStar  = [evalute.appraise integerValue] ;
    
    starRateView = [[CWStarRateView alloc] initWithFrame:CGRectMake(0,3, evacell.starView.width, 16) starIndex:numberStar starWidth:16 space:1 defaultImage:nil lightImage:nil isCanTap:NO];
    
    evacell = [self.aMytableView dequeueReusableCellWithIdentifier:Evacellidentifir];
    
    if (!evacell) {
        
        evacell = [[EvaluateCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Evacellidentifir];
     
        
    }
    CALayer *cellImageLayer = evacell.userHeadImageView.layer;
    [cellImageLayer setCornerRadius:12];
    [cellImageLayer setMasksToBounds:YES];

    NSInteger stamp =[evalute.create_date integerValue] ;
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:MM:ss"];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:stamp / 1000];
    NSString * Str = [NSString stringWithFormat:@"%@",date];
    NSString * dateStr = [Str substringToIndex:19];//截取掉下标之前的字符串
    
    evacell.selectionStyle = UITableViewCellSelectionStyleNone;
    evacell.backgroundColor = [UIColor clearColor];
    evacell.lb_shopName.text = evalute.shopname;
    evacell.lb_context.text = evalute.content;
    evacell.lb_timeStamp.text =dateStr;
    
    
    
    if (averageScore <= 2.0) {//差评
        
        evacell.lb_starScore.text =[NSString stringWithFormat:@"%.1f分", averageScore];
        evacell.headImageView.image= [UIImage imageNamed:@"icon_poor_reputation"];
        evacell.lb_goodevalute.text = @"差评";

        
    }else if (averageScore >= 5.0)//好评
    {
        evacell.lb_starScore.text =[NSString stringWithFormat:@"%.1f分", averageScore];
        evacell.headImageView.image= [UIImage imageNamed:@"icon_reputation"];
        evacell.lb_goodevalute.text = @"好评";

    }
    else{//中评
        
        evacell.lb_starScore.text =[NSString stringWithFormat:@"%.1f分", averageScore];
        evacell.headImageView.image= [UIImage imageNamed:@"icon_mid_reputation"];
        evacell.lb_goodevalute.text = @"中评";

        
    }
    
    NSURL * url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",img_BaseURL,evalute.photo]];
    [evacell.userHeadImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@""]];
    [evacell.starView  addSubview:starRateView ];
    
    
    return evacell;
    
    
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

/**
 *
 *
 *  @param starRateView   评价view
 *  @param newScorePercent 评价百分比
 */
- (void)starRateView:(CWStarRateView *)starRateView scroePercentDidChange:(CGFloat)newScorePercent
{
    NSLog(@"newScorePercent == %f",newScorePercent);
}


-(void)viewWillAppear:(BOOL)animated
{
    
    self.title = @"评价管理";
    [self setLeftNaviItemWithTitle:@"" imageName:@"nav_return"];
    self.navigationController.navigationBar.barTintColor= [UIColor whiteColor];
    self.navigationController.navigationBar.hidden = NO;

    
    
    [self EvaluteAllPOSTRequst];
    
    
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
