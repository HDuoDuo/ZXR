//
//  detailsHeaderView.m
//  装修人
//
//  Created by liuhang on 17/1/12.
//  Copyright © 2017年 熊维东. All rights reserved.
//

#import "detailsHeaderView.h"
#import "SDCycleScrollView.h"
#import "Config.h"

@interface detailsHeaderView ()<SDCycleScrollViewDelegate>
//指示条
@property (weak, nonatomic) IBOutlet UILabel *indicatorLabel;
//详情button
@property (weak, nonatomic) IBOutlet UIButton *detailsBtn;
//评价button
@property (weak, nonatomic) IBOutlet UIButton *commentBtn;
//滚动视图
@property (weak, nonatomic) IBOutlet UIView *bannerView;
@end
@implementation detailsHeaderView
- (void)awakeFromNib {
    [super awakeFromNib];
    //静态方法创建对象
    SDCycleScrollView *cycleView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0,KScreenWidth, self.bannerView.height) delegate:self placeholderImage:[UIImage imageNamed:@"banner"]];
    NSArray *imgsArray = [NSArray arrayWithObjects:@"banner",@"banner",@"banner", nil];
    cycleView.localizationImageNamesGroup = imgsArray;
    //设置pageContro的位置
    cycleView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    //添加到View上
    [self.bannerView addSubview:cycleView];
}
- (IBAction)detailsBtn:(UIButton *)sender {
    self.commentBtn.selected = NO;
    self.commentBtn.enabled = YES;
    sender.enabled = NO;
    sender.selected = YES;
    [self moveIndicator:sender];
    if (self.tappedBlock) {
        self.tappedBlock();
    }
}
- (IBAction)commentBtn:(UIButton *)sender {
    self.detailsBtn.selected = NO;
    self.detailsBtn.enabled = YES;
    sender.enabled = NO;
    sender.selected = YES;
    [self moveIndicator:sender];
    if (self.tappedBlock) {
        self.tappedBlock();
    }
}
//移动指示条
- (void)moveIndicator:(UIButton *)sender {
    [UIView animateWithDuration:0.3f animations:^{
       self.indicatorLabel.center = CGPointMake(sender.center.x, self.indicatorLabel.center.y);
    }];
}
@end
