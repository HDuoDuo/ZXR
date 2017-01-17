//
//  UIColor+extension.h
//  StroeMarkt
//
//  Created by 裴松林 on 15/5/21.
//  Copyright (c) 2015年 PSL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (extension)
+(UIColor* )colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;

+(UIColor* )colorWithHex:(NSInteger)hexValue;
+(NSString *)hexFromUIColor: (UIColor*) color;
@end
