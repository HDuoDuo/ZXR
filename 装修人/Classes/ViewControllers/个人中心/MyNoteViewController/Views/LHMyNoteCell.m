//
//  LHMyNoteCell.m
//  装修人
//
//  Created by liuhang on 16/12/14.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import "LHMyNoteCell.h"

@interface LHMyNoteCell ()
//月份
@property (weak, nonatomic) IBOutlet UILabel *monthLB;
//星期
@property (weak, nonatomic) IBOutlet UILabel *weekLB;
//日
@property (weak, nonatomic) IBOutlet UILabel *dayLB;
//主题
@property (weak, nonatomic) IBOutlet UILabel *titleLB;
//详情
@property (weak, nonatomic) IBOutlet UILabel *descriptionLB;
//时间
@property (weak, nonatomic) IBOutlet UILabel *timeLB;
@end
@implementation LHMyNoteCell

- (void)awakeFromNib {
    [super awakeFromNib];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
}

@end
