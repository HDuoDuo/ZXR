//
//  NSDate+LHDate.h
//  装修人
//
//  Created by liuhang on 16/12/23.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (LHDate)
//获取当前系统时间戳
+ (NSString *)timestampFromCurrentDate;
//获取当前date
+ (NSString *)dateStringFromCurrentDate;
//获取当前date
+ (NSString *)timeStringFromCurrentDate;
@end
