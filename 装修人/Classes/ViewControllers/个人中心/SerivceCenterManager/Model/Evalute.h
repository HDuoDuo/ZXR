//
//  Evalute.h
//  装修人
//
//  Created by 熊维东 on 2016/12/21.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Config.h"

@interface Evalute : BaseModel

/**
 *  //商品/店铺/服务商/服务评价（分数）appraise
 */
@property(nonatomic ,copy) NSString * appraise;

/**
 *  内容
 */
@property(nonatomic ,copy) NSString * content;

/**
 *  创建日期
 */
@property(nonatomic ,copy) NSString * create_date;

/**
 *  发货速度分数
 */
@property(nonatomic ,copy) NSString * deliveryspeedappraise;

/**
 *  商品名
 */
@property(nonatomic ,copy) NSString * goodsname;

/**
 * 评价id
 */
@property(nonatomic ,copy) NSString * pid;

/**
 *  用户名
 */
@property(nonatomic ,copy) NSString * name;

/**
 *  服务态度分数
 */
@property(nonatomic ,copy) NSString * serverappraise;

/**
 *  公司名
 */
@property(nonatomic ,copy) NSString * shopname;

/**
 *  头像
 */
@property(nonatomic ,copy) NSString * photo;

@property(nonatomic ,copy) NSString * nick_name;




@end
