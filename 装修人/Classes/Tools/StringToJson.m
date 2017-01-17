//
//  StringToJson.m
//  SlideView
//
//  Created by Pengrun on 14-4-3.
//  Copyright (c) 2014年 CQZJT. All rights reserved.
//

#import "StringToJson.h"
#import <ifaddrs.h>
#import <arpa/inet.h>
//#import "BMapKit.h"

@implementation StringToJson


+ (NSDictionary *)JSONString:(NSData *)getData {
    NSString *string =  [[NSString alloc] initWithData:getData encoding:NSUTF8StringEncoding];
    // [encodeUrl stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]
    //NSString *string1 = kSJDecodeUrl(string);
    //    NSMutableString *string2 = [[NSMutableString alloc] initWithString:string1];
    ////    [string2 insertString:@"\n" atIndex:7];
    //    NSMutableString *mutableString = [[NSMutableString alloc] initWithFormat:@"[%@]",string1];
    string = [string stringByReplacingOccurrencesOfString:@"s-[" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"]-e" withString:@""];
    NSScanner *theScanner;
    NSString *text = nil;
    
    theScanner = [NSScanner scannerWithString:string];
    
//    while ([theScanner isAtEnd] == NO) {
//        
//        // find start of tag
//        [theScanner scanUpToString:@"<" intoString:NULL] ;
//        
//        // find end of tag
//        [theScanner scanUpToString:@">" intoString:&text] ;
//        
//        // replace the found tag with a space
//        //(you can filter multi-spaces out later if you wish)
//        string = [string stringByReplacingOccurrencesOfString:
//                  [ NSString stringWithFormat:@"%@>", text]
//                                                   withString:@" "];
//        
//    } // while //
    NSMutableString *s = [NSMutableString stringWithString:string];
  //  [s replaceOccurrencesOfString:@" " withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    
    [s replaceOccurrencesOfString:@"\\r" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\t" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\\t" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\\\\n" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\\n" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"+" withString:@" " options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
  //  [s replaceOccurrencesOfString:@"<" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    
    
    [s replaceOccurrencesOfString:@"--" withString:@"\\n\\t" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"-*" withString:@"\\n\\t" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    
    
    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:[s dataUsingEncoding:NSUTF8StringEncoding] options:0 error:NULL];
    
    return dic;
}

+ (NSDictionary *)JSONStringDeleteHTML:(NSData *)getData {
    NSString *string =  [[NSString alloc] initWithData:getData encoding:NSUTF8StringEncoding];
  
    NSString *string1 = [string stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

    //    NSMutableString *string2 = [[NSMutableString alloc] initWithString:string1];
    ////    [string2 insertString:@"\n" atIndex:7];
    //    NSMutableString *mutableString = [[NSMutableString alloc] initWithFormat:@"[%@]",string1];
    NSScanner *theScanner;
    NSString *text = nil;
    
    NSMutableString *s = [NSMutableString stringWithString:string1];
    //    [s replaceOccurrencesOfString:@"<p>" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    //    [s replaceOccurrencesOfString:@"</p>" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    // [s replaceOccurrencesOfString:@"<br+/>" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\"+alt=""+/>" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    
    theScanner = [NSScanner scannerWithString:s];
    
    while ([theScanner isAtEnd] == NO) {
        
        // find start of tag
        [theScanner scanUpToString:@"<" intoString:NULL] ;
        
        // find end of tag
        [theScanner scanUpToString:@">" intoString:&text] ;
        
        // replace the found tag with a space
        //(you can filter multi-spaces out later if you wish)
        //        string1 = [string1 stringByReplacingOccurrencesOfString:
        //                   [ NSString stringWithFormat:@"%@>", text]
        //                                                     withString:@" "];
        
    } // while //
    
    
    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:[s dataUsingEncoding:NSUTF8StringEncoding] options:0 error:NULL];
    
    return dic;
}

+ (NSDictionary *)JSONStringDeleteHTML1:(NSData *)getData {
    NSString *string =  [[NSString alloc] initWithData:getData encoding:NSUTF8StringEncoding];
    //    NSString *string1 = kSJDecodeUrl(string);
    //    NSMutableString *string2 = [[NSMutableString alloc] initWithString:string1];
    ////    [string2 insertString:@"\n" atIndex:7];
    //    NSMutableString *mutableString = [[NSMutableString alloc] initWithFormat:@"[%@]",string1];
//    NSScanner *theScanner;
//    NSString *text = nil;
//    
//    NSMutableString *s = [NSMutableString stringWithString:string1];
//    //    [s replaceOccurrencesOfString:@"<p>" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
//    //    [s replaceOccurrencesOfString:@"</p>" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
//    // [s replaceOccurrencesOfString:@"<br+/>" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
//    [s replaceOccurrencesOfString:@"\"+alt=""+/>" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
//    
//    theScanner = [NSScanner scannerWithString:s];
//    
//    while ([theScanner isAtEnd] == NO) {
//        
//        // find start of tag
//        [theScanner scanUpToString:@"<" intoString:NULL] ;
//        
//        // find end of tag
//        [theScanner scanUpToString:@">" intoString:&text] ;
//        
//        // replace the found tag with a space
//        //(you can filter multi-spaces out later if you wish)
//        //        string1 = [string1 stringByReplacingOccurrencesOfString:
//        //                   [ NSString stringWithFormat:@"%@>", text]
//        //                                                     withString:@" "];
//        
//    } // while //
    
    
    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:[string dataUsingEncoding:NSUTF8StringEncoding] options:0 error:NULL];
    
    return dic;
}




/*!
 * @brief 把格式化的JSON格式的字符串转换成字典
 * @param jsonString JSON格式的字符串
 * @return 返回字典
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

+ (BOOL)isBlankString:(NSString *)string
{
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}

+ (NSString *)deleteSpaceAndNewline:(NSString *)getString
{
    NSLog(@"getString:%@",getString);
    NSMutableString *s = [NSMutableString stringWithString:getString];
    [s replaceOccurrencesOfString:@"\n" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\t" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    NSLog(@"s:%@",s);
    return [NSString stringWithString:s];
}

#pragma -mark 用户名验证
+ (BOOL) validateUserName:(NSString *)name
{
    NSString *userNameRegex = @"^[A-Za-z0-9]{6,20}+$";
    NSPredicate *userNamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",userNameRegex];
    BOOL B = [userNamePredicate evaluateWithObject:name];
    NSLog(@"%d",B);
    return B;
}

+ (BOOL)validateNickName:(NSString *)nickName
{
    NSString *nickNameRegex = @"[a-zA-Z\u4e00-\u9fa5][a-zA-Z0-9\u4e00-\u9fa5]+";
    NSPredicate *nickNamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nickNameRegex];
    BOOL B = [nickNamePredicate evaluateWithObject:nickName];
    return B;
}

#pragma -mark 验证密码强度
+ (BOOL) validatePassword:(NSString *)passWord
{
    NSString * regex = @"^\\d{6,10}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:passWord];
    NSLog(@"isMatch:%d",isMatch);
    return isMatch;
}

#pragma -mark 手机验证
+ (BOOL) validatePhoneNum:(NSString *)phoneNum
{
    /**
     * http://baike.baidu.com/link?url=fZSe2m-f6RcTIYQHB7OVq_BHg7WIpBIGJx6GPW0JFOJdzkGXA9fEoAhQmWKTrjca
     * 手机号码
     *---------------------
     * 移动：134[0-8],135,136,137,138,139,150,151,152,158,159,182,183,184,157,187,188,147,178
     * 2G号段（GSM网络）有134[0-8]、135、136、137、138、139、150、151、152、158、159、182、183、184。
     * 3G号段（TD-SCDMA网络）有157、187、188
     * 3G上网卡 147
     * 4G号段 178
     *---------------------
     * 联通：130,131,132,155,156,145,185,186,176
     * 2G号段（GSM网络）130、131、132、155、156
     * 3G上网卡145
     * 3G号段（WCDMA网络）185、186
     * 4G号段 176
     *---------------------
     * 电信：133,153,180,181,189,177
     * 2G/3G号段（CDMA2000网络）133、153、180、181、189
     * 4G号段 177
     */
    
    
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[0-9])\\d{8}$";
    /**
     * 中国移动：China Mobile
     * 134[0-8],135,136,137,138,139,147,150,151,152,157,158,159,178,182,183,184,187,188
     */
    NSString * CM = @"^1(34[0-8]|47[0-9]|78[0-9]|(3[5-9]|5[0127-9]|8[2-478])\\d)\\d{7}$";
    /**
     * 中国联通：China Unicom
     * 130,131,132,145,155,156,176,185,186
     */
    NSString * CU = @"^1(3[0-2]|45|5[56]|7[6]|8[56])\\d{8}$";
    /**
     * 中国电信：China Telecom
     * 133,1349,153,180,181,189,177
     */
    NSString * CT = @"^1((33|53|77|8[019])[0-9]|349)\\d{7}$";
    
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    BOOL res1 = [regextestmobile evaluateWithObject:phoneNum];
    BOOL res2 = [regextestcm evaluateWithObject:phoneNum];
    BOOL res3 = [regextestcu evaluateWithObject:phoneNum];
    BOOL res4 = [regextestct evaluateWithObject:phoneNum];
    
    if (res1 || res2 || res3 || res4 )
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

+ (BOOL) validateTelNum:(NSString *)telNum
{
    /**
     * 大陆地区固话及小灵通
     * 区号：010,020,021,022,023,024,025,027,028,029
     * 号码：七位或八位
     */
    
    NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    NSString * PHS1 = @"^0(10|2[0-5789]|\\d{3}-)\\d{7,8}$";
    
    NSPredicate *regextestphs = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS];
    NSPredicate *regextestphs1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS1];
    
    if (([regextestphs evaluateWithObject:telNum] == YES) || ([regextestphs1 evaluateWithObject:telNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

+ (BOOL) validateTelCQNum:(NSString *)telNum
{
    /**
     * http://baike.baidu.com/link?url=fZSe2m-f6RcTIYQHB7OVq_BHg7WIpBIGJx6GPW0JFOJdzkGXA9fEoAhQmWKTrjca
     * 手机号码
     *---------------------
     * 移动：134[0-8],135,136,137,138,139,150,151,152,158,159,182,183,184,157,187,188,147,178
     * 2G号段（GSM网络）有134[0-8]、135、136、137、138、139、150、151、152、158、159、182、183、184。
     * 3G号段（TD-SCDMA网络）有157、187、188
     * 3G上网卡 147
     * 4G号段 178
     *---------------------
     * 联通：130,131,132,155,156,145,185,186,176
     * 2G号段（GSM网络）130、131、132、155、156
     * 3G上网卡145
     * 3G号段（WCDMA网络）185、186
     * 4G号段 176
     *---------------------
     * 电信：133,153,180,181,189,177
     * 2G/3G号段（CDMA2000网络）133、153、180、181、189
     * 4G号段 177
     
     *
     * 重庆地区固话
     * 区号：023
     * 号码：八位
     */
    
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[0-9])\\d{8}$";
    /**
     * 中国移动：China Mobile
     * 134[0-8],135,136,137,138,139,147,150,151,152,157,158,159,178,182,183,184,187,188
     */
    NSString * CM = @"^1(34[0-8]|47[0-9]|78[0-9]|(3[5-9]|5[0127-9]|8[2-478])\\d)\\d{7}$";
    /**
     * 中国联通：China Unicom
     * 130,131,132,145,155,156,176,185,186
     */
    NSString * CU = @"^1(3[0-2]|45|5[56]|7[6]|8[56])\\d{8}$";
    /**
     * 中国电信：China Telecom
     * 133,1349,153,180,181,189,177
     */
    NSString * CT = @"^1((33|53|177|8[019])[0-9]|349)\\d{7}$";
    
    NSString * PHS = @"^0(10|23|\\d{3})\\d{8}$";
    NSString * PHS1 = @"^0(10|23|\\d{3}-)\\d{8}$";
    NSString * PHS2 = @"[0-9]{8}";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    NSPredicate *regextestphs = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS];
    NSPredicate *regextestphs1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS1];
    NSPredicate *regextestphs2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS2];
    BOOL res1 = [regextestmobile evaluateWithObject:telNum];
    BOOL res2 = [regextestcm evaluateWithObject:telNum];
    BOOL res3 = [regextestcu evaluateWithObject:telNum];
    BOOL res4 = [regextestct evaluateWithObject:telNum];
    BOOL res5 = [regextestphs evaluateWithObject:telNum];
    BOOL res6 = [regextestphs1 evaluateWithObject:telNum];
    BOOL res7 = [regextestphs2 evaluateWithObject:telNum];
    if (res1 || res2 || res3 || res4 || res5 || res6 || res7)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

#pragma -mark 邮箱验证
+ (BOOL)validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

+ (BOOL) validateNum:(NSString *)Num
{
    NSString *nickNameRegex = @"[0-9]+";
    NSPredicate *numPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nickNameRegex];
    BOOL B = [numPredicate evaluateWithObject:Num];
    return B;
}


// Get IP Address
+ (NSString *) getIPAddress {
    NSString *address = @"error";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    // retrieve the current interfaces - returns 0 on success
    success = getifaddrs(&interfaces);
    if (success == 0) {
        // Loop through linked list of interfaces
        temp_addr = interfaces;
        while(temp_addr != NULL) {
            if(temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    // Free memory
    freeifaddrs(interfaces);
    return address;
}

#pragma -mark 时间戳
+ (NSString *)timestampChange:(NSString *)timestamp
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY.MM.dd HH:mm:ss"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    //设置时区,这个对于时间的处理有时很重要
    //例如你在国内发布信息,用户在国外的另一个时区,你想让用户看到正确的发布时间就得注意时区设置,时间的换算.
    //例如你发布的时间为2010-01-26 17:40:50,那么在英国爱尔兰那边用户看到的时间应该是多少呢?
    //他们与我们有7个小时的时差,所以他们那还没到这个时间呢...那就是把未来的事做了
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Chongqing"];
    [formatter setTimeZone:timeZone];
    
    
    NSMutableString *a = [[NSMutableString alloc] initWithString:timestamp];
    [a deleteCharactersInRange:NSMakeRange(10,3)];
    
    //时间戳转时间的方法
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[a intValue]];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    NSLog(@"confromTimespStr =  %@",confromTimespStr);
    return confromTimespStr;
}

#pragma -mark 一个时间和当前时间差值
+ (float)intervalSinceNow: (NSString *)theDate
{
    NSArray *timeArray = [theDate componentsSeparatedByString:@"."];
    theDate = [timeArray objectAtIndex:0];
    
    NSDateFormatter *date = [[NSDateFormatter alloc] init];
    [date setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *d = [date dateFromString:theDate];
    
    NSTimeInterval early = [d timeIntervalSince1970] * 1;
    
    //    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    //    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    //    self.createDataTime = [formatter stringFromDate:[NSDate date]];
    
    NSDate *dat = [NSDate date];
    NSTimeInterval now = [dat timeIntervalSince1970] * 1;
    float timeString = 0.f;
    
    NSTimeInterval cha = now - early;
    timeString = cha/86400;
    //    if (cha/3600<1) {
    //        timeString = [NSString stringWithFormat:@"%f", cha/60];
    //        timeString = [timeString substringToIndex:timeString.length-7];
    //        timeString=[NSString stringWithFormat:@"剩余%@分", timeString];
    //
    //    }
    //    if (cha/3600>1&&cha/86400<1) {
    //        timeString = [NSString stringWithFormat:@"%f", cha/3600];
    //        timeString = [timeString substringToIndex:timeString.length-7];
    //        timeString=[NSString stringWithFormat:@"剩余%@小时", timeString];
    //    }
    //    if (cha/86400>1)
    //    {
    //        timeString = [NSString stringWithFormat:@"%f", cha/86400];
    //        timeString = [timeString substringToIndex:timeString.length-7];
    //        timeString=[NSString stringWithFormat:@"剩余%@天", timeString];
    //
    //    }
    return timeString;
}

+ (UIView *)makeCornerForView:(UIView *)view byRoundingCorners:(UIRectCorner)rectCorner andcornerRadii:(CGSize)size
{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:rectCorner cornerRadii:size];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = view.bounds;
    maskLayer.path = maskPath.CGPath;
    view.layer.mask = maskLayer;
    return view;
}
//计算view得高度
+ (void)getViewHigheOfAdaptive:(UIView *)view offsetHeight:(CGFloat)offset
{
    if ([view isKindOfClass:[UILabel class]]) {
        UILabel *viewLabel=(UILabel *)view;
        viewLabel.numberOfLines=0;
        NSDictionary *attributes = [NSDictionary dictionaryWithObject:viewLabel.font forKey:NSFontAttributeName];
        CGRect rect = [viewLabel.text boundingRectWithSize:CGSizeMake(viewLabel.frame.size.width, MAXFLOAT)
                                                   options:NSStringDrawingUsesLineFragmentOrigin
                                                attributes:attributes
                                                   context:nil];
        [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y - offset, view.frame.size.width, rect.size.height + offset)];
    }else if ([view isKindOfClass:[UITextView class]]){
        UITextView *viewLabel=(UITextView *)view;
        viewLabel.userInteractionEnabled=NO;
        viewLabel.editable=NO;
        viewLabel.contentInset = UIEdgeInsetsMake(-8, 0, 0, 0);
        NSDictionary *attributes = [NSDictionary dictionaryWithObject:viewLabel.font forKey:NSFontAttributeName];
        CGRect rect = [viewLabel.text boundingRectWithSize:CGSizeMake(viewLabel.frame.size.width, MAXFLOAT)
                                                   options:NSStringDrawingUsesLineFragmentOrigin
                                                attributes:attributes
                                                   context:nil];
        [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y - offset, view.frame.size.width, rect.size.height + offset)];
    }
}

//计算view得宽度
+ (void)getViewWidthOfAdaptive:(UIView *)view offsetWidth:(CGFloat)offset rightX:(CGFloat)rightX
{
    if ([view isKindOfClass:[UILabel class]]) {
        UILabel *viewLabel=(UILabel *)view;
        viewLabel.numberOfLines=0;
        viewLabel.textAlignment = NSTextAlignmentLeft;
        NSDictionary *attributes = [NSDictionary dictionaryWithObject:viewLabel.font forKey:NSFontAttributeName];
        CGRect rect = [viewLabel.text boundingRectWithSize:CGSizeMake(MAXFLOAT, viewLabel.frame.size.height)
                                                   options:NSStringDrawingUsesLineFragmentOrigin
                                                attributes:attributes
                                                   context:nil];
        CGFloat width = (rect.size.width + offset);
        [view setFrame:CGRectMake(rightX - width, view.frame.origin.y, width, view.frame.size.height)];
    }
    else if ([view isKindOfClass:[UITextView class]])
    {
        UITextView *viewLabel=(UITextView *)view;
        viewLabel.userInteractionEnabled=NO;
        viewLabel.editable=NO;
        viewLabel.contentInset = UIEdgeInsetsMake(-8, 0, 0, 0);
        NSDictionary *attributes = [NSDictionary dictionaryWithObject:viewLabel.font forKey:NSFontAttributeName];
        CGRect rect = [viewLabel.text boundingRectWithSize:CGSizeMake(viewLabel.frame.size.width, MAXFLOAT)
                                                   options:NSStringDrawingUsesLineFragmentOrigin
                                                attributes:attributes
                                                   context:nil];
        [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, rect.size.height)];
    }
    
}
+ (void)getViewHeightOfAdaptive:(UIView *)view offsetHeight:(CGFloat)offset bottomY:(CGFloat)bottomY
{
    if ([view isKindOfClass:[UILabel class]]) {
        UILabel *viewLabel=(UILabel *)view;
        viewLabel.numberOfLines=0;
        viewLabel.textAlignment = NSTextAlignmentLeft;
        NSDictionary *attributes = [NSDictionary dictionaryWithObject:viewLabel.font forKey:NSFontAttributeName];
        CGRect rect = [viewLabel.text boundingRectWithSize:CGSizeMake(MAXFLOAT, viewLabel.frame.size.height)
                                                   options:NSStringDrawingUsesLineFragmentOrigin
                                                attributes:attributes
                                                   context:nil];
        CGFloat height = MAX((rect.size.height + offset), bottomY);
        [view setFrame:CGRectMake(view.frame.origin.x, height, view.frame.size.width, height)];
    }
    else if ([view isKindOfClass:[UITextView class]])
    {
        UITextView *viewLabel=(UITextView *)view;
        viewLabel.userInteractionEnabled=NO;
        viewLabel.editable=NO;
        viewLabel.contentInset = UIEdgeInsetsMake(-8, 0, 0, 0);
        NSDictionary *attributes = [NSDictionary dictionaryWithObject:viewLabel.font forKey:NSFontAttributeName];
        CGRect rect = [viewLabel.text boundingRectWithSize:CGSizeMake(viewLabel.frame.size.width, MAXFLOAT)
                                                   options:NSStringDrawingUsesLineFragmentOrigin
                                                attributes:attributes
                                                   context:nil];
        [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, rect.size.height)];
    }
}

+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)format
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    [formatter setLocale:locale];
    [formatter setDateFormat:format];
    return [formatter stringFromDate:date];
}

+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)format afterSeconds:(NSTimeInterval)seconds
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    [formatter setLocale:locale];
    [formatter setDateFormat:format];
    
    NSDate *changeDate = [NSDate dateWithTimeIntervalSinceNow:seconds];
    NSString *changeDateString = [formatter stringFromDate:changeDate];
    return changeDateString;
}

+ (NSString *)changeWeek:(NSString *)string
{
    NSMutableString *s = [NSMutableString stringWithString:string];
    [s replaceOccurrencesOfString:@"Mon" withString:@"星期一" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"Tue" withString:@"星期二" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"Wed" withString:@"星期三" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"Thu" withString:@"星期四" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"Fri" withString:@"星期五" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"Sat" withString:@"星期六" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"Sun" withString:@"星期日" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    
    return s;
}

+ (int)getRandomNumber:(int)from to:(int)to
{
    return (int)(from + (arc4random() % (to - from + 1)));
}

+(void)viewZoomAnimation:(UIView *)view andTime:(CGFloat)time andMakeScaleFrom:(CGFloat)scale andMakeScaleTo:(CGFloat)scale1{
    view.transform = CGAffineTransformMakeScale(scale, scale);//将要显示的view按照正常比例显示出来
    [UIView beginAnimations:nil context:UIGraphicsGetCurrentContext()];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];  //InOut 表示进入和出去时都启动动画
    [UIView setAnimationDuration:time];//动画时间
    view.transform = CGAffineTransformMakeScale(scale1, scale1);//先让要显示的view最小直至消失
    [UIView commitAnimations]; //启动动画
    //相反如果想要从小到大的显示效果，则将比例调换
}
+ (NSString *)timestampChange:(NSString *)timestamp and:(NSString *)stringDate{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:stringDate]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    //设置时区,这个对于时间的处理有时很重要
    //例如你在国内发布信息,用户在国外的另一个时区,你想让用户看到正确的发布时间就得注意时区设置,时间的换算.
    //例如你发布的时间为2010-01-26 17:40:50,那么在英国爱尔兰那边用户看到的时间应该是多少呢?
    //他们与我们有7个小时的时差,所以他们那还没到这个时间呢...那就是把未来的事做了
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Chongqing"];
    [formatter setTimeZone:timeZone];
    
    
    NSMutableString *a = [[NSMutableString alloc] initWithString:timestamp];
    [a deleteCharactersInRange:NSMakeRange(10,3)];
    
    //时间戳转时间的方法
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[a intValue]];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    //    NSLog(@"confromTimespStr =  %@",confromTimespStr);
    return confromTimespStr;
    
}
+(NSMutableAttributedString *)getColorTextString:(NSString *)string andStartCode:(int)num1 andEndCode:(int)num2 andColor:(UIColor *)color{
    
    NSMutableAttributedString *priceString = [[NSMutableAttributedString alloc] initWithString:string];
    [priceString addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(num1,num2)];
    
    //    if (true1) {
    //        [priceString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:size] range:NSMakeRange(StartsizeCode,endsizeCode)];
    //    }
    
    //    [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:30.0] range:NSMakeRange(6, 12)];
    //    [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Courier-BoldOblique" size:30.0] range:NSMakeRange(19, 6)];
    return priceString;
    
}
+(BOOL)timeCompareString:(NSString *)string{
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateTime=[formatter stringFromDate:[NSDate date]];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [dateFormatter dateFromString:[NSString stringWithFormat:@"%@ %@",dateTime,string]];////过期时间
    NSDateFormatter *formatter1=[[NSDateFormatter alloc]init];
    [formatter1 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateTime1=[formatter1 stringFromDate:[NSDate date]];
    NSDate *t1=[formatter1 dateFromString:dateTime1];//现在的时间
    NSDate *t=[date earlierDate:t1];//比较早的时间
    NSLog(@"过期时间:%@",[dateFormatter stringFromDate:t]);
    
    if ([[dateFormatter stringFromDate:t] isEqualToString:[dateFormatter stringFromDate:date]]) {
        return NO;//过期
    }else{
        return YES;
    }
}
+(NSString *)returnString:(NSString *)string{
    
    NSRange range = [string rangeOfString:@"2015"];//匹配得到的下标
    if (range.length==0) {
        range = [string rangeOfString:@"2016"];
    }
    NSRange range1=NSMakeRange(0, range.location);
    string = [string substringWithRange:range1];//截取范围类的字符串
    return string;
}
//+(NSString *)getLatitudeOrLongitudeDistance:(NSString *)string andString1:(NSString *)string1{
//    
//    BMKMapPoint point1 = BMKMapPointForCoordinate([DataStore shareStore].userCoordinate);
//    BMKMapPoint point2 = BMKMapPointForCoordinate(CLLocationCoordinate2DMake(string.doubleValue,string1.doubleValue));
//    CLLocationDistance distance = BMKMetersBetweenMapPoints(point1,point2);
//    ;
//    return [NSString stringWithFormat:@"%f",distance];
//}
+(BOOL)requestReturnDataString:(id)object{
    if ([object isKindOfClass:[NSString class]]) {
        return YES;
    }else if([object isKindOfClass:[NSNumber class]]){
        return YES;
    }else if([object isKindOfClass:[NSNull class]]){
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"建议服务器修改返回值，值不能返回NSull类型" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        //[alert show];
        return NO;
    }else{
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"建议服务器修改返回值，值的类型不明确" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        // [alert show];
        return NO;
    }
}
+(NSString *)checkStringReturnRequestDictionary:(NSDictionary *)attributes andKey:(NSString *)key andReplaceString:(NSString *)replaceString{
    NSString *selfString=@"";
    if ([[attributes allKeys] containsObject:key]) {
        
        id object=[attributes valueForKey:key];
        
        if ([StringToJson requestReturnDataString:object]) {
            
            selfString =[NSString stringWithFormat:@"%@",object];
            
        }else{
            selfString=replaceString;
        }
    }else{
        NSLog(@"服务器没有返回%@",key);
        selfString =replaceString;
    }
    return selfString;
    
}
+(NSString *)checkImageReturnRequestDictionary:(NSDictionary *)attributes andKey:(NSString *)key andReplaceString:(NSString *)replaceString{
    NSString *selfString=@"";
    if ([[attributes allKeys] containsObject:key]) {
        
        id object=[attributes valueForKey:key];
        
        if ([StringToJson requestReturnDataString:object]) {
            
            NSString *string=@"http://www.tcv7.com:8090/";
//            NSString *string=@"http://121.41.117.121:8180/group_sell/view/";
            
            selfString =[NSString stringWithFormat:@"%@",object];
            
            selfString=[string stringByAppendingString:selfString];
            
            
        }else{
            selfString=replaceString;
        }
        
        
    }else{
        NSLog(@"服务器没有返回%@",key);
        selfString =replaceString;
    }
    
    return selfString;
}
+(NSString *)checkTimeReturnRequestDictionary:(NSDictionary *)attributes andKey:(NSString *)key andReplaceString:(NSString *)replaceString{
    NSString *selfString=@"";
    if ([[attributes allKeys] containsObject:key]) {
        
        id object=[attributes valueForKey:key];
        
        if ([StringToJson requestReturnDataString:object]) {
            
            selfString = [NSString stringWithFormat:@"%@",object];
            selfString=[selfString substringToIndex:10];
            
        }else{
            selfString=@"0";
        }
        
    }else{
        NSLog(@"服务器没有返回%@",key);
        selfString =replaceString;
    }
    return selfString;
}
#pragma mark- 缩放图片
+ (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize
{
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width*scaleSize,image.size.height*scaleSize));
    [image drawInRect:CGRectMake(0, 0, image.size.width * scaleSize, image.size.height *scaleSize)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}
+(NSString *)fourStarPhone:(NSString *)string{
    if ([string isKindOfClass:[NSString class]] && string.length>0) {
        NSRange a=NSMakeRange(3, 4);
        string=[string stringByReplacingCharactersInRange:a withString:@"****"];
        return string;
    }else{
        return @"";
    }
    
}
//+ (NSURL *)getDefaultDir
//{
//    NSURL *urlDefault = nil;
//    NSString *strDic = nil;
//
//    NSString *strVersion = [[UIDevice currentDevice] systemVersion];
//    float fVersion = 0.0;
//    if(strVersion.length > 0)
//        fVersion = [strVersion floatValue];
//
//    if (fVersion == 5.0) {
//        strDic = [NSString stringWithFormat:@"%@/Library/Caches/",
//                  NSHomeDirectory()];
//    } else {
//        strDic = [NSString stringWithFormat:@"%@/Library/%@/",
//                  NSHomeDirectory(),
//                  [[NSBundle mainBundle] bundleIdentifier]];
//    }
//
//    if (![[NSFileManager defaultManager] fileExistsAtPath:strDic]) {
//        [[NSFileManager defaultManager] createDirectoryAtPath:strDic withIntermediateDirectories:YES attributes:nil error:nil];
//    }
//
//    urlDefault = [NSURL fileURLWithPath:strDic];
//
//    if (fVersion > 5.0 && fVersion < 5.1)
//        [self addSkipBackupAttributeToItemAtURL:urlDefault];
//    else if (fVersion >= 5.0)
//        [self addSkipBackupAttributeToItemAtURL_iOS5_1:urlDefault];
//
//    return urlDefault;
//}
//
//#pragma mark -  Excluding a File from Backups on iOS 5.1
//
//+ (BOOL)addSkipBackupAttributeToItemAtURL_iOS5_1:(NSURL *)URL
//{
//    assert([[NSFileManager defaultManager] fileExistsAtPath: [URL path]]);
//
//    NSError *error = nil;
//    BOOL success = [URL setResourceValue: [NSNumber numberWithBool: YES]
//                                  forKey: NSURLIsExcludedFromBackupKey error: &error];
//    if(!success){
//        NSLog(@"Error excluding %@ from backup %@", [URL lastPathComponent], error);
//    }
//    return success;
//}
//
//#pragma mark - Setting the Extended Attribute on iOS 5.0.1
//+ (BOOL)addSkipBackupAttributeToItemAtURL:(NSURL *)URL
//{
//    assert([[NSFileManager defaultManager] fileExistsAtPath: [URL path]]);
//
//    const char* filePath = [[URL path] fileSystemRepresentation];
//
//    const char* attrName = "com.apple.MobileBackup";
//    u_int8_t attrValue = 1;
//    
//    int result = setxattr(filePath, attrName, &attrValue, sizeof(attrValue), 0, 0);
//    return result == 0;
//}
@end
