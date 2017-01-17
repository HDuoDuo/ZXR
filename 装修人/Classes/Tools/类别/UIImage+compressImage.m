//
//  UIImage+compressImage.m
//  装修人
//
//  Created by liuhang on 16/12/27.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import "UIImage+compressImage.h"

@implementation UIImage (compressImage)
//对图片尺寸进行压缩
- (UIImage*)imageWithScaleWidth:(CGFloat)scaleWidth
{
    //根据传入的宽度计算高度
    CGFloat scaleHeight = scaleWidth * self.size.height / self.size.width;
    CGSize newSize = CGSizeMake(scaleWidth, scaleHeight);
    
    UIGraphicsBeginImageContext(newSize);
    
    [self drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}
@end
