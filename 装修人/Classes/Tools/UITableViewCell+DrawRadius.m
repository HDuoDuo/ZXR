//
//  UITableViewCell+DrawRadius.m
//  TCTravel_IPhone
//
//  Created by zhaoxueliang on 16/9/22.
//  Copyright © 2016年 www.ly.com. All rights reserved.
//

#import "UITableViewCell+DrawRadius.h"
#import "SelfTripCornerRadiuImageView.h"
#import "UIImageView+DrawRoundRect.h"
#define SCREEN_WIDTH

@implementation UITableViewCell (DrawRadius)


- (void)setViewCornerRadiusWithCorners:(UIRectCorner)corner cornerRadius:(CGSize)size horizontalMargin:(CGFloat)horizontal verticalMargin:(CGFloat)vertical
{
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(self.bounds, horizontal, vertical) byRoundingCorners:corner cornerRadii:size].CGPath;
    self.layer.masksToBounds = YES;
    self.layer.mask = maskLayer;
}


- (void)insetCornerViewRoundingCorners:(UIRectCorner)byRoundingCorners
                            edgeInsets:(UIEdgeInsets)edgeInsets
                                radius:(CGFloat)radius
                           borderWidth:(CGFloat)borderWidth
                          borderCorlor:(UIColor *)borderCorlor
                       backgroundColor:(UIColor *)backgroundColor
{
    self.backgroundColor = [UIColor clearColor];
    SelfTripCornerRadiuImageView *imgCornerRadiu = [[SelfTripCornerRadiuImageView alloc] init];
    imgCornerRadiu.image = [SelfTripCornerRadiuImageView drawRectWithRoundedCornerRadius:radius size:CGSizeMake(SCREEN_WIDTH-edgeInsets.left-edgeInsets.right, CGRectGetHeight(self.frame)) byRoundingCorners:byRoundingCorners borderWidth:borderWidth backgroundColor:backgroundColor borderCorlor:borderCorlor];
    if ([self.contentView.subviews.firstObject isKindOfClass:[SelfTripCornerRadiuImageView class]]) {
        [self.contentView.subviews.firstObject removeFromSuperview];
    }
    [self.contentView insertSubview:imgCornerRadiu atIndex:0];
   
    //[imgCornerRadiu mas_makeConstraints:^(MASConstraintMaker *make){
   //     make.edges.insets(edgeInsets);
   // }];
}

@end
