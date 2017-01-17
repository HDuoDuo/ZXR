//
//  CollectionViewCell.m
//  装修人
//
//  Created by liuhang on 16/12/21.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import "CollectionViewCell.h"
@implementation CollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.removeBtn.hidden = YES;
}
- (void)setBtnImg:(UIImage *)btnImg {
    if (btnImg) {
        [self.addBtn setBackgroundImage:btnImg forState:UIControlStateNormal];
        self.addBtn.userInteractionEnabled = NO;
    }else {
        self.addBtn.userInteractionEnabled = YES;
        [self.addBtn setBackgroundImage:[UIImage imageNamed:@"icon_image_upload"] forState:UIControlStateNormal];
    }
}
- (IBAction)addImg:(UIButton *)sender {
    [self.delegate photoAdded:self];
}
- (IBAction)removeImg:(UIButton *)sender {
    [self.delegate photoRemove:self];
}

@end
