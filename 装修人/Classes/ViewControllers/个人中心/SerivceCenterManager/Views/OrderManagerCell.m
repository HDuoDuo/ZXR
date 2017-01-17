//
//  OrderManagerCell.m
//
//
//  Created by 熊维东 on 2016/12/17.
//
//

#import "OrderManagerCell.h"

@implementation OrderManagerCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setModel:(goodsModel *)model {
    _model = model;
    self.lb_headtitle.text = _model.title;
    self.lb_price.text = model.price;
    self.lb_sales.text = model.truePrice;
    self.lb_inventory.text = model.number;
    self.lb_addtimeStamp.text = model.addTime;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
