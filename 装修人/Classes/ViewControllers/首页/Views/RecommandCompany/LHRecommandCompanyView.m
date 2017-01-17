//
//  LHRecommandCompanyView.m
//  装修人
//
//  Created by liuhang on 16/12/6.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import "LHRecommandCompanyView.h"
#import "Config.h"
#import <SDWebImage/SDImageCache.h>
@interface LHRecommandCompanyView ()
@property (weak, nonatomic) IBOutlet UIImageView *companyOne;
@property (weak, nonatomic) IBOutlet UIImageView *companyTwo;
@property (weak, nonatomic) IBOutlet UIImageView *companyThree;
@property (weak, nonatomic) IBOutlet UIImageView *companyFour;
@property (weak, nonatomic) IBOutlet UIImageView *companyFive;
@property (weak, nonatomic) IBOutlet UIImageView *companySix;
@property (weak, nonatomic) IBOutlet UIImageView *companySeven;
@property (weak, nonatomic) IBOutlet UIImageView *companyEight;

@end
@implementation LHRecommandCompanyView
- (void)awakeFromNib {
    [super awakeFromNib];
}
//查看更多
- (IBAction)lookMore:(UIButton *)sender {
    if (self.moreBtnBlock) {
        self.moreBtnBlock();
    }
}
- (IBAction)imgTapped:(UITapGestureRecognizer *)sender {
    //logo被点击时通过tag判定谁被点击，依次是（1~8）
    UIView *view = sender.self.view;
    NSLog(@"%ld",view.tag);
}
//根据model的数据下载图片
-(void)setCompanyModels:(DataModel *)companyModels {
    _companyModels = companyModels;
    //循环赋值
    for (NSInteger idx = 0; idx < companyModels.listDecCom.count; idx++) {
        ListdeccomModel *model = companyModels.listDecCom[idx];
        //图片请求地址
        NSURL *urlStr = [NSURL URLWithString:[NSString stringWithFormat:prefixImage_url,model.image]];
        if (urlStr) {
            switch (idx) {
                case 0:
                {
                    [self.companyOne sd_setImageWithURL:urlStr];
                }
                    break;
                case 1:
                {
                    [self.companyTwo sd_setImageWithURL:urlStr];
                }
                    break;
                case 2:
                {
                    [self.companyThree sd_setImageWithURL:urlStr];
                }
                    break;
                case 3:
                {
                    [self.companyFour sd_setImageWithURL:urlStr];
                }
                    break;
                case 4:
                {
                    [self.companyFive sd_setImageWithURL:urlStr];
                }
                    break;
                case 5:
                {
                    [self.companySix sd_setImageWithURL:urlStr];
                }
                    break;
                case 6:
                {
                    [self.companySeven sd_setImageWithURL:urlStr];
                }
                    break;
                case 7:
                {
                    [self.companyEight sd_setImageWithURL:urlStr];
                }
                    break;
                default:
                    break;
            }
        }
    }
}
@end
