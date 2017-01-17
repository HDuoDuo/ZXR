//
//  changeGoodsViewController.m
//  装修人
//
//  Created by liuhang on 17/1/5.
//  Copyright © 2017年 熊维东. All rights reserved.
//

#import "changeGoodsViewController.h"
#import "Config.h"
#import "CollectionViewCell.h"
#import "UIImage+compressImage.h"

static NSString *cellIdentifier = @"CollectionViewCell";

@interface changeGoodsViewController ()<UITextFieldDelegate,UITextViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,photoSecleterDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
//contentView的高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentViewHeight;
//字数提醒
@property (weak, nonatomic) IBOutlet UILabel *wordsLabel;
//占位字数
@property (weak, nonatomic) IBOutlet UILabel *placeholderLabel;
//标题TF宽度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleTFWidth;
//标题TF
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
//描述textView
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
//提示label
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
//展示图片collectionView
@property (weak, nonatomic) IBOutlet UICollectionView *imgsCollectionView;
//价格
@property (weak, nonatomic) IBOutlet UITextField *priceTextField;
//线下价格
@property (weak, nonatomic) IBOutlet UITextField *truePricetextField;
//库存
@property (weak, nonatomic) IBOutlet UITextField *NumberTextField;
//collectionView的数据源
@property (nonatomic, strong) NSMutableArray *dataArray;
//collectionView的item的宽度
@property (nonatomic, assign) CGFloat itemSizeWidth;

@end
@implementation changeGoodsViewController
//懒加载
- (NSMutableArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc]init];
        for (NSInteger j = 0; j < 5; j++) {
            UIImage *imgage = [UIImage imageNamed:@"icon_reputation"];
            [_dataArray addObject:imgage];
        }
    }
    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //UI
    [self createUI];
}
- (void)createUI {
    //设置titleTF
    //获取数据的宽度
    CGSize size =  [self.model.title sizeWithAttributes:@{@"NSFontAttributeName":self.titleTextField.font}];
    //设置
    //title
    self.titleTFWidth.constant = size.width+8;
    self.titleTextField.text = self.model.title;
    //描述
    self.descriptionTextView.layer.borderWidth = 0.5f;
    self.descriptionTextView.layer.borderColor = [UIColor grayColor].CGColor;
    self.descriptionTextView.text = self.model.desc;
    [self textViewDidChange:self.descriptionTextView];
    //设置collectionView
    //注册
    [self.imgsCollectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:cellIdentifier];
    //设置代理
    self.imgsCollectionView.delegate = self;
    self.imgsCollectionView.dataSource = self;
    //设置FlowLayout
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    self.itemSizeWidth = (KScreenWidth-66) /3.0f;
    layout.itemSize = CGSizeMake(self.itemSizeWidth, self.itemSizeWidth);
    layout.minimumInteritemSpacing = 10; //列间距
    layout.minimumLineSpacing = 10;//行间距
    self.imgsCollectionView.collectionViewLayout = layout;
}
#pragma mark -- UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    //根据图片数量判断是否继续添加图片
    if (self.dataArray.count < 6) {
        return self.dataArray.count + 1;
    }
    return self.dataArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    //代理
    cell.delegate = self;
    //删除按钮显示
    cell.removeBtn.hidden = (self.dataArray.count == indexPath.item) ? YES : NO;
    //设置图片
    cell.btnImg = (self.dataArray.count == indexPath.item) ? nil : self.dataArray[indexPath.item];
    return cell;
}
#pragma mark -- photoSecleterDelegate
- (void)photoRemove:(UICollectionViewCell *)cell {
    NSIndexPath *removeIndexPath = [self.imgsCollectionView indexPathForCell:(CollectionViewCell *)cell];
    [self.dataArray removeObjectAtIndex:removeIndexPath.item];
    [self resetCollectionViewWidth];
    [self.imgsCollectionView reloadData];
    NSLog(@"移除第%ld张",removeIndexPath.item);
}
#pragma mark -- photoSecleterDelegate
- (void)photoAdded:(UICollectionViewCell *)cell {
    //图片拾取控制器
    UIImagePickerController *imgPicker = [[UIImagePickerController alloc]init];
    imgPicker.delegate = self;
    //判断可用的图片方式
    if (imgPicker.sourceType == UIImagePickerControllerSourceTypePhotoLibrary) {
        [self presentViewController:imgPicker animated:YES completion:nil];
    }else {
        return;
    }
}
#pragma mark -- UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    //获取选择的图片
    NSLog(@"%@",info);
    UIImage* image = [info objectForKey:UIImagePickerControllerOriginalImage];
    UIImage *newImage = [image imageWithScaleWidth:KScreenWidth];
    //压缩放入数组
    [self.dataArray addObject:newImage];
    [picker dismissViewControllerAnimated:YES completion:nil];
    [self.imgsCollectionView reloadData];
}
#pragma mark -- UITextViewDelegate
- (void)textViewDidChange:(UITextView *)textView {
    //字数提示
    self.wordsLabel.text = [NSString stringWithFormat:@"%ld/300",self.descriptionTextView.text.length];
    if (self.descriptionTextView.text.length > 0) {
        self.placeholderLabel.hidden = YES;
    }else {
        self.placeholderLabel.hidden = NO;
    }
}
#pragma mark -- UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    NSLog(@"开始编辑");
}
- (IBAction)titleButton:(UIButton *)sender {
    [self.titleTextField becomeFirstResponder];
}
- (void)rightItemTapped {
    //点击保存
}
//设置高度
- (void)resetCollectionViewWidth {
    //根据图片张数设置scrollView的contentView的高度
    if (self.dataArray.count < 6) {
        self.contentViewHeight.constant = 322 + self.itemSizeWidth +(self.dataArray.count / 3) *(self.itemSizeWidth + 10);
    }
}
- (void)viewWillAppear:(BOOL)animated {
    self.title = @"修改商品";
    [self setLeftNaviItemWithTitle:@"" imageName:@"nav_return"];
    [self setRightNaviItemWithTitle:@"" imageName:@"font_save"];
    self.navigationController.navigationBar.barTintColor= [UIColor whiteColor];
    [self resetCollectionViewWidth];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
