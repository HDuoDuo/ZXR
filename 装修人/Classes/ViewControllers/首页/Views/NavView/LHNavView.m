//
//  LHNavView.m
//  装修人
//
//  Created by liuhang on 16/12/6.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import "LHNavView.h"

@interface LHNavView ()
@end
@implementation LHNavView
- (void)awakeFromNib {
    [super awakeFromNib];
    self.searchTF.layer.cornerRadius = 3.0f;
    self.searchTF.layer.masksToBounds = YES;
    self.layer.borderWidth = 0.5f;
}
//改变边框颜色
-(void)changeBoderColor {
        self.layer.borderColor = [UIColor blueColor].CGColor;
}
//重置边框颜色
- (void)resetBoderColor {
        self.layer.borderColor = self.backgroundColor.CGColor;
}
@end
