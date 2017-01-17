//
//  LHInbatchGoodsViewCell.m
//  装修人
//
//  Created by liuhang on 16/12/21.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import "LHInbatchGoodsViewCell.h"
@interface LHInbatchGoodsViewCell ()
//商品图片
@property (weak, nonatomic) IBOutlet UIImageView *goodsImg;
//商品主题
@property (weak, nonatomic) IBOutlet UILabel *goodsTitle;
//商品价格
@property (weak, nonatomic) IBOutlet UILabel *goodsPrice;
//销量
@property (weak, nonatomic) IBOutlet UILabel *goodsSales;
//库存
@property (weak, nonatomic) IBOutlet UILabel *goodsStock;
//添加时间
@property (weak, nonatomic) IBOutlet UILabel *addTime;
//选择按钮
@property (weak, nonatomic) IBOutlet UIButton *isSeclectedBtn;

@end
@implementation LHInbatchGoodsViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}
//重写model的setter
-(void)setModel:(LHInbatchGoodsModel *)model {
    _model = model;
    self.isSeclectedBtn.selected = _model.selected;
}
- (IBAction)goodsIsSeclected:(UIButton *)sender {
    sender.selected = !sender.selected;
    self.model.selected = sender.selected;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
}
@end
