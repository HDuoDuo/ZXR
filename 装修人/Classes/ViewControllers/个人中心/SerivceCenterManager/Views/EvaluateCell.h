//
//  EvaluateCell.h
//  装修人
//
//  Created by 熊维东 on 2016/12/21.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EvaluateCell : UITableViewCell

/**
 *  用户名
 */
@property (weak, nonatomic) IBOutlet UILabel *lb_shopName;

/**
 *  5xing view
 */
@property (weak, nonatomic) IBOutlet UIView *starView;
/**
 *  根据好评度更改图标
 */
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
/**
 *  用户头像
 */
@property (weak, nonatomic) IBOutlet UIImageView *userHeadImageView;

/**
 *  评分
 */
@property (weak, nonatomic) IBOutlet UILabel *lb_starScore;
/**
 *  好评中评的状态
 */
@property (weak, nonatomic) IBOutlet UILabel *lb_goodevalute;
/**
 *  内容
 */
@property (weak, nonatomic) IBOutlet UILabel *lb_context;
/**
 *  查看信息
 */
@property (weak, nonatomic) IBOutlet UIButton *btn_checkAllmsg;
/**
 *  时间戳
 */
@property (weak, nonatomic) IBOutlet UILabel *lb_timeStamp;


@end
