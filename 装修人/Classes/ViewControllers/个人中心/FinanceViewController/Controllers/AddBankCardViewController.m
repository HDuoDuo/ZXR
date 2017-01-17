//
//  AddBankCardViewController.m
//  装修人
//
//  Created by 熊维东 on 2016/12/21.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import "AddBankCardViewController.h"
#import "AddBankCardNextViewController.h"
@interface AddBankCardViewController ()
{
    BOOL isLightButton;//选择状态

}
@property (weak, nonatomic) IBOutlet UIButton *seleceted_tureOrFalse;

@end

@implementation AddBankCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //同意用户协议
    [_seleceted_tureOrFalse  addTarget:self action:@selector(tureOrFalse:) forControlEvents:UIControlEventTouchUpInside];
    [_seleceted_tureOrFalse setImage:[UIImage imageNamed:@"btn_select_mormal"] forState:UIControlStateNormal];
}

/**
 选择钩钩
 
 @param sender sender tureOrFalse
 */
#pragma mark - 钩钩
-(void)tureOrFalse:(UIButton*)sender
{
    
    sender.selected = !sender.selected;
    if (sender.selected == YES) {
        isLightButton = YES;
        [_seleceted_tureOrFalse setImage:[UIImage imageNamed:@"btn_select_active"] forState:UIControlStateNormal];
        
    }else{
        isLightButton = NO;
        [_seleceted_tureOrFalse setImage:[UIImage imageNamed:@"btn_select_mormal"] forState:UIControlStateNormal];
    }
}


/**
 *  添加银卡信息下一步
 *
 *  @param sender NextAddBankCard
 */
- (IBAction)NextAddBankCard:(id)sender {

    self.hidesBottomBarWhenPushed = YES;

    AddBankCardNextViewController * nextVC= [[AddBankCardNextViewController alloc]init];
    [self.navigationController pushViewController:nextVC animated:NO];
 
 
}

-(void)viewWillAppear:(BOOL)animated
{
    self.title = @"添加银行卡";
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
