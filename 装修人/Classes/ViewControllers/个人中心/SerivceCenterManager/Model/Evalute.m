//
//  Evalute.m
//  装修人
//
//  Created by 熊维东 on 2016/12/21.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import "Evalute.h"

@implementation Evalute

-(void)selSetValue:(NSDictionary *)theDictionary{

    self.appraise = [self selStringUseful:[theDictionary valueForKey:@"appraise"]];
    self.content = [self selStringUseful:[theDictionary valueForKey:@"content"]];
    self.goodsname = [self selStringUseful:[theDictionary valueForKey:@"goodsname"]];
    self.create_date = [self selStringUseful:[theDictionary valueForKey:@"create_date"]];
    self.shopname = [self selStringUseful:[theDictionary valueForKey:@"shopname"]];
    self.pid = [self selStringUseful:[theDictionary valueForKey:@"id"]];
    self.serverappraise = [self selStringUseful:[theDictionary valueForKey:@"serverappraise"]];
    self.deliveryspeedappraise = [self selStringUseful:[theDictionary valueForKey:@"deliveryspeedappraise"]];
    self.name = [self selStringUseful:[theDictionary valueForKey:@"name"]];
    self.photo= [self selStringUseful:[theDictionary valueForKey:@"photo"]];
    self.nick_name= [self selStringUseful:[theDictionary valueForKey:@"nick_name"]];




}
@end
