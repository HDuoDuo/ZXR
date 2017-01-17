//
//  UITableViewCell+DrawRadius.h
//  TCTravel_IPhone
//
//  Created by zhaoxueliang on 16/9/22.
//  Copyright © 2016年 www.ly.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (DrawRadius)


// 性能有问题，不用
- (void)setViewCornerRadiusWithCorners:(UIRectCorner)corner cornerRadius:(CGSize)size horizontalMargin:(CGFloat)horizontal verticalMargin:(CGFloat)vertical;



/*
 byRoundingCorners:   圆角位置， 参考
                 UIRectCornerTopLeft     = 1 << 0,
                 UIRectCornerTopRight    = 1 << 1,
                 UIRectCornerBottomLeft  = 1 << 2,
                 UIRectCornerBottomRight = 1 << 3,
                 UIRectCornerAllCorners  = ~0UL
 
 edgeInsets: 缩进，  上下左右
 radius :  圆角值
 borderWidth : 边框
 borderCorlor : 边框颜色
 backgroundColor : 背景色
 };

*/
- (void)insetCornerViewRoundingCorners:(UIRectCorner)byRoundingCorners
                            edgeInsets:(UIEdgeInsets)edgeInsets
                                radius:(CGFloat)radius
                           borderWidth:(CGFloat)borderWidth
                          borderCorlor:(UIColor *)borderCorlor
                       backgroundColor:(UIColor *)backgroundColor;

@end
