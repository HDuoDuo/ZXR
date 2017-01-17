//
//  UIView+MEView.m
//  UIViewExtension
//
//  Created by jinghua on 16/3/12.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "UIView+MEView.h"

@implementation UIView (MEView)

//left
-(void)setLeft:(CGFloat)left {
    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}
- (CGFloat)left {
    return self.frame.origin.x;
}

//top
-(void)setTop:(CGFloat)top {
    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
}
-(CGFloat)top {
    return self.frame.origin.y;
}

//right
-(void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - self.frame.size.width;
    self.frame = frame;
}
-(CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

//bottom
-(void)setBottom:(CGFloat)bottom {
    
}
-(CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

//width
-(void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
-(CGFloat)width {
    return self.frame.size.width;
}

//height
-(void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
-(CGFloat)height {
    return self.frame.size.height;
}

//centerX
-(void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}
-(CGFloat)centerX {
    return self.center.x;
}

//centerY
-(void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}
-(CGFloat)centerY {
    return self.center.y;
}

//size
-(void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
-(CGSize)size {
    return self.frame.size;
}

//origin
-(void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}
-(CGPoint)origin {
    return self.frame.origin;
}

- (UIViewController *)viewController {
    for (UIView *view = self; view; view = view.superview) {
        UIResponder *nextResponder = [view nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}
@end
