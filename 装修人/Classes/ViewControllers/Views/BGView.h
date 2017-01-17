//
//  BGView.h
//  装修人
//
//  Created by 熊维东 on 2016/12/4.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import <UIKit/UIKit.h>
IB_DESIGNABLE
@interface BGView : UIView

@property(nonatomic)IBInspectable CGFloat cornerRadius;
@property(nonatomic)IBInspectable CGFloat borderWidth;

@property(nonatomic)IBInspectable UIColor* borderColor;
@property(nonatomic)IBInspectable UIColor* defineColor;

@end
