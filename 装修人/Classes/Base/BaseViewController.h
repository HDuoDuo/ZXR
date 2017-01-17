//
//  BaseViewController.h
//  装修人
//
//  Created by 熊维东 on 2016/11/29.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController<UIGestureRecognizerDelegate,UIActionSheetDelegate>

@property(nonatomic,strong)UITableView * aMytableView;

- (void)leftItemTapped;
- (void)rightItemTapped;

- (void)setLeftNaviItemWithTitle:(NSString *)title imageName:(NSString *)imageName;
- (void)setRightNaviItemWithTitle:(NSString *)title imageName:(NSString *)imageName;
- (void)setLeftNaviItemWithTitle:(NSString *)title size:(CGFloat)size imageName:(NSString *)imageName;
- (void)setNaviTitle:(NSString *)title size:(CGFloat)size;

@end
