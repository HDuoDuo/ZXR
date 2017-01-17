//
//  NSDate+LHDate.m
//  装修人
//
//  Created by liuhang on 16/12/23.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import "NSDate+LHDate.h"

@implementation NSDate (LHDate)
//返回当前时间戳
+ (NSString *)timestampFromCurrentDate {
    NSDate *currentDate = [[NSDate alloc]init];
    return [NSString stringWithFormat:@"%ld",(long)[currentDate timeIntervalSince1970]];
}
//获取当前date
+ (NSString *)dateStringFromCurrentDate {

    NSDateComponents *dateComponent = [self getNSDateComponents];
    
    NSInteger year = [dateComponent year];
        
    NSInteger month = [dateComponent month];
        
    NSInteger day = [dateComponent day];

    return [NSString stringWithFormat:@"%ld年%.2ld月%.2ld日",year,month,day];
}
+ (NSString *)timeStringFromCurrentDate {
     NSDateComponents *dateComponent = [self getNSDateComponents];
    NSInteger hour = [dateComponent hour];
    
    NSInteger minute = [dateComponent minute];
    
    NSInteger second = [dateComponent second];
    
    NSString * currentDate = [NSString stringWithFormat:@"%.2ld时%.2ld分%.2ld秒",hour,minute,second];
    return currentDate;
}
+ (NSDateComponents *)getNSDateComponents {
    NSDate *currentDate = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    return [calendar components:unitFlags fromDate:currentDate];
}
@end
