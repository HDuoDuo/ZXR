//
//  JHSysImgPickerUtil.m
//  JHSystemUtility
//
//  Created by 
//  Copyright © 2016年 FLZC. All rights reserved.
//

#import "JHSysImgPickerUtil.h"
#import "JHSysAlertUtil.h"

#define kRootViewController [UIApplication sharedApplication].keyWindow.rootViewController

@interface JHSysImgPickerUtil ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, copy) JHImagePickerBlock imagePickerBlock;
@property (nonatomic, assign) BOOL allowEditing;

@end

@implementation JHSysImgPickerUtil

- (void)pickImageEditing:(BOOL)allowEditing handler:(JHImagePickerBlock)handler {
    
    self.allowEditing = allowEditing;
    self.imagePickerBlock = handler;
    
    [JHSysAlertUtil presentAlertWithTitle:nil message:@"请选择您要上传的资料" actionTitles:@[@"拍照上传", @"从相册选择"]  preferredStyle:UIAlertControllerStyleActionSheet handler:^(NSUInteger buttonIndex, NSString *buttonTitle) {
        
        if (buttonIndex == 1) {
            [self takePhotosWithSourceType:UIImagePickerControllerSourceTypeCamera];
        }else if (buttonIndex == 2) {
            [self takePhotosWithSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        }
    }];
}

#pragma mark - 拍照/选取照片
- (void)takePhotosWithSourceType:(UIImagePickerControllerSourceType)sourceType{
    
    if ([UIImagePickerController isSourceTypeAvailable:sourceType]) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.sourceType = sourceType;
        picker.delegate = self; // 设置代理, 要遵循UIImagePickerControllerDelegate，UINavigationControllerDelegate协议
        
        picker.allowsEditing = self.allowEditing;//设置拍照之后图片是否可编辑，如果设置成可编辑的话会在代理方法返回的字典里面多一些键值。PS：如果在调用相机的时候允许照片可编辑，那么用户能编辑的照片的位置并不包括边角。
        
        [kRootViewController presentViewController:picker animated:YES completion:nil];
    } else {
        
        NSString *msg = nil;
        if (sourceType == UIImagePickerControllerSourceTypeCamera ) {
            // 无摄像头
            msg = @"该设备摄像头不可用";
        } else if (sourceType == UIImagePickerControllerSourceTypePhotoLibrary) {
            // 系统图库不可用
            msg = @"系统图库不可用";
        }
        
        [JHSysAlertUtil presentAlertViewWithTitle:nil message:msg confirmTitle:@"确定" handler: nil];
    }
}

#pragma mark - UIImagePickerControllerDelegate
// 完成  拍照/选择图片
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    // 获取选中图片
    UIImage *image;
    if (picker.allowsEditing) {
        image =  [info objectForKey:UIImagePickerControllerEditedImage]; // 编辑后的图片
    } else {
        image = [info valueForKey:UIImagePickerControllerOriginalImage]; // 原图
    }
    
    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera){
        // 拍照后, 赋值的同时,把照片存到图片库
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil); // 把图片存到手机图片库
    }
    
    if (self.imagePickerBlock) {
        self.imagePickerBlock(image);
    }
    
    [kRootViewController dismissViewControllerAnimated:YES completion:^{}];
}

// 取消 拍照/选择图片
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [kRootViewController dismissViewControllerAnimated:YES completion:^{}];
}



@end
