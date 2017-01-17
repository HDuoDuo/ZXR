//
//  LHHomePageModel.h
//  装修人
//
//  Created by liuhang on 16/12/8.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYModel/YYModel.h>

@class DataModel,ListdeccomModel,ListdescomModel,ListlunboModel,ListshoppingModel;
@interface LHHomePageModel : NSObject<YYModel>

@property (nonatomic, strong) DataModel *data;

@property (nonatomic, copy) NSString *code;

@end
@interface DataModel : NSObject<YYModel>

@property (nonatomic, strong) NSArray<ListlunboModel *> *listLunbo;

@property (nonatomic, strong) NSArray<ListdeccomModel *> *listDecCom;

@property (nonatomic, strong) NSArray<ListdescomModel *> *listDesCom;

@property (nonatomic, strong) NSArray<ListshoppingModel *> *listShopping;

@end

@interface ListdeccomModel : NSObject<YYModel>

@property (nonatomic, copy) NSString *href;

@property (nonatomic, copy) NSString *image;

@end

@interface ListdescomModel : NSObject<YYModel>


@property (nonatomic, copy) NSString *href;


@property (nonatomic, copy) NSString *image;


@end


@interface ListlunboModel : NSObject<YYModel>


@property (nonatomic, copy) NSString *href;


@property (nonatomic, copy) NSString *image;


@end

@interface ListshoppingModel : NSObject<YYModel>


@property (nonatomic, copy) NSString *href;


@property (nonatomic, copy) NSString *image;

@end

