//
//  OrderManagerCell.h
//
//
//  Created by 熊维东 on 2016/12/17.
//
//

#import <UIKit/UIKit.h>
#import "goodsModel.h"
@interface OrderManagerCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *goodsImageView;

@property (weak, nonatomic) IBOutlet UILabel *lb_headtitle;
@property (weak, nonatomic) IBOutlet UILabel *lb_price;

@property (weak, nonatomic) IBOutlet UILabel *lb_sales;

@property (weak, nonatomic) IBOutlet UILabel *lb_inventory;

@property (weak, nonatomic) IBOutlet UILabel *lb_addtimeStamp;
//数据模型
@property (nonatomic, strong) goodsModel *model;


@end
