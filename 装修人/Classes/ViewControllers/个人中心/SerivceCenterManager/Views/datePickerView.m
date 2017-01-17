//
//  datePickerView.m
//  装修人
//
//  Created by liuhang on 16/12/23.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import "datePickerView.h"
#import "Config.h"
@implementation datePickerView
- (void)setPickerModel:(UIDatePickerMode)pickerModel {
    _pickerModel = pickerModel;
    //模式
    self.datePicker.datePickerMode = _pickerModel;
    if (pickerModel == UIDatePickerModeDate) {
        //初始化最小时间
        self.datePicker.minimumDate = [[NSDate alloc]init];
    }
}
//取消按钮
- (IBAction)cancelButton:(UIButton *)sender {
    [self remove];
}
//确定按钮
- (IBAction)sureButton:(UIButton *)sender {
    //用block传时间
    NSDate *sureDate = self.datePicker.date;
    NSString *DateString;
    if (self.pickerModel == UIDatePickerModeDate) {
        //设置时间格式
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy年MM月dd日"];
        DateString = [dateFormatter stringFromDate:sureDate];
    }
    if (self.pickerModel == UIDatePickerModeTime) {
        //设置时间格式
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"HH时mm分ss秒"];
        DateString = [dateFormatter stringFromDate:sureDate];
    }
    //回传
    if (self.dateBlock) {
        self.dateBlock(DateString);
    }
    [self remove];
}
//从父视图上移除
- (void)remove {
    CGRect rect = CGRectMake(0, KScreenHeight, self.width, self.height);
    [UIView animateWithDuration:0.2f animations:^{
        self.frame = rect;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
@end
