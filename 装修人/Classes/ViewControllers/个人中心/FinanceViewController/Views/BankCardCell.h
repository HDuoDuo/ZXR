//
//  BankCardCell.h
//  装修人
//
//  Created by 熊维东 on 2016/12/21.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BankCardCell : UITableViewCell


/**
 *  银行卡的背景
 */
@property (weak, nonatomic) IBOutlet UIImageView *bgBankView;

/**
 *  银行卡的LOGO
 */
@property (weak, nonatomic) IBOutlet UIImageView *bankLogoView;

/**
 *  银行名
 */
@property (weak, nonatomic) IBOutlet UILabel *lb_bankName;

/**
 *  银行卡类型
 */
@property (weak, nonatomic) IBOutlet UILabel *lb_bankType;

/**
 *  银行卡号
 */
@property (weak, nonatomic) IBOutlet UILabel *lb_bankCarNumber;

@end
