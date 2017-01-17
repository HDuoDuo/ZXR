//
//  DDCollectionContextCell.h
//  装修人
//
//  Created by 熊维东 on 2017/1/10.
//  Copyright © 2017年 熊维东. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DDCollectionContextCell : UICollectionViewCell
//图片
@property (weak, nonatomic) IBOutlet UIImageView *collection_img;
//类型
@property (weak, nonatomic) IBOutlet UILabel *lb_collectionTitle;

@end
