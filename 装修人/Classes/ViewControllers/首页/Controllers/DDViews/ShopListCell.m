//
//  shopListCell.m
//  装修人
//
//  Created by 熊维东 on 2017/1/10.
//  Copyright © 2017年 熊维东. All rights reserved.
//

#import "ShopListCell.h"
#import "Config.h"
@implementation ShopListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state

     [self HightLight:selected];
    
    
}


-(void)HightLight:(BOOL)isLight
{
    if (isLight == YES ) {
         self.lb_colorBG.backgroundColor = COLOR(87, 145, 210, 1);
        self.lb_classText.textColor = COLOR(87, 145, 210, 1);
  
    }else{
        

        self.lb_colorBG.backgroundColor = [UIColor whiteColor];
        self.lb_classText.textColor = COLOR(102, 102, 102, 1);

    }

}



@end
