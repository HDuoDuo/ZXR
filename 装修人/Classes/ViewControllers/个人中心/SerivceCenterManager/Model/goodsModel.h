//
//  goodsModel.h
//  装修人
//
//  Created by liuhang on 17/1/6.
//  Copyright © 2017年 熊维东. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface goodsModel : NSObject
//标题
@property (nonatomic, strong) NSString *title;
//描述
@property (nonatomic, strong) NSString *desc;
//图片url
@property (nonatomic, strong) NSString *imgUrl;
//价格
@property (nonatomic, strong) NSString *price;
//线下价格
@property (nonatomic, strong) NSString *truePrice;
//库存数量
@property (nonatomic, strong) NSString *number;
//添加商品时间
@property (nonatomic, strong) NSString *addTime;
@end
