//
//  SettingCell.h
//  装修人
//
//  Created by 熊维东 on 2017/1/5.
//  Copyright © 2017年 熊维东. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingCell : UITableViewCell

/**
 *  左边的文字
 */
@property (weak, nonatomic) IBOutlet UILabel *lb_titleText;

/**
 *  右边文字
 */
@property (weak, nonatomic) IBOutlet UILabel *lb_nameText;

@end
