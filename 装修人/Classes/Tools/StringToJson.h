//
//  StringToJson.h
//  SlideView
//
//  Created by Pengrun on 14-4-3.
//  Copyright (c) 2014年 CQZJT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface StringToJson : NSObject
+ (NSDictionary *)JSONStringDeleteHTML1:(NSData *)getData;

+ (NSDictionary *)JSONString:(NSData *)getData;

+ (NSDictionary *)JSONStringDeleteHTML:(NSData *)getData;
/*!
 * @brief 把格式化的JSON格式的字符串转换成字典
 * @param jsonString JSON格式的字符串
 * @return 返回字典
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

/**
 *  判断string是否为空
 *
 *  @param string 要判断的string
 *
 *  @return bool
 */
+ (BOOL)isBlankString:(NSString *)string;


+ (NSString *)deleteSpaceAndNewline:(NSArray *)getString;

/**
 *  验证用户名强度
 *
 *  @param name String
 *
 *  @return yes or no
 */
+ (BOOL) validateUserName:(NSString *)name;

/**
 *  验证密码强度
 *
 *  @param passWord 密码String
 *
 *  @return YES or NO
 */
+ (BOOL) validatePassword:(NSString *)passWord;

/**
 *  验证手机号码
 *
 *  @param phoneNum string
 *
 *  @return yes or no
 */
+ (BOOL) validatePhoneNum:(NSString *)phoneNum;


/**
 *  验证座机号码
 *
 *  @param phoneNum string
 *
 *  @return yes or no
 */
+ (BOOL) validateTelNum:(NSString *)telNum;

/**
 *  验证重庆座机号码
 *
 *  @param phoneNum string
 *
 *  @return yes or no
 */
+ (BOOL) validateTelCQNum:(NSString *)telNum;

/**
 *  邮箱验证
 *
 *  @param email 传入邮箱string
 *
 *  @return 返回bool
 */
+ (BOOL) validateEmail:(NSString *)email;

/**
 *  字母数字验证
 *
 *  @param email 传入string
 *
 *  @return 返回bool
 */
+ (BOOL) validateNickName:(NSString *)nickName;

/**
 *  数字验证
 *
 *  @param email 传入string
 *
 *  @return 返回bool
 */
+ (BOOL) validateNum:(NSString *)Num;

+ (NSString *) getIPAddress;

+ (NSString *)timestampChange:(NSString *)timestamp;

+ (NSURL *)getDefaultDir;

+ (float)intervalSinceNow:(NSString *)theDate;

+ (UIView *)makeCornerForView:(UIView *)view byRoundingCorners:(UIRectCorner)rectCorner andcornerRadii:(CGSize)size;

+ (void)getViewHigheOfAdaptive:(UIView *)view offsetHeight:(CGFloat)offset;

//从右X算起，向左推算，那么rightx就是相对于左边算起的0的位置，所以X = rightx - 计算出来的自适应宽度
+ (void)getViewWidthOfAdaptive:(UIView *)view offsetWidth:(CGFloat)offset rightX:(CGFloat)rightX;

//从下Y算起，向上推算，那么righty就是相对于底部算起的0的位置，所以y = rightx - 计算出来的自适应宽度
+ (void)getViewHeightOfAdaptive:(UIView *)view offsetHeight:(CGFloat)offset bottomY:(CGFloat)bottomY;

/**
 *  时间date转换string
 *
 *  @param date   传入时间
 *  @param format 时间类型 ：MM月dd日EE MM-dd-EE         EE代表星期
 *
 *  @return 返回时间string
 */
+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)format;


/**
 *  计算多少秒之后的时间date转换string
 *
 *  @param date    传入时间
 *  @param format  MM月dd日EE MM-dd-EE         EE代表星期
 *  @param seconds 多少秒之后
 *
 *  @return 返回时间string
 */
+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)format afterSeconds:(NSTimeInterval)seconds;
/**
 *  英文星期转换中文星期
 *
 *  @param string string格式:MM月dd日EE
 *
 *  @return 返回 MM月dd日星期几
 */
+ (NSString *)changeWeek:(NSString *)string;

/**
 *  获取随机数 包含 to
 *
 *  @param from 开始
 *  @param to   结束
 *
 *  @return int
 */
+ (int)getRandomNumber:(int)from to:(int)to;

/**
 *  获取随机数 包含 to
 *  @param time 动画的时间
 *  @param from 缩放起始大小
 *  @param to   缩放到结束大小
 *
 *  @return int
 */
+(void)viewZoomAnimation:(UIView *)view andTime:(CGFloat)time andMakeScaleFrom:(CGFloat)scale andMakeScaleTo:(CGFloat)scale1;
+ (NSString *)timestampChange:(NSString *)timestamp and:(NSString *)stringDate;
//获取彩色文字
+(NSMutableAttributedString *)getColorTextString:(NSString *)string andStartCode:(int)num1 andEndCode:(int)num2 andColor:(UIColor *)color;

//传入的时间24小时制与现在的时间比较大小；
//返回yes 为传入的时间晚;
//返回no 为传入的时间早;
+(BOOL)timeCompareString:(NSString *)string;

+(NSString *)returnString:(NSString *)string;

//百度地图自带的计算经纬度2点之间的距离--定位的经纬度和传进来的经纬度,
+(NSString *)getLatitudeOrLongitudeDistance:(NSString *)string andString1:(NSString *)string1;

//判断服务器返回的是否是String Yes 为是 no 为不是；
+(BOOL)requestReturnDataString:(id)object;

//检测服务器返回的数据是否有问题
+(NSString *)checkStringReturnRequestDictionary:(NSDictionary *)attributes andKey:(NSString *)key andReplaceString:(NSString *)replaceString;
+(NSString *)checkImageReturnRequestDictionary:(NSDictionary *)attributes andKey:(NSString *)key andReplaceString:(NSString *)replaceString;
+(NSString *)checkTimeReturnRequestDictionary:(NSDictionary *)attributes andKey:(NSString *)key andReplaceString:(NSString *)replaceString;
#pragma mark- 缩放图片
+ (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize;
+ (NSString *)fourStarPhone:(NSString *)string;
@end
