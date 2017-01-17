//
//  LHRecommandCompanyView.h
//  装修人
//
//  Created by liuhang on 16/12/6.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHHomePageModel.h"
@interface LHRecommandCompanyView : UIView
//数据模型
@property (nonatomic, weak) DataModel *companyModels;
//按钮点击回调
@property (nonatomic, copy) void (^moreBtnBlock)();
@end
