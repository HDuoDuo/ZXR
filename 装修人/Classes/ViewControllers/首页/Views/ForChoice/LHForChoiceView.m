//
//  LHForChoiceView.m
//  装修人
//
//  Created by liuhang on 16/12/7.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import "LHForChoiceView.h"
#import "Config.h"
@interface LHForChoiceView ()
@property (weak, nonatomic) IBOutlet UIImageView *choiceOne;
@property (weak, nonatomic) IBOutlet UIImageView *choiceTwo;
@property (weak, nonatomic) IBOutlet UIImageView *choiceThree;
@property (weak, nonatomic) IBOutlet UIImageView *choiceFour;

@end
@implementation LHForChoiceView
- (void)awakeFromNib {
    [super awakeFromNib];
}
- (IBAction)onClikedChoice:(UIButton *)sender {
    //根据tag值判断点击事件（1~4）
}
//重写set方法
- (void)setChoiceModel:(DataModel *)choiceModel {
    _choiceModel = choiceModel;
    //循环赋值
    for (NSInteger idx = 0; idx < choiceModel.listShopping.count; idx++) {
        ListshoppingModel *model = choiceModel.listShopping[idx];
        NSString *urlStr = [NSString stringWithFormat:prefixImage_url,model.image];
        if (idx == 0) {
            [self.choiceOne sd_setImageWithURL:[NSURL URLWithString:urlStr]];
        }
        if (idx == 1) {
            [self.choiceTwo sd_setImageWithURL:[NSURL URLWithString:urlStr]];
        }
        if (idx == 2) {
            [self.choiceThree sd_setImageWithURL:[NSURL URLWithString:urlStr]];
        }
        if (idx == 3) {
            [self.choiceFour sd_setImageWithURL:[NSURL URLWithString:urlStr]];
        }
    }

}
@end
