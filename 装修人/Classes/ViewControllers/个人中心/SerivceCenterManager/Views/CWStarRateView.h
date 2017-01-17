//
//  CWStarRateView.h
//  StarRateDemo
//
//  Created by WANGCHAO on 14/11/4.
//  Copyright (c) 2014年 wangchao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CWStarRateView;

@protocol CWStarRateViewDelegate <NSObject>

@optional

- (void)starRateView:(CWStarRateView *)starRateView scroePercentDidChange:(CGFloat)newScorePercent;

@end

@interface CWStarRateView : UIView
//-----------------------------------------添加部分 开始 ---------------------------------------------//
typedef void(^StarEvaluateBlock)(CWStarRateView *starView,NSInteger index);

// 点击星星后的Block ，返回当前视图，和当前点击的第几个星星（从1开始数）
@property (nonatomic, copy) StarEvaluateBlock starEvaluateBlock;
// 默认星星
@property (nonatomic, strong) UIImage *defaultImage;
// 亮的星星
@property (nonatomic, strong) UIImage *lightImage;
// 默认有五个星星
- (instancetype)initWithFrame:(CGRect)frame
                    starIndex:(NSInteger)index
                    starWidth:(CGFloat)starWidth
                        space:(CGFloat)space
                 defaultImage:(UIImage *)defaultImage
                   lightImage:(UIImage *)lightImage
                     isCanTap:(BOOL)isCanTap;

//-----------------------------------------添加部分 结束 ---------------------------------------------//




@property (nonatomic, assign) CGFloat scorePercent;//得分值，范围为0--1，默认为1
@property (nonatomic, assign) BOOL hasAnimation;//是否允许动画，默认为NO
@property (nonatomic, assign) BOOL allowIncompleteStar;//评分时是否允许不是整星，默认为NO




@property (nonatomic, weak) id<CWStarRateViewDelegate>delegate;

- (instancetype)initWithFrame:(CGRect)frame numberOfStars:(NSInteger)numberOfStars;

@end
