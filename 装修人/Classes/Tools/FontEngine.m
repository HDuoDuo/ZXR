//
//  FontEngine.m
//  projectYuZhongQu
//
//  Created by pengrun on 14-9-14.
//  Copyright (c) 2014年 Pengrun. All rights reserved.
//

#import "FontEngine.h"

@implementation FontEngine
//根据字符串固定高度计算宽度
+ (CGFloat)strReturnWidth:(NSString *)strContent font:(UIFont *)font strHeight:(CGFloat)strHeight
{
    if (kSPIsIOS6)
    {
        CGSize size = [strContent sizeWithFont:font constrainedToSize:CGSizeMake(MAXFLOAT, strHeight)];
        return size.width;
    }
    else
    {
        NSStringDrawingOptions option = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
        NSDictionary *attribute = @{NSFontAttributeName:font};
        CGSize size = [strContent boundingRectWithSize:CGSizeMake(MAXFLOAT, strHeight)
                                               options:option
                                            attributes:attribute
                                               context:nil].size;
        return size.width;
    }
}

//根据字符串固定宽度计算高度
+ (CGFloat)strReturnHeight:(NSString *)strContent font:(UIFont *)font strWidth:(CGFloat)strWidth
{
    if (kSPIsIOS6)
    {
        CGSize size = [strContent sizeWithFont:font constrainedToSize:CGSizeMake(strWidth, MAXFLOAT)];
        return size.height;
    }
    else
    {
        NSStringDrawingOptions option = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
        NSDictionary *attribute = @{NSFontAttributeName:font};
        CGSize size = [strContent boundingRectWithSize:CGSizeMake(strWidth, MAXFLOAT)
                                               options:option
                                            attributes:attribute
                                               context:nil].size;
        return size.height;
    }
}
@end
