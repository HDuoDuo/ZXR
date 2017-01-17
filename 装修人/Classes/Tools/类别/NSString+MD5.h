//
//  NSString+MD5.h
//  装修人
//
//  Created by liuhang on 16/12/26.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MD5)
//MD5静态方法加密
+ (NSString *)MDStringFromString:(NSString *)str;
//传入一个字符串数组，加密连接后返回
+ (NSString *)MDStringFromArray:(NSArray *)stringArray;
@end
