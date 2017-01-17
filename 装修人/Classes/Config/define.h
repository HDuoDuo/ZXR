//
//  define.h
//  giuseppe
//
//  Created by Apple on 15/7/14.
//  Copyright (c) 2015年 GiantUmbrella. All rights reserved.
//

#ifndef giuseppe_define_h
#define giuseppe_define_h


#define UIColorWithRGBA(r,g,b,a)        [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

#define SCREEN_WIDTH_SCALE SCREEN_WIDTH / 375.0
#define SCREEN_HEIGHT_SCALE SCREEN_HEIGHT / 667.0

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

#define UIColorRGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]


#define BACKGROUNDCOLOR [UIColor colorWithRed:239.0/255.0 green:34.0/255.0 blue:109.0/255.0 alpha:1.0]
#define TextColor [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0]

//线条描边
#define GrayLine [UIColor colorWithRed:221.0/255.0 green:221.0/255.0 blue:221.0/255.0 alpha:1.0]

#define DarkGrayLine [UIColor colorWithRed:140.0/255.0 green:140.0/255.0 blue:140.0/255.0 alpha:1.0]
#define ThemeColor [UIColor colorWithRed:238.0/255.0 green:238.0/255.0 blue:238.0/255.0 alpha:1.0]

#define NotNilAndNull(_ref) (((_ref) != nil) && (![(_ref)isEqual:[NSNull null]]))
#define IsNilOrNull(_ref) (((_ref) == nil) || ([_ref] isEqual:[NSNull null]))

#define IsAvailableString(_ref)   (((_ref) != nil) && (![(_ref) isEqual:[NSNull null]]) && ([_ref isKindOfClass:[NSString class]]) && (_ref.length > 0))
#define WS(weakSelf)        __weak __typeof(&*self)weakSelf = self


#define IDXTO 20

/**
 *比例关系 宽
 */
#define  PROPORTION_WIDTH [UIScreen mainScreen].bounds.size.width/760
/**
 *比例关系 高
 */
#define  PROPORTION_HEIGHT [UIScreen mainScreen].bounds.size.height/1340


//宽
#define DesignW 760

#define DesignH  1340

//用户信息宏定义
#define USER_ID [[[NSUserDefaults standardUserDefaults]objectForKey:@"memberid"] intValue]
#define USER_IPHONE [[NSUserDefaults standardUserDefaults]objectForKey:@"mobile"]
#define USER_HEAD [[NSUserDefaults standardUserDefaults]objectForKey:@"head"]
#define USER_NICKNAME [[NSUserDefaults standardUserDefaults]objectForKey:@"nickname"]

#define USER_HOBBY [[NSUserDefaults standardUserDefaults] setObject:nickname forKey:@"hobby"];

#define USER_TYPE [[[NSUserDefaults standardUserDefaults]objectForKey:@"type"]intValue]

#define STATUESCHANGE [[[NSUserDefaults standardUserDefaults]objectForKey:@"status_height"] intValue]

#define AppVersion             [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]

#define ISLOGIN [[[NSUserDefaults standardUserDefaults]objectForKey:@"loginfrom"] intValue]


#define STATUS_HEIGHT [[UIApplication sharedApplication]statusBarFrame].size.height

/** 支付宝信息*/
#define PAYSTYLE_AlipayPartner @"2088421644889648";
#define PAYSTYLE_AlipaySeller @"shbnwl@163.com";
#define PAYSTYLE_AlipayPrivateKey @"MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAL3jiP4W1+KSfobQRz+Tz19FVwZuxjctMUoqtz5VnPWqUT+2wLaLkgH5nHFrjS2Nc/EuTNnqlIZyeJsnTtyRNZ7WneLmehqVoic6/6iZmUTt4I1ipUybwBsjEWVF/MaHlKQ/1RAhSE8ZaNDzxh/cnLy7eKtDPUIKncwwgJwJ40A5AgMBAAECgYEAoRdc6qIad75r1JbxOsB8lohOschcJAcU36SpXBppVAgvcWvqxXJWZZKK47WoSVLNX3g1/lEBu6V1J7sLLheKckK9Kj9Wmow+nbK93vI1BOOA8kNtwKvULUCtxUFA1qEKG6xR7kGY8GePsoMd2+B5gxf7zTPHlMvyZcyUNMVV0nkCQQD7MDRMeycoimIC3piYaKMdup5SvbIMDi+MtwgygldydtCDp1FJOaw3SfCOplmONM1fb+Th4w+ArpMiAv7JRfPTAkEAwYa50zBZKbJAQ2ASWkJdDnmnUpPZBxN7+IGyA83eH+8Dv6b88TOLuG5gj8dA5PwN0N1B0bURnnJQS6gWyQPQQwJALJ8Bi1yNNjxu8MeOH/TmlQ9jtJsSF+YlOEADasWQtzq4C8sbO4DNQP0XiJ+wZPyoRv3fkOj/BgL9DBuwGx0cFQJAexA8XMKzAGPcn7uZEBKBcHIF5+oiqXBHdkirNeYU6UOpo5cB5DP+FoMCHov7hWGPO5FniH5XPOW+j83M53joVwJBALT+yVXO64lNCRuZb649anhoSa7v7JA4Jqi5WsqIPy+8Loy6Itj06sY1s24DFIA29z4VupHi5BUUXblEWCtzjuE=";

#define WXAPPID @"wx3303ab3183bb15e3"
#define WXAPPSWCRET @"e23365c7577a75526c14164e97fa8141"


//微信支付
#define WXAPP_ID   @"wx8155a5d6f7901c0a"  //APPID

#define PAYSTYLE_WXAPP_ID          @"wx8155a5d6f7901c0a"               //APPID
#define PAYSTYLE_WXAPP_SECRET      @"" //appsecret
//商户号，填写商户对应参数
#define PAYSTYLE_WXMCH_ID          @"1296995101"
//商户API密钥，填写相应参数
#define PAYSTYLE_WXPARTNER_ID      @"jiaxingmangzuwenhuachuangyi02015"
//支付结果回调页面

#define PAYSTYLE_WXNOTIFY_URL      @"http://adaa.ketao.com/api/wxpay/notify.php"

//获取服务器端支付数据地址（商户自定义）
#define PAYSTYLE_WXSP_URL          @"http://wxpay.weixin.qq.com/pub_v2/app/app_pay.php"

#define MJDuration 2.0

/**
 *  宏ZXLog
 */
#if DEBUG
#define HGLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define HGLog(FORMAT, ...) nil
#endif

#define MJDuration 2.0

#define kNavbarHeight ((kDeviceVersion>=7.0)? 64 :44 )
#define kIOS7DELTA   ((kDeviceVersion>=7.0)? 20 :0 )
#define kTabBarHeight 49

#define kDeviceVersion [[UIDevice currentDevice].systemVersion floatValue]
//#define WS(weakSelf) __weak __typeof(&*self)weakSelf = self;

/**
 *  RGB颜色
 */
#define RXDColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

/**
 *  随机色
 */
#define RXDRandomColor RXDColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

#define TABBAR_COLOR  RXDColor(20, 22, 23)//tabbar颜色

#define COLOR_LINEANDTEXT  RXDColor(255, 72, 101)//导航栏颜色  tabbar颜色

#define COLOR_BUTTON  RXDColor(180, 0, 0)//各个按钮颜色

#define COLOR_BUTTON_UNSELECTED RXDColor(221, 221,221) //各个按钮颜色 未点亮的时候

#define COLOR_PROMPTTEXT RXDColor(255, 186, 0) //提示文字颜色

#define COLOR_KUANG RXDColor(71, 71, 71)  //一些框的背景颜色 如登录注册


#define NAVI_COLOR  RXDColor(187, 163, 127)//导航栏颜色

#define COLOR_LINGHTGRAY RXDColor(247, 247, 247)//浅灰颜色

/**
 * 每个页面背景的颜色
 */
#define COLOR_EVERYVIEWBG  RXDColor(45, 45, 45)
/**
 *那些横线的颜色
 */
#define COLOR_Line  RXDColor(22, 22, 22)

/**
 *黄色文字的颜色
 */
#define COLOR_TEXT  RXDColor(250, 221, 96)

/**
 *导航栏文字的颜色
 */
#define COLOR_TEXT6  RXDColor(102, 102, 102)

/**
 *字体大小
 */
#define Font_SIZE_14 14

/**
 *字体大小
 */
#define Font_SIZE_18 18
/**
 *  导航栏高度
 */
#define NAVGATIONHEIGHT 64

#define CellMargin 5

#define RXDNAVI_WIDTH 44

#define LEFT_SPACING 30*PROPORTION_WIDTH//距离左侧的间距


#define RECT(x, y, width, height) CGRectMake((x), (y), (width), (height))

#define POINT(x, y) CGPointMake((x), (y))

#define SIZE(width, height) CGSizeMake((width), (height))

#define kScreenSizeHeight                    [[UIScreen mainScreen] bounds].size.height
#define kScreenSizeWidth                     [[UIScreen mainScreen] bounds].size.width
#define kScreenSizeHeight_NoStatusbar        ([[UIScreen mainScreen] bounds].size.height - 20)

//手机型号
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

//UMeng
#define UmengAppkey @""




#endif
