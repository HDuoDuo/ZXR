//
//  commentSectionFooter.h
//  装修人
//
//  Created by liuhang on 17/1/13.
//  Copyright © 2017年 熊维东. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface commentSectionFooter : UIView
//更多评价按钮回调
@property (nonatomic, copy) void (^moreCommentBlock)();
@end
