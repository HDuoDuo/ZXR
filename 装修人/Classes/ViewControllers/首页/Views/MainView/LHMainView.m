//
//  LHMainView.m
//  装修人
//
//  Created by liuhang on 16/11/25.
//  Copyright © 2016年 刘航. All rights reserved.
//

#import "LHMainView.h"
#import "UIView+MEView.h"
@implementation LHMainView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return  self;
}
- (void)setupUI {
    //背景色
    self.backgroundColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:1];
    //打开View的交互
    self.userInteractionEnabled = YES;
    //button 的label数组
    NSArray *tittlesArray = @ [@"发布需求",@"寻找装修",@"找设计",@"精选案例",@"安装服务",@"优质店铺",@"商城",@"装修百科"];
    //装图片的数组
    NSMutableArray *imgsArray = [[NSMutableArray alloc]init];
    UIImage *img0 = [UIImage imageNamed:@"icon_release-requirements"];
    UIImage *img1 = [UIImage imageNamed:@"icon_decoration-company"];
    UIImage *img2 = [UIImage imageNamed:@"icon_designer"];
    ;
    UIImage *img3 = [UIImage imageNamed:@"icon_selected-case"];
    UIImage *img4 = [UIImage imageNamed:@"icon_building-materials"];
    UIImage *img5 = [UIImage imageNamed:@"icon_store"];
    UIImage *img6 = [UIImage imageNamed:@"icon_mall"];
    UIImage *img7 = [UIImage imageNamed:@"icon_wikipedia"];
    //添加对象
    [imgsArray addObject:img0];
    [imgsArray addObject:img1];
    [imgsArray addObject:img2];
    [imgsArray addObject:img3];
    [imgsArray addObject:img4];
    [imgsArray addObject:img5];
    [imgsArray addObject:img6];
    [imgsArray addObject:img7];
    
    //计算尺寸
    CGFloat boderH = 21.0f;
    CGFloat boderW = 18.0f;
    CGFloat marginW = (self.width - boderW *2 - 49.0f * 4.0) / 3.0f;
    CGFloat marginH = self.height - boderH*2 - 67.0f * 2;
    CGFloat btnW = 49.0f;
    CGFloat btnH = 67.0f;
    
    //根据数组循环创建btn
    for (NSInteger index = 0; index < tittlesArray.count; index++) {
        CGRect singleFrame = CGRectMake(boderW + (index % 4) *(marginW + btnW), (btnH + marginH) *(index / 4) +boderH, btnW, btnH);
        //创建单个View
        UIView *singleView = [self buttonView:singleFrame iamge:imgsArray[index] title:tittlesArray[index]];
        //设置tag值
        singleView.tag = index+10;
        
        [self addSubview:singleView];
    }
}
/**
 * sigleView
 */
- (UIView *)buttonView:(CGRect)frame iamge:(UIImage *)image title:(NSString *)str {
    UIView *btnView = [[UIView alloc]initWithFrame:frame];
    //图片
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 49, 49)];
    //切圆角
    imgView.layer.cornerRadius = 24.5f;
    imgView.layer.masksToBounds = YES;
    imgView.image = image;
    //文字
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 55, 49, 12)];
    titleLabel.font = [UIFont systemFontOfSize:11.0f];
    //    titleLabel.textColor = [UIColor colorWithRed:51.0f green:51.0f blue:51.0f alpha:1];
    titleLabel.text = str;
    titleLabel.textAlignment = 1;
    
    //添加到btnView上
    [btnView addSubview:imgView];
    [btnView addSubview:titleLabel];
    //打开交互添加点击事件
    btnView.userInteractionEnabled = YES;
    //创建手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(ViewTapped:)];
    //添加手势
    [btnView addGestureRecognizer:tap];
    //返回
    return btnView;
}
//点击手势回调
- (void)ViewTapped:(UITapGestureRecognizer *)tap {
    //获取被点击的View
    UIView *view = tap.self.view;
    NSInteger index = view.tag - 10;
    if (self.tapBlock) {
        self.tapBlock(index);
    }
}

@end
