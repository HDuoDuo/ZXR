//
//  ItemCell.h
//  装修人
//
//  Created by 熊维东 on 2017/1/12.
//  Copyright © 2017年 熊维东. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemCell : UITableViewCell

//颜色
@property (weak, nonatomic) IBOutlet UILabel *lb_colortitle;
//购买数量
@property (weak, nonatomic) IBOutlet UILabel *lb_buyQulity;
//色值
@property (weak, nonatomic) IBOutlet UILabel *lb_colorValue;
//计算出的数量
@property (weak, nonatomic) IBOutlet UILabel *lb_countNumber;
//减
@property (weak, nonatomic) IBOutlet UIButton *btn_decrease;
//加
@property (weak, nonatomic) IBOutlet UIButton *btn_add;


@end
