//
//  TCTLAlertView.h
//  TCTravel_Location
//
//  Created by lyf3852water on 15/3/18.
//  Copyright (c) 2015年 TC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TCTLAlertView : NSObject

/**
 *  弹框UIAlertView，目前支持最多两个按钮
 *
 *  @param title              title
 *  @param message            message
 *  @param cancelTitle        取消按钮 title
 *  @param ensureButtonTitle  确定按钮 title
 *  @param completeUsingBlock 确定按钮 block
 *  @param cancelUsingBlock   取消按钮 block
 */
+(void)showAerltViewWithTitle:(NSString *)title
                      message:(NSString *)message
           cancelButtonTtitle:(NSString *)cancelTitle
            ensuerButtonTitle:(NSString *)ensureButtonTitle
             onSureUsingBlock:(void (^)())completeUsingBlock
           onCancelUsingBlock:(void (^)())cancelUsingBlock;

+(BOOL)bHadAlert;

@end
