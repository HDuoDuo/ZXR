//
//  JHSysImgPickerUtil.h
//  JHSystemUtility
//
//  Created by   
//  Copyright © 2016年 FLZC. All rights reserved.
// 对UIImagePickerController 的封装 (一行代码调用, block 回调使用图片)

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^JHImagePickerBlock)(UIImage *image);

@interface JHSysImgPickerUtil : NSObject

/**
 *  调用系统相机/相册
 *
 *  @param allowEditing 是否允许编辑
 *  @param handler      选取图片后的回调
 */
- (void)pickImageEditing:(BOOL)allowEditing handler:(JHImagePickerBlock)handler;

@end

/**
 *  使用:
 用属性调用实例方法
 self.imgPickerUtil = [[JHSysImgPickerUtil alloc] init];
 [self.imgPickerUtil pickImageEditing:NO handler:^(UIImage *image) {
 NSLog(@"@@~~image : %@", image);
 }];
 
 attention!!!: 注意使用时一定要用属性. 局部变量生命周期有限, 不能执行UIImagePickerController 的代理方法.
 
 */


