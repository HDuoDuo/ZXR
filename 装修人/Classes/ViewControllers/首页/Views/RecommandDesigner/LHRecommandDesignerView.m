//
//  LHRecommandDesignerView.m
//  装修人
//
//  Created by liuhang on 16/12/7.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import "LHRecommandDesignerView.h"
#import "Config.h"
#import <SDWebImage/UIImageView+WebCache.h>
@interface LHRecommandDesignerView ()
@property (weak, nonatomic) IBOutlet UIImageView *designerOne;
@property (weak, nonatomic) IBOutlet UIImageView *designerTwo;
@property (weak, nonatomic) IBOutlet UIImageView *designerThree;

@end
@implementation LHRecommandDesignerView
//系统方法
- (void)awakeFromNib {
    [super awakeFromNib];
}
#pragma mark -- btn点击事件
- (IBAction)lookMoreBtn:(UIButton *)sender {
}
- (IBAction)onClickedDesigner:(UIButton *)sender {
}

-(void)setDesignerModel:(DataModel *)designerModel {
    _designerModel = designerModel;
    //循环赋值
    for (NSInteger idx = 0; idx < designerModel.listDesCom.count; idx++) {
        ListdescomModel *model = designerModel.listDesCom[idx];
        NSString *urlStr = [NSString stringWithFormat:prefixImage_url,model.image];
        if (idx == 0) {
            [self.designerOne sd_setImageWithURL:[NSURL URLWithString:urlStr]];
        }
        if (idx == 1) {
            [self.designerTwo sd_setImageWithURL:[NSURL URLWithString:urlStr]];
        }
        if (idx == 2) {
            [self.designerThree sd_setImageWithURL:[NSURL URLWithString:urlStr]];
        }
    }
}
@end
