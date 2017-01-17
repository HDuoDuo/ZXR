//
//  FontEngine.h
//  projectYuZhongQu
//
//  Created by pengrun on 14-9-14.
//  Copyright (c) 2014年 Pengrun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//是否是IOS6系统
#define kSPIsIOS6 [[UIDevice currentDevice].systemVersion doubleValue] >= 6.0 && [[UIDevice currentDevice].systemVersion doubleValue] < 7.0

//是否是IOS7系统
#define kSPIsIOS7 [[UIDevice currentDevice].systemVersion doubleValue] >= 7.0

//默认字体
#define FontDefault(s)               [WDYS_GlobalClass SharedFontWithFontSize:s]
#define FontSystem(s)                [UIFont systemFontOfSize:s]
#define FontHelveticaNeue(s)         [UIFont fontWithName:@"HelveticaNeue-Light" size:s]
#define FontHelveticaNeueBold(s)     [UIFont fontWithName:@"HelveticaNeue-Bold" size:s]
#define FontRTWS(s)                  [UIFont fontWithName:@"RTWS YueGothic Demo" size:s]

//默认的字号计算
#define FontSize(s)        (s/2.0f)
//按720字号标注计算字号
#define FontSizeFor720(s)  ((s/1.125f)/2.0f)
//按640字号标注计算字号
#define FontSizeFor640Label(s)  (s/2.0f)

@interface FontEngine : NSObject
/**
 *  根据字符串固定高度计算宽度
 *
 *  @param strContent 需计算的字符串
 *  @param font       字体大小
 *  @param strHeight  固定高度
 *
 *  @return 返回宽度
 */
+ (CGFloat)strReturnWidth:(NSString *)strContent font:(UIFont *)font strHeight:(CGFloat)strHeight;



/**
 *  根据字符串固定宽度计算高度
 *
 *  @param strContent 需计算的字符串
 *  @param font       字体大小
 *  @param strWidth   固定宽度
 *
 *  @return 返回高度
 */
+ (CGFloat)strReturnHeight:(NSString *)strContent font:(UIFont *)font strWidth:(CGFloat)strWidth;
@end
