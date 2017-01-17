//
//  AcheckOrderViewController.m
//  装修人
//
//  Created by 熊维东 on 2017/1/12.
//  Copyright © 2017年 熊维东. All rights reserved.
//
#import "Config.h"
#import "AcheckOrderViewController.h"

#import "AddressCell.h"
#import "TitleCell.h"
#import "OrderContentCell.h"
#import "SendWaysCell.h"
#import "BuyNickNameCell.h"
#import "SendWaysCell.h"
#import "OrderCheckFooterView.h"

static NSString * const addressCellidentifir = @"AddressCell";
static NSString * const titleCellidentifir = @"TitleCell";
static NSString * const orderContentCellidentifir = @"OrderContentCell";
static NSString * const sendWaysCellidentifir = @"SendWaysCell";
static NSString * const buyNickNameCellidentifir = @"BuyNickNameCell";


@interface AcheckOrderViewController ()<UITableViewDelegate,UITableViewDataSource>
//地址headCell
@property (strong, nonatomic)   AddressCell *addressCell;

//title家具店
@property (strong, nonatomic)   TitleCell *titleCell;

//OrderContextCell 内容
@property (strong, nonatomic)   OrderContentCell *orderContentCell;

//配送SendWay
@property (strong, nonatomic)   SendWaysCell *sendWaysCell;

//buyNickName
@property (strong, nonatomic)   BuyNickNameCell *buyNickNameCell;

//footerView
@property (strong, nonatomic)  OrderCheckFooterView *footerView;

//tableview
@property (weak, nonatomic) IBOutlet UITableView *OrderTableView;

@end

@implementation AcheckOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self shopOrderinterfaceViewInit];
}
-(void)shopOrderinterfaceViewInit
{
  
    self.OrderTableView.delegate = self;
    self.OrderTableView.dataSource = self;
    
    [self.OrderTableView registerNib:[UINib nibWithNibName:@"AddressCell" bundle:nil] forCellReuseIdentifier:addressCellidentifir];
    
    [self.OrderTableView registerNib:[UINib nibWithNibName:@"TitleCell" bundle:nil] forCellReuseIdentifier:titleCellidentifir];
    
    [self.OrderTableView registerNib:[UINib nibWithNibName:@"OrderContentCell" bundle:nil] forCellReuseIdentifier:orderContentCellidentifir];
    
    [self.OrderTableView registerNib:[UINib nibWithNibName:@"SendWaysCell" bundle:nil] forCellReuseIdentifier:sendWaysCellidentifir];
    
    [self.OrderTableView registerNib:[UINib nibWithNibName:@"BuyNickNameCell" bundle:nil] forCellReuseIdentifier:buyNickNameCellidentifir];
    UIView * footerView = [[NSBundle mainBundle]loadNibNamed:@"OrderCheckFooterView" owner:self options:nil].lastObject;
    self.OrderTableView.tableFooterView = footerView;
    

    [self.view addSubview:self.OrderTableView];
}
#pragma  mark  ----------------  tableView Delegate ---------------
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
       
        return 74;
  
    }if (indexPath.section == 1 && indexPath.row == 1) {
        return 110;
    }
    return  44;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    else if (section ==1 )
    {
        return 5;
    }
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 5) {
        
        return 44;
    }
    return 12;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    _addressCell= [self.OrderTableView dequeueReusableCellWithIdentifier:addressCellidentifir];
    _titleCell= [self.OrderTableView dequeueReusableCellWithIdentifier:titleCellidentifir];
    _orderContentCell= [self.OrderTableView dequeueReusableCellWithIdentifier:orderContentCellidentifir];
    _sendWaysCell= [self.OrderTableView dequeueReusableCellWithIdentifier:sendWaysCellidentifir];
    _buyNickNameCell= [self.OrderTableView dequeueReusableCellWithIdentifier:buyNickNameCellidentifir];

    
    

    if (indexPath.section == 0 &&indexPath.row == 1) {
       
        if (!_addressCell) {
            _addressCell = [[AddressCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:addressCellidentifir];
        }
        _addressCell.selectionStyle = UITableViewCellSelectionStyleNone;

        return _addressCell;
 
    }
   if(indexPath.section == 1 &&indexPath.row == 0) {
        
        if (!_titleCell) {
            _titleCell = [[TitleCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:titleCellidentifir];
        }
       _titleCell.selectionStyle = UITableViewCellSelectionStyleNone;

        return _titleCell;
        
    }
    if(indexPath.section == 1 &&indexPath.row == 1) {
        
        if (!_orderContentCell) {
            _orderContentCell = [[OrderContentCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:orderContentCellidentifir];
        }
        _orderContentCell.selectionStyle = UITableViewCellSelectionStyleNone;

        return _orderContentCell;
        
    }

     if(indexPath.section == 1 &&indexPath.row == 2) {
        
        if (!_sendWaysCell) {
            _sendWaysCell = [[SendWaysCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:sendWaysCellidentifir];
        }
         _sendWaysCell.selectionStyle = UITableViewCellSelectionStyleNone;

        return _sendWaysCell;
        
    }
    if(indexPath.section == 1 &&indexPath.row == 3) {
        
        if (!_sendWaysCell) {
            _sendWaysCell = [[SendWaysCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:sendWaysCellidentifir];
        }
        _sendWaysCell.selectionStyle = UITableViewCellSelectionStyleNone;

        return _sendWaysCell;
    }
   if(indexPath.section == 1 &&indexPath.row == 4) {
        if (!_sendWaysCell) {
            _sendWaysCell = [[SendWaysCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:sendWaysCellidentifir];
        }
       _sendWaysCell.selectionStyle = UITableViewCellSelectionStyleNone;

        return _sendWaysCell;
    }
     if(indexPath.section == 2 && indexPath.row == 0 )
    {
        if (!_buyNickNameCell) {
            _buyNickNameCell = [[BuyNickNameCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:buyNickNameCellidentifir];
        }
        _buyNickNameCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return _buyNickNameCell;

    }
    return _addressCell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"%ld,%ld",indexPath.section,indexPath.row);
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title =@"确认订单";
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
