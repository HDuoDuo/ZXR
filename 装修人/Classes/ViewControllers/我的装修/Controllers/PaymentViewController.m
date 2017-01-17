//
//  PaymentViewController.m
//  装修人
//
//  Created by 熊维东 on 2016/12/27.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import "PaymentViewController.h"
#import "Config.h"
#import "PaymentCell.h"
#import "CardCell.h"
#import "PaymentBtnCell.h"


typedef NS_ENUM(NSInteger, TypeCell)
{
    TypeCellcardCell = 0,
    TypeCellpaymentCell ,
    TypeCellPaymentBtnCell,
    
};
static NSString * cardCellIdentifier = @"cardCell";
static NSString * paymentcellIdentifier = @"paymentCell";
static NSString * paymentbtncellIdentifier = @"paymentBtnCell";
@interface PaymentViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(strong,nonatomic)PaymentCell  * paymentCell;
@property(strong,nonatomic)CardCell  * cardCell;
@property(strong,nonatomic)PaymentBtnCell  * paymentBtnCell;
@property(assign,nonatomic)TypeCell typeCell;
@property (weak, nonatomic) IBOutlet UITableView *aPaymentTableView;



@end

@implementation PaymentViewController
@synthesize typeCell;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    self.aPaymentTableView.delegate = self;
    self.aPaymentTableView.dataSource = self;
    
    
    [self.aPaymentTableView registerNib:[UINib nibWithNibName:@"PaymentCell" bundle:nil] forCellReuseIdentifier:@"paymentCell"];
    
    [self.aPaymentTableView registerNib:[UINib nibWithNibName:@"CardCell" bundle:nil] forCellReuseIdentifier:@"cardCell"];
    
    [self.aPaymentTableView registerNib:[UINib nibWithNibName:@"PaymentBtnCell" bundle:nil] forCellReuseIdentifier:@"paymentBtnCell"];
    
    self.aPaymentTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}

#pragma mark - Datasource delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    else if(section == 1) {
        
        return 5;
    }
    else if(section == 2) {
        
        return 1;
    }
    
    
    return 0;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
        typeCell = TypeCellcardCell;
        
        return 180;
    }else  if (indexPath.section == 1) {
        
        
        typeCell = TypeCellpaymentCell;
        
        return 44;
        
    }
    else {
        
        typeCell = TypeCellPaymentBtnCell;
        
        return 54;
        
    }
    
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    
    if (section == 1) {
        UIView * headView = [[UIView alloc]initWithFrame:CGRectMake(0 , 0, KScreenWidth, 30)];
        UILabel * lb_text = [[UILabel alloc]initWithFrame:CGRectMake(12, 10, 200, 20)];
        UILabel * head_LB = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 1)];
        UILabel * left_LB =[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 1, 30)];
        UILabel * right_LB =[[UILabel alloc]initWithFrame:CGRectMake(KScreenWidth-41, 0, 1, 30)];
        
        lb_text.text=@"支付方式";
        lb_text.font = [UIFont systemFontOfSize:12.0];
        
        lb_text.textColor = [UIColor colorWithWhite:0.600 alpha:1.000];
        head_LB.backgroundColor =[UIColor colorWithWhite:0.816 alpha:1.000];
        left_LB.backgroundColor =[UIColor colorWithWhite:0.816 alpha:1.000];
        right_LB.backgroundColor=[UIColor colorWithWhite:0.816 alpha:1.000];
        
        
        headView.backgroundColor =[UIColor whiteColor];
        
        [headView addSubview:lb_text];
        [headView addSubview:head_LB];
        [headView addSubview:left_LB];
        [headView addSubview:right_LB];
        return headView ;
        
    }
    return nil;
    
}
-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 1) {
        
        UIView * underView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 1)];
        underView.backgroundColor = [UIColor colorWithWhite:0.816 alpha:1.000];
        
        return underView;
        
    }
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 1) {
        
        return 30;
    }
    return 0.1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 1) {
        
        return 1;
    }
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    self.cardCell = [self.aPaymentTableView dequeueReusableCellWithIdentifier:cardCellIdentifier];
    self.paymentCell = [self.aPaymentTableView dequeueReusableCellWithIdentifier:paymentcellIdentifier];
    self.paymentBtnCell = [self.aPaymentTableView dequeueReusableCellWithIdentifier:paymentbtncellIdentifier];
    
    switch (indexPath.section) {
        case TypeCellcardCell:
            
            if (!_cardCell) {
                _cardCell = [[CardCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cardCellIdentifier];
                
            }
            
            _cardCell.selectionStyle = UITableViewCellSelectionStyleNone;
            return _cardCell;
            
            break;
        case TypeCellpaymentCell:
            
            if (!_paymentCell) {
                _paymentCell = [[PaymentCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:paymentcellIdentifier];
                
            }
            _paymentCell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            return _paymentCell;
            break;
            
        case TypeCellPaymentBtnCell:
            
            if (!_paymentBtnCell) {
                _paymentBtnCell = [[PaymentBtnCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:paymentcellIdentifier];
                
            }
            _paymentBtnCell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            return _paymentBtnCell;
            break;
            
            
            
    }
    
    return nil;
    
}



-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.title = @"付款";
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
