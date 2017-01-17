//
//  LHNavView.h
//  装修人
//
//  Created by liuhang on 16/12/6.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LHNavView : UIView
/**
 * 搜索TF
 */
@property (weak, nonatomic) IBOutlet UITextField *searchTF;
/**
 * 改变边框颜色
 */
- (void)changeBoderColor;
/**
 * 换回边框颜色
 */
- (void)resetBoderColor;
@end
