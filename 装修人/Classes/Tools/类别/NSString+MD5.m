//
//  NSString+MD5.m
//  装修人
//
//  Created by liuhang on 16/12/26.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import "NSString+MD5.h"
#import <CommonCrypto/CommonDigest.h>
@implementation NSString (MD5)
+ (NSString *)MDStringFromString:(NSString *)str {
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
+ (NSString *)MDStringFromArray:(NSArray *)stringArray {
    NSMutableString *resultString = [[NSMutableString alloc]init];
    for (NSInteger index = 0; index < stringArray.count; index++) {
        NSString *indexStr = stringArray[index];
        [resultString appendString:indexStr];
    }
    return [self MDStringFromString:resultString];
}
@end
