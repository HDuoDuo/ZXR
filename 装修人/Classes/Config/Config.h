//
//  Config.h
//  装修人
//
//  Created by 熊维东 on 2016/11/29.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#ifndef Config_h
#define Config_h

#import <UIKit/UIKit.h>
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "UIImageView+WebCache.h"
#import "UIImageView+AFNetworking.h"
#import "AFHTTPSessionManager.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import <YYModel/YYModel.h>
#import <SDAutoLayout/SDAutoLayout.h>
#import <MJRefresh/MJRefresh.h>



//////////////////////////////工具类
#import "TCTLAlertView.h"
#import "CManager.h"
#import "BaseViewController.h"
#import "BaseNavViewController.h"
#import "UIAlertController+Alert.h"
#import "StringToJson.h"
#import "JHSysAlertUtil.h"
#import "JHSysImgPickerUtil.h"
#import "FontEngine.h"
/////////////////////////////////网络请求


#import "HttpRequest.h"
#import "BGView.h"
#import "BaseModel.h"
//////////////////////////////三方登录


//定义返回请求数据的block类型
typedef void (^ReturnValueBlock) (id returnValue);
typedef void (^ErrorCodeBlock) (id errorCode);
typedef void (^FailureBlock)();
typedef void (^NetWorkBlock)(BOOL netConnetState);


#define KScreenWidth  [[UIScreen mainScreen]bounds].size.width
#define KScreenHeight [[UIScreen mainScreen]bounds].size.height
#define DDWeakSelf __weak __typeof(self) weakSelf = self

//-------------------打印日志-------------------------
//DEBUG  模式下打印日志,当前行
#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif


//判断设备的操做系统是不是ios8
#define IOS8  [[UIDevice currentDevice].systemVersion doubleValue] >= 8.0

//判断当前设备是不是iphone5
#define kScreenIphone5    ((［UIScreen mainScreen] bounds].size.height)>=568)

//获取当前屏幕的高度
#define kMainScreenHeight ([UIScreen mainScreen].applicationFrame.size.height)

//获取当前屏幕的宽度
#define kMainScreenWidth  ([UIScreen mainScreen].applicationFrame.size.width)


//----------------------颜色类---------------------------
// rgb颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//带有RGBA的颜色设置
#define COLOR(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

// 获取RGB颜色
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)

//随机色生成
#define kRandomColor  KRGBColor(arc4random_uniform(256)/255.0,arc4random_uniform(256)/255.0,arc4random_uniform(256)/255.0)
//10->16进制
#define kColorWithHex(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 \
blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]

// View 圆角和加边框
#define ViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

// View 圆角
#define ViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]

//----------------------颜色类--------------------------


#define kNavigationBarHeight 44
#define kStatusBarHeight 20
#define kMarginTopHeight 64
#define kTabBarHeight 49


#define PREFIX_URL @"http://www.zhanqi.tv/api/"//正式
#define HLS_URL @"http://dlhls.cdn.zhanqi.tv/zqlive/"



//---------------------------------首页接 -------------------------------------//
//首页数据请求地址
#define HomeImage_url @"http://192.168.1.123:8080/zxrweb/app"
#define prefixImage_url @"http://file.zx4.cn/%@"

//---------------------------------首页接 -------------------------------------//




//---------------------------------登录注册接 -------------------------------------//
//登录
#define LoginSuccess_Url @"http://192.168.1.52:8080/zxrweb/admin/zxrlogin"

//测试Url
#define Base_Url @"http://192.168.1.220:8080/zxrweb/userapplogin/regUser"

//调用注册短信的接口
#define GetCaptcha_Url  @"http://192.168.1.220:8080/zxrweb/appuser/captcha"

//调用登录短信的接口
#define Login_Url  @"http://192.168.1.220:8080/zxrweb/zxrlogin"

//图形验证码
#define imageCode_Url @"http://192.168.1.52:8080/zxrweb/servlet/validateCodeServlet"

//---------------------------------登录注册接-------------------------------------//


//---------------------------------个人中心接口-------------------------------------//
//个人中心主页
#define  mine_Url @"http://192.168.1.39:8080/zxrweb/userAuthPersonal/queryUserInfo"

//图片前缀
#define img_BaseURL @"http://192.168.1.39:8080/zxrweb/"

//中评好评差评
#define evalute_MangaerUrl @"http://192.168.1.39:8080/zxrweb/userAuthPersonal/queryAppraiseByType"

//查询全部评价
#define evaluteAll_evaluteUrl @"http://192.168.1.39:8080/zxrweb/userAuthPersonal/getAppraises"


//个人认证接口
#define single_CertificateUrl @"http://192.168.1.40:8080/zxrweb/userAuthPersonal/personalInfo"

//企业认证接口Enterprise
#define enterprise_CertificateUrl @"http://192.168.1.40:8080/zxrweb/userAuthPersonal/authBusiness"






//我要开店
 #define openStore_Url @"http://192.168.1.55/rest/v1/serviceProvider/applyShop"

//---------------------------------个人中心接口-------------------------------------



#endif /* Config_h */
