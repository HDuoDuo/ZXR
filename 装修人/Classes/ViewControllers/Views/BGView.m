//
//  BGView.m
//  装修人
//
//  Created by 熊维东 on 2016/12/4.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import "BGView.h"

@implementation BGView

-(void)setCornerRadius:(CGFloat)cornerRadius
{
    _cornerRadius=cornerRadius;
    self.layer.cornerRadius = _cornerRadius;
    self.layer.masksToBounds =cornerRadius > 0 ? true : false;
    
}

-(void)setBorderWidth:(CGFloat)borderWidth
{
    _borderWidth = borderWidth;
    self.layer.borderWidth = _borderWidth;

    
}

-(void)setBorderColor:(UIColor *)borderColor
{
    _borderColor = borderColor;
    self.layer.borderColor = _borderColor.CGColor;

}

-(void)setDefineColor:(UIColor *)defineColor
{
    _defineColor = defineColor;
    self.layer.borderWidth= 4;
    self.layer.borderColor = _defineColor.CGColor;

}
@end
