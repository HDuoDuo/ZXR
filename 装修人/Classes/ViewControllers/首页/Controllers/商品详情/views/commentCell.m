//
//  commentCell.m
//  装修人
//
//  Created by liuhang on 17/1/12.
//  Copyright © 2017年 熊维东. All rights reserved.
//

#import "commentCell.h"
#import "Config.h"
#import "commentCollectionViewCell.h"
static NSString *cellIdentifier = @"commentCollectionViewCell";
@interface commentCell ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, assign) CGFloat itemSizeWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *collectionCellHeight;

@end
@implementation commentCell
- (void)awakeFromNib {
    [super awakeFromNib];
    //imgCollectionView
    //注册
    [self.imgsCollectionCell registerNib:[UINib nibWithNibName:@"commentCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:cellIdentifier];
    self.imgsCollectionCell.delegate = self;
    self.imgsCollectionCell.dataSource = self;
    //设置FlowLayout
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    self.itemSizeWidth = (KScreenWidth-44) /3.0f;
    self.collectionCellHeight.constant = self.itemSizeWidth;
    layout.itemSize = CGSizeMake(self.itemSizeWidth, self.itemSizeWidth);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumInteritemSpacing = 10; //列间距
    layout.minimumLineSpacing = 10;//行间距
    self.imgsCollectionCell.collectionViewLayout = layout;
}
#pragma mark -- UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 6;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    commentCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    return cell;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
