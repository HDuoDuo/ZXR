//
//  UIAlertController+Alert.m
//  MiaoM
//
//  Created by 熊维东 on 16/6/14.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import "UIAlertController+Alert.h"

@implementation UIAlertController (Alert)


-(void)showAlertControllerWithMessage:(NSString *)message{
    UIAlertController *remindAV = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
   
    [remindAV addAction:[UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil]];
    
    [self presentViewController:remindAV animated:YES completion:nil];
}
 
@end
