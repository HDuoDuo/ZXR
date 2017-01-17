//
//  UIAlertView+AlertView.m
//  MiaoM
//
//  Created by 熊维东 on 16/6/15.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import "UIAlertView+AlertView.h"

@implementation UIAlertView (AlertView)

+(void)initAlertView:(NSString *)message
{
    
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"提示" message:message delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert show];
    
}
@end
