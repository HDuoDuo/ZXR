//
//  BaseModel.m
//  Integration
//
//  Created by zhaoxv on 15/9/2.
//  Copyright (c) 2015年 ioschina. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

- (void)selSetValue:(NSDictionary *)theDictionary {
    
}

- (NSString *)selStringUseful:(id)theValue
{
    NSString *strResult = nil;
    @autoreleasepool {
        @try
        {
            if ([theValue isKindOfClass:[NSString class]]) {
                strResult = [NSString stringWithFormat:@"%@", theValue];
            } else {
                NSString *string = [NSString stringWithFormat:@"%@", theValue];
                if (string.length == 6 && [[string substringWithRange:NSMakeRange(1, 4)] isEqualToString:@"null"]) {
                    strResult = @"";
                } else {
                    strResult = string;
                }
            }
        }
        @catch (NSException *exception) {
            strResult = @"";
        }
        @finally {}
    }
    
    return strResult;
}

@end
