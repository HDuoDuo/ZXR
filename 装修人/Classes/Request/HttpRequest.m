//
//  HttpRequest.m
//  网络请求1116Demo
//
//  Created by 铅笔 on 15/11/16.
//  Copyright © 2015年 铅笔. All rights reserved.
//

#import "HttpRequest.h"
#import "Config.h"
#import <MobileCoreServices/UTType.h>




@interface HttpRequest ()
@end


@implementation HttpRequest
{
    NSMutableURLRequest *request;
    NSOperationQueue *queue;
    NSURLConnection *_connection;
    NSMutableData *_reveivedData;
}
/**
 *  存放 网络请求的线程
 */
static NSMutableArray *sg_requestTasks;


static HttpRequest * webUtil = nil;

+ (HttpRequest *) shardWebUtil
{
    @synchronized([HttpRequest class])
    {
        if (!webUtil) {
            webUtil = [[[self class] alloc] init];
        }
        return webUtil;
    }
    return nil;
}


#pragma mark - 将某个时间戳转化成 时间

+(NSString *)timestampSwitchTime:(NSInteger)timestamp andFormatter:(NSString *)format{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:format]; // （@"YYYY-MM-dd hh:mm:ss"）----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timestamp];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    
    return confromTimespStr;
    
}

#pragma mark 检测网路状态
+ (void)netWorkStatus{
    
    /**
     *  AFNetworkReachabilityStatusUnknown          = -1,  // 未知
     *  AFNetworkReachabilityStatusNotReachable     = 0,   // 无连接
     *  AFNetworkReachabilityStatusReachableViaWWAN = 1,   // 3G
     *  AFNetworkReachabilityStatusReachableViaWiFi = 2,   // 局域网络Wifi
     */
    // 如果要检测网络状态的变化, 必须要用检测管理器的单例startMoitoring
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    // 检测网络连接的单例,网络变化时的回调方法
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if(status == AFNetworkReachabilityStatusNotReachable){
            //            [UIView showAlertMsg:@"网络连接已断开，请检查您的网络！"];
            
            return ;
        }
    }];
    
}

#pragma mark - AFnetworking manager getter

- (AFHTTPSessionManager *)createAFHTTPSessionManager
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //设置请求参数的类型:HTTP (AFJSONRequestSerializer,AFHTTPRequestSerializer)
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    //设置请求的超时时间
    //  manager.requestSerializer.timeoutInterval = 30.f;
    //设置服务器返回结果的类型:JSON (AFJSONResponseSerializer,AFHTTPResponseSerializer)
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    //@"application/json",
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects: @"text/json", @"text/javascript",@"text/html",@"text/plain",@"application/json", nil];
    
    return manager;
}

/**
 *JSON方式获取数据 GET
 *urlStr:获取数据的url地址
 *
 */
- (void)getNetworkRequestURLString:(NSString *) urlString  andParas:(id) params andTransferGottenData:(transferValue) transfer
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    AFHTTPSessionManager *manager = [self createAFHTTPSessionManager];
    
    [manager GET:urlString parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        transfer(responseObject,nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        transfer(nil,error);
    }];
}

/**
 *JSON方式获取数据 POST
 *urlStr:获取数据的url地址
 *
 */
-(void)postNetworkRequestURLString:(NSString *) urlString  andParas:(id) params andTransferGottenData:(transferValue) transfer
{
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    AFHTTPSessionManager *manager = [self createAFHTTPSessionManager];
    
    [manager POST:urlString parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        transfer(responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        transfer(nil,error);
    }];
}

/**
 *JSON方式获取数据 GET
 *url_path:获取数据的url地址
 *有返回值 类型
 */
- (PPURLSessionTask *)getNetworkRequestURLString:(NSString *)url_path parameters:(id)parameters success:(void (^)(id obj))success fail:(void (^)(NSError *error))fail
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    AFHTTPSessionManager *manager = [self createAFHTTPSessionManager];
    
    PPURLSessionTask *session=nil;
    
    session = [manager GET:url_path parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail(error);
    }];
    
    if (session) {
        [[self allTasks] addObject:session];
    }
    return session;
}

/**
 *JSON方式获取数据 POST
 *url_path:获取数据的url地址
 *有返回值 类型
 */
- (PPURLSessionTask *)postNetworkRequestURLString:(NSString *)url_path parameters:(id)parameters success:(void (^)(id obj))success fail:(void (^)(NSError *error))fail
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    AFHTTPSessionManager *manager = [self createAFHTTPSessionManager];
    
    NSMutableDictionary *dic = [parameters mutableCopy];
    //
    //    NSUserDefaults *userdf =   [NSUserDefaults standardUserDefaults];
    //    NSString *akey = [userdf valueForKey:authkey];
    //    if (akey) {
    //
    //        [dic setValue:akey forKey:@"authkey"];
    //
    //
    //    }else{
    //
    //    }
    //
    
    NSLog(@"*********************参数列表******************************");
    NSLog(@"接口：%@ ----------------------参数列表：%@",url_path,dic);
    NSLog(@"****************************************************");
   
    PPURLSessionTask *session=nil;
    
    session = [manager POST:url_path parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSString *jsonString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        NSLog(@"jsonString ====== %@",jsonString);
      
        NSDictionary *jsondic =    [StringToJson JSONString:responseObject];
        success(jsondic);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail(error);
    }];
    
    if (session) {
        [[self allTasks] addObject:session];
    }
    
    return session;
}

- (NSMutableArray *)allTasks {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (sg_requestTasks == nil) {
            sg_requestTasks = [[NSMutableArray alloc] init];
        }
    });
    
    return sg_requestTasks;
}

- (void)cancelRequestWithURL:(NSString *)url {
    
    if (url == nil) {
        return;
    }
    
    @synchronized(self) {
        [[self allTasks] enumerateObjectsUsingBlock:^(PPURLSessionTask * _Nonnull task, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([task isKindOfClass:[PPURLSessionTask class]]
                && [task.currentRequest.URL.absoluteString hasSuffix:url]) {
                [task cancel];
                [[self allTasks] removeObject:task];
                return;
            }
        }];
    };
}

- (void)cancelAllRequest {
    @synchronized(self) {
        [[self allTasks] enumerateObjectsUsingBlock:^(PPURLSessionTask * _Nonnull task, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([task isKindOfClass:[PPURLSessionTask class]]) {
                [task cancel];
            }
        }];
        
        [[self allTasks] removeAllObjects];
    };
}

/**
 *  上传图片
 *
 *  @param url        请求url
 *  @param image      要上传的文件流
 *  @param completion 文件上传成功的回调
 *  @param errorBlock 文件上传失败的回调
 *
 *  @return 请求体
 */
- (PPURLSessionTask *)uploadImageWithUrl:(NSString *)url
                              WithParams:(NSDictionary*)params
                                   image:(NSData *)imageData
                                filename:(NSString *)name
                                mimeType:(NSString *)mimetype
                              completion:(requestSuccessBlock)completion
                              errorBlock:(requestFailureBlock)errorBlock
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    AFHTTPSessionManager *manager = [self createAFHTTPSessionManager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    PPURLSessionTask *operation = [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString *str = [formatter stringFromDate:[NSDate date]];
        NSString *fileName = [NSString stringWithFormat:@"%@.png",str];
        
        // 上传图片，以文件流的格式
        [formData appendPartWithFileData:imageData name:name fileName:fileName mimeType:mimetype];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        
        NSDictionary *dic = [StringToJson JSONString:responseObject];
        
        completion(dic);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
    return operation;
}

/**
 *  上传音视频文件
 *
 *  @param url        请求url
 *  @param image      要上传的文件流
 *  @param completion 文件上传成功的回调
 *  @param errorBlock 文件上传失败的回调
 *
 *  @return 请求体
 */
- (PPURLSessionTask *)uploadVedioWithUrl:(NSString *)url
                              WithParams:(NSDictionary*)params
                                   image:(NSData *)vedioData
                                filename:(NSString *)name
                                mimeType:(NSString *)mimetype
                              completion:(requestSuccessBlock)completion
                              errorBlock:(requestFailureBlock)errorBlock
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    AFHTTPSessionManager *manager = [self createAFHTTPSessionManager];
    
    PPURLSessionTask *operation = [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString *str = [formatter stringFromDate:[NSDate date]];
        NSString *fileName = [NSString stringWithFormat:@"%@.mp4",str];
        [formData appendPartWithFileData:vedioData name:name fileName:fileName mimeType:mimetype];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completion(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
    
    return operation;
}


+ (NSString *)md5:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}


/**
 *  将普通字符串转换成base64字符串
 *
 *  @param text 普通字符串
 *
 *  @return base64字符串
 */
+ (NSString *)base64StringFromText:(NSString *)text {
    
    NSData *data = [text dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64String = [data base64EncodedStringWithOptions:0];
    
    return base64String;
}
/**
 *  将base64字符串转换成普通字符串
 *
 *  @param base64 base64字符串
 *
 *  @return 普通字符串
 */
+ (NSString *)textFromBase64String:(NSString *)base64 {
    
    NSData *data = [[NSData alloc] initWithBase64EncodedString:base64 options:0];
    NSString *text = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    return text;
}




-(void)uploadFileWithURL:(NSString *)urlString params:(NSDictionary *)params fileKey:(NSString *)fileKey filePath:(NSString *)filePath completeHander:(void (^)(NSURLResponse *, NSData *, NSError *))completeHander{
    
    NSURL *URL = [[NSURL alloc]initWithString:urlString];
    request = [[NSMutableURLRequest alloc]initWithURL:URL cachePolicy:(NSURLRequestUseProtocolCachePolicy) timeoutInterval:30];
    NSString *boundary = @"wfWiEWrgEFA9A78512weF7106A";
    
    NSData *fileData = [NSData dataWithContentsOfFile:filePath];
    
    request.HTTPMethod = @"POST";
    request.allHTTPHeaderFields = @{
                                    @"Content-Type":[NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary]
                                    };
    
    //multipart/form-data格式按照构建上传数据
    NSMutableData *postData = [[NSMutableData alloc]init];
    for (NSString *key in params) {
        NSString *pair = [NSString stringWithFormat:@"--%@\r\nContent-Disposition: form-data; name=\"%@\"\r\n\r\n",boundary,key];
        [postData appendData:[pair dataUsingEncoding:NSUTF8StringEncoding]];
        
        id value = [params objectForKey:key];
        if ([value isKindOfClass:[NSString class]]) {
            [postData appendData:[value dataUsingEncoding:NSUTF8StringEncoding]];
        }else if ([value isKindOfClass:[NSData class]]){
            [postData appendData:value];
        }
        [postData appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    }
    
    //文件部分
    NSString *filename = [filePath lastPathComponent];
    NSString *contentType = AFContentTypeForPathExtension([filePath pathExtension]);
    
    NSString *filePair = [NSString stringWithFormat:@"--%@\r\nContent-Disposition: form-data; name=\"%@\"; filename=\"%@\";Content-Type=%@\r\n\r\n",boundary,fileKey,filename,contentType];
    [postData appendData:[filePair dataUsingEncoding:NSUTF8StringEncoding]];
    
    //[postData appendData:[@"测试文件数据" dataUsingEncoding:NSUTF8StringEncoding]];
    [postData appendData:fileData]; //加入文件的数据
    
    [postData appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    request.HTTPBody = postData;
    [request setValue:[NSString stringWithFormat:@"%lu",(unsigned long)postData.length] forHTTPHeaderField:@"Content-Length"];
    
    _connection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
    [_connection start];
}

#pragma mark - connection delegate

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    NSLog(@"reveive Response:\n%@",response);
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    if (!_reveivedData) {
        _reveivedData = [[NSMutableData alloc]init];
    }
    
    [_reveivedData appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSLog(@"received Data:\n%@",[[NSString alloc] initWithData:_reveivedData encoding:NSUTF8StringEncoding]);
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"fail connect:\n%@",error);
}


static inline NSString * AFContentTypeForPathExtension(NSString *extension) {
#ifdef __UTTYPE__
    NSString *UTI = (__bridge_transfer NSString *)UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, (__bridge CFStringRef)extension, NULL);
    NSString *contentType = (__bridge_transfer NSString *)UTTypeCopyPreferredTagWithClass((__bridge CFStringRef)UTI, kUTTagClassMIMEType);
    if (!contentType) {
        return @"application/octet-stream";
    } else {
        return contentType;
    }
#else
#pragma unused (extension)
    return @"application/octet-stream";
#endif
}

@end
