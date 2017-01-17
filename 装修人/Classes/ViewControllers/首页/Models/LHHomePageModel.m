//
//  LHHomePageModel.m
//  装修人
//
//  Created by liuhang on 16/12/8.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import "LHHomePageModel.h"

@implementation LHHomePageModel

@end

@implementation DataModel
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"listDecCom" : [ListdeccomModel class], @"listDesCom" : [ListdescomModel class], @"listLunbo" : [ListlunboModel class], @"listShopping" : [ListshoppingModel class]};
}
//设置白名单
+(NSArray<NSString *> *)modelPropertyWhitelist {
    return @[@"listLunbo",@"listDecCom",@"listDesCom",@"listShopping"];
}
@end

@implementation ListdeccomModel
//设置白名单
+(NSArray<NSString *> *)modelPropertyWhitelist {
    return @[@"href",@"image"];
}
@end

@implementation ListdescomModel
//设置白名单
+(NSArray<NSString *> *)modelPropertyWhitelist {
    return @[@"href",@"image"];
}
@end

@implementation ListlunboModel
//设置白名单
+(NSArray<NSString *> *)modelPropertyWhitelist {
    return @[@"href",@"image"];
}
@end

@implementation ListshoppingModel
//设置白名单
+(NSArray<NSString *> *)modelPropertyWhitelist {
    return @[@"href",@"image"];
}
@end


