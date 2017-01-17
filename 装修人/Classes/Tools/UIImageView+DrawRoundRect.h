//
//  UIImage+DrawRoundRect.h
//
//  Created by Unc1e Wang on 16/9/25.
//  Copyright © 2016年 Unc1e Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (DrawRoundRect)

+ (UIImage *)drawRectWithRoundedCornerRadius:(CGFloat)radius
                                        size:(CGSize)size
                           byRoundingCorners:(UIRectCorner)byRoundingCorners
                                 borderWidth:(CGFloat)borderWidth
                             backgroundColor:(UIColor *)backgroundColor
                                borderCorlor:(UIColor *)borderColor;

@end
