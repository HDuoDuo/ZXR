//
//  UIImage+DrawRoundRect.m
//
//  Created by Unc1e Wang on 16/9/25.
//  Copyright © 2016年 Unc1e Wang. All rights reserved.
//

#import "UIImageView+DrawRoundRect.h"

@implementation UIImageView (DrawRoundRect)

+ (UIImage *)drawRectWithRoundedCornerRadius:(CGFloat)radius
                                        size:(CGSize)size
                           byRoundingCorners:(UIRectCorner)byRoundingCorners
                                 borderWidth:(CGFloat)borderWidth
                             backgroundColor:(UIColor *)backgroundColor
                                borderCorlor:(UIColor *)borderColor {
    
    // 绘制大小
    CGSize sizeToFit = size;
    
    backgroundColor = backgroundColor == nil ? [UIColor whiteColor] :backgroundColor;
    CGFloat halfBorderWidth = borderWidth / 2.0;
    
    UIGraphicsBeginImageContextWithOptions(sizeToFit, NO, [UIScreen mainScreen].scale);
    
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, borderWidth);
    // 边框颜色
    CGContextSetStrokeColorWithColor(context, borderColor.CGColor);
    // 填充颜色
    CGContextSetFillColorWithColor(context, backgroundColor.CGColor);
    
    CGFloat width = sizeToFit.width, height = sizeToFit.height;
    
    // 准备起始移动的点
    CGContextMoveToPoint(context, width - halfBorderWidth, radius + halfBorderWidth);
    
    
    // 右下角的弧度
    CGContextAddArcToPoint(context, width - halfBorderWidth, height - halfBorderWidth, width - radius - halfBorderWidth, height - halfBorderWidth, (byRoundingCorners & UIRectCornerBottomRight) ? radius : 0);
    
    // 左下角的弧度
    CGContextAddArcToPoint(context, halfBorderWidth, height - halfBorderWidth, halfBorderWidth, height - radius - halfBorderWidth, (byRoundingCorners & UIRectCornerBottomLeft) ? radius : 0);
    
    // 左上角的弧度
    CGContextAddArcToPoint(context, halfBorderWidth, halfBorderWidth, width - halfBorderWidth, halfBorderWidth, (byRoundingCorners & UIRectCornerTopLeft) ? radius : 0);
    
    // 右上角的弧度
    CGContextAddArcToPoint(context, width - halfBorderWidth, halfBorderWidth, width - halfBorderWidth, radius + halfBorderWidth, (byRoundingCorners & UIRectCornerTopRight) ? radius : 0);
    
    CGContextDrawPath(UIGraphicsGetCurrentContext(), kCGPathFillStroke);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}


@end
