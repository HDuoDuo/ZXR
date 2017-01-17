//
//  ContentCell.h
//  装修人
//
//  Created by 熊维东 on 2017/1/9.
//  Copyright © 2017年 熊维东. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DDContentCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UILabel *lb_dealWithMsgContext;

@property (weak, nonatomic) IBOutlet UILabel *lb_stampOrDate;

@property (weak, nonatomic) IBOutlet UIButton *btn_checkDetailSM;

@end
