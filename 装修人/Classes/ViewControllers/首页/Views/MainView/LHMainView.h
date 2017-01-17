//
//  LHMainView.h
//  装修人
//
//  Created by liuhang on 16/11/25.
//  Copyright © 2016年 刘航. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LHMainView : UIView

//点击事件回调
@property (nonatomic, copy)  void(^tapBlock) (NSInteger index);

@end
