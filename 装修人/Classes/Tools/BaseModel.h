//
//  BaseModel.h
//  Integration
//
//  Created by zhaoxv on 15/9/2.
//  Copyright (c) 2015年 ioschina. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject

///设置请求下来的数据(子类继承用)
- (void)selSetValue:(NSDictionary *)theDictionary;

/**
 *  有效字符串
 *
 *  @param theValue 参数
 *
 *  @return 字符串(如果传过来的不是字符串则返回为@"")
 */
- (NSString *)selStringUseful:(id)theValue;

 @end
