//
//  TCTLAlertView.m
//  TCTravel_Location
//
//  Created by lyf3852water on 15/3/18.
//  Copyright (c) 2015年 TC. All rights reserved.
//

#import "TCTLAlertView.h"
#import <objc/runtime.h>

#define TCTLApplicationKey @"TCTLAlertView_Water"

@interface TCTLAlertView ()<UIAlertViewDelegate>

@property(nonatomic,strong)UIAlertView *alert;

@property(nonatomic,copy) void (^sureBlock)();
@property(nonatomic,copy) void (^cancleBlock)();


@end

@implementation TCTLAlertView



#pragma mark - function

+(void)showAerltViewWithTitle:(NSString *)title
                      message:(NSString *)message
           cancelButtonTtitle:(NSString *)cancelTitle
            ensuerButtonTitle:(NSString *)ensureButtonTitle
             onSureUsingBlock:(void (^)())completeUsingBlock
           onCancelUsingBlock:(void (^)())cancelUsingBlock
{
    //用单例持有Alertview
//    UIApplication *application=[UIApplication sharedApplication];
    id application = [UIApplication sharedApplication].delegate;
    
    //dismiss上次的弹框
    TCTLAlertView *lastAlert=objc_getAssociatedObject(application, TCTLApplicationKey);
    [lastAlert.alert dismissWithClickedButtonIndex:lastAlert.alert.cancelButtonIndex animated:NO];
    objc_setAssociatedObject(application, TCTLApplicationKey, nil, OBJC_ASSOCIATION_ASSIGN);
    
    TCTLAlertView *temp=[[TCTLAlertView alloc] init];
    temp.sureBlock   = completeUsingBlock;
    temp.cancleBlock = cancelUsingBlock;
    temp.alert=[[UIAlertView alloc] initWithTitle:title
                                          message:message
                                         delegate:temp
                                cancelButtonTitle:cancelTitle
                                otherButtonTitles:ensureButtonTitle, nil];
    [temp.alert show];
    
    objc_setAssociatedObject(application, TCTLApplicationKey, temp, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+(BOOL)bHadAlert
{
    id application = [UIApplication sharedApplication].delegate;;
    TCTLAlertView *lastAlert=objc_getAssociatedObject(application, TCTLApplicationKey);
    return (lastAlert != nil);
}


#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==alertView.cancelButtonIndex) {
        if (self.cancleBlock) {
            self.cancleBlock();
            self.cancleBlock = nil;
        }
    }else{
        if (self.sureBlock) {
            self.sureBlock();
            self.sureBlock = nil;
        }
    }
    alertView.delegate = nil;
    
    //移除
    //    UIApplication *application=[UIApplication sharedApplication];
    id application = [UIApplication sharedApplication].delegate;;
    
    objc_setAssociatedObject(application, TCTLApplicationKey, nil, OBJC_ASSOCIATION_ASSIGN);
}

@end
