//
//  LHNetworking.h
//  LHNetWorking
//
//  Created by liuhang on 16/11/16.
//  Copyright © 2016年 刘航. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
typedef enum {
    Post = 0,
    Get  = 1
}request;
@interface LHNetworking : NSObject
//请求管理员
@property(nonatomic,strong)AFHTTPSessionManager *manager;
//类方法创建单例对象
+ (LHNetworking *)shareInstance;
//网络请求
- (void)requestWith:(request)requestWay URL:(NSString *)url parameters:(id)parameters progress:(void (^) (NSProgress *))progress success:(void (^)(id))success failure:(void (^)(NSError *))failure;
//取消网络请求
- (void)cancelRquest;
@end
