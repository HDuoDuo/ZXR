//
//  UIView+MEView.h
//  UIViewExtension
//
//  Created by jinghua on 16/3/12.
//  Copyright © 2016年 Sugar. All rights reserved.
//
#import <UIKit/UIKit.h>
#define kPaddingTop 5
#define kPadding 10
#define kSize CGSizeMake(100, 30)
#define kFont [UIFont systemFontOfSize:15]
/**
 *  Settings for views
 */
@interface UIView (MEView)

#pragma mark Property

/**
 *  Shortcut for frame.origin.x
 */
@property (nonatomic) CGFloat left;

/**
 *  Shortcut for frame.origin.y
 */
@property (nonatomic) CGFloat top;

/**
 *  Shortcut for frame.origin.x + frame.size.width
 */
@property (nonatomic) CGFloat right;

/**
 *  Shortcut for frame.origin.y + frame.size.height
 */
@property (nonatomic) CGFloat bottom;

/**
 *  Shortcut for frame.size.width
 */
@property (nonatomic) CGFloat width;

/**
 *  Shortcut for frame.size.height
 */
@property (nonatomic) CGFloat height;

/**
 *  Shortcut for frame.center.x
 *  ⚠️Warming : set frame.size before set this property
 */
@property (nonatomic) CGFloat centerX;

/**
 *  Shortcut for frame.center.y
 *  ⚠️Warming : set frame.size before set this property
 */
@property (nonatomic) CGFloat centerY;

/**
 *  Shortcut for frame.size
 */
@property (nonatomic) CGSize size;

/**
 *  Shortcut for frame.origin
 */
@property (nonatomic) CGPoint origin;

/**
 *  parentViewController
 */
- (UIViewController *)viewController;


@end
