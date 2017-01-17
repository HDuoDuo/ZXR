//
//  CollectionViewCell.h
//  装修人
//
//  Created by liuhang on 16/12/21.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol photoSecleterDelegate <NSObject>
@optional
- (void)photoAdded:(UICollectionViewCell *)cell;
- (void)photoRemove:(UICollectionViewCell *)cell;

@end
@interface CollectionViewCell : UICollectionViewCell
//移除照片按钮
@property (weak, nonatomic) IBOutlet UIButton *removeBtn;
//添加图片按钮
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
//图片
@property (nonatomic, strong) UIImage *btnImg;
//代理
@property (assign, nonatomic) id<photoSecleterDelegate> delegate;
@end
