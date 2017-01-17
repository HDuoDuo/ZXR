//
//  submitGoodModel.h
//  装修人
//
//  Created by liuhang on 16/12/23.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface submitGoodModel : NSObject

//商品名称
@property (nonatomic, strong) NSString *goodsName;
// 商品价格
@property (nonatomic, strong) NSString *shopprice;
// 线下价格
@property (nonatomic, strong) NSString *trueprice;
// 商品数量
@property (nonatomic, strong) NSString *goodscount;
// 所属店铺ID
@property (nonatomic, strong) NSString *shopid;
// 商品详情
@property (nonatomic, strong) NSString *content;
// 商品类型ID
@property (nonatomic, strong) NSString *goodstypeid;
// 上架时间
@property (nonatomic, strong) NSString *marketDate;
// 时间戳
@property (nonatomic, strong) NSString *timestamp;
// MD5摘要加密
@property (nonatomic, assign) NSInteger sign;
@end
