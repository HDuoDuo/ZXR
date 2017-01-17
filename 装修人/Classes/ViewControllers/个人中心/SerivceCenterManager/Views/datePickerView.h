//
//  datePickerView.h
//  装修人
//
//  Created by liuhang on 16/12/23.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface datePickerView : UIView
//时间选择器
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
//时间回传
@property (copy, nonatomic) void (^dateBlock)(NSString *);
//时间模式
@property (nonatomic, assign) UIDatePickerMode pickerModel;
@end
