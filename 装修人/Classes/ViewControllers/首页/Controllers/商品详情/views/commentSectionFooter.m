//
//  commentSectionFooter.m
//  装修人
//
//  Created by liuhang on 17/1/13.
//  Copyright © 2017年 熊维东. All rights reserved.
//

#import "commentSectionFooter.h"

@implementation commentSectionFooter
- (IBAction)moreCommentBtn {
    if (self.moreCommentBlock) {
        self.moreCommentBlock();
    }
}
@end
