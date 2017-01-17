//
//  AddgoodsViewController.m
//  装修人
//
//  Created by 熊维东 on 2016/12/20.
//  Copyright © 2016年 熊维东. All rights reserved.
//  添加商品

#import "AddgoodsViewController.h"
#import "CollectionViewCell.h"
#import "Config.h"
#import "datePickerView.h"
#import "LHNetworking.h"
#import "NSDate+LHDate.h"
#import "NSString+MD5.h"
#import "UIImage+compressImage.h"
#define addGoods_url @"http://192.168.1.45:8080/zxrweb/appGoods/addGoods"
static NSString *cellIdentifier = @"CollectionViewCell";

@interface AddgoodsViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,photoSecleterDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextViewDelegate>
//collectionView
@property (weak, nonatomic) IBOutlet UICollectionView *imgCollectionView;
@property (weak, nonatomic) IBOutlet UILabel *placehoderLabel;
//提交按钮
@property (weak, nonatomic) IBOutlet UIButton *sumbitBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *goodsCollectionViewWidth;
//scrollView的高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollViewHeight;
//collectionView的数据源
@property (nonatomic, strong) NSMutableArray *dataArray;
//collectionView的item的宽度
@property (nonatomic, assign) CGFloat itemSizeWidth;
//商品名输入框
@property (weak, nonatomic) IBOutlet UITextField *goodsNameTF;
//字数提醒
@property (weak, nonatomic) IBOutlet UILabel *wordsLabel;
//商品描述textView
@property (weak, nonatomic) IBOutlet UITextView *goodsDescTextView;
//商品定价
@property (weak, nonatomic) IBOutlet UITextField *goodsPriceTF;
//线下价格
@property (weak, nonatomic) IBOutlet UITextField *truePriceTF;
//商品库存
@property (weak, nonatomic) IBOutlet UITextField *goodscountTF;
//date
@property (weak, nonatomic) IBOutlet UILabel *preciousTimeLB;
//time
@property (weak, nonatomic) IBOutlet UILabel *lastTimeLB;
@end
@implementation AddgoodsViewController
//懒加载
- (NSMutableArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc]init];
    }
    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //设置UI
    [self createUI];
}
- (void)createUI {
    //imgCollectionView
    //注册
    [self.imgCollectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:cellIdentifier];
    //设置代理
    self.imgCollectionView.delegate = self;
    self.imgCollectionView.dataSource = self;
    //设置FlowLayout
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    self.itemSizeWidth = (KScreenWidth-66) /3.0f;
    layout.itemSize = CGSizeMake(self.itemSizeWidth, self.itemSizeWidth);
    layout.minimumInteritemSpacing = 10; //列间距
    layout.minimumLineSpacing = 10;//行间距
    self.imgCollectionView.collectionViewLayout = layout;
    //设置上架时间为当前时间
    self.preciousTimeLB.text = [NSDate dateStringFromCurrentDate];
    self.lastTimeLB.text = [NSDate timeStringFromCurrentDate];
    //设置textView
    self.goodsDescTextView.delegate = self;
    self.goodsDescTextView.layer.borderWidth = 0.5f;
    self.goodsDescTextView.layer.borderColor = [UIColor grayColor].CGColor;
    //提交按钮的默认状态
    self.sumbitBtn.enabled = NO;
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
    //设置图片
    cell.btnImg = (self.dataArray.count == indexPath.item) ? nil : self.dataArray[indexPath.item];
    return cell;
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
    [self.imgCollectionView reloadData];
    //改变提交按钮的状态
    self.sumbitBtn.enabled = [self inputIsNil];
}

#pragma mark -- 获取时间
- (IBAction)getPreciousTimeBtn:(UIButton *)sender {
    NSLog(@"获取年月日");
    datePickerView *datePickerView = [[NSBundle mainBundle]loadNibNamed:@"datePickerView" owner:self options:nil].firstObject;
    //设置模式
    datePickerView.pickerModel = UIDatePickerModeDate;
    //时间获取
    __weak typeof(self) weakSelf = self;
    datePickerView.dateBlock = ^(NSString *date) {
         weakSelf.preciousTimeLB.text = date;
    };
    [self.view addSubview:datePickerView];
    //动画
    [self datePickerViewAnimation:datePickerView];
}
- (IBAction)getLastTimeBtn:(UIButton *)sender {
    NSLog(@"获时分秒");
    datePickerView *datePickerView = [[NSBundle mainBundle]loadNibNamed:@"datePickerView" owner:self options:nil].firstObject;
    //设置模式
    datePickerView.pickerModel = UIDatePickerModeTime;
    //时间获取
    __weak typeof(self) weakSelf = self;
    datePickerView.dateBlock = ^(NSString *date) {
        weakSelf.lastTimeLB.text = date;
    };
    [self.view addSubview:datePickerView];
    //动画
    [self datePickerViewAnimation:datePickerView];
}
//设置动画
- (void)datePickerViewAnimation:(datePickerView *)pickerView {
    pickerView.frame = CGRectMake(0, KScreenHeight, KScreenWidth, 200);
    CGRect lastRect = CGRectMake(0, KScreenHeight- 200, KScreenWidth, 200);
    [UIView animateWithDuration:0.2f animations:^{
        pickerView.frame = lastRect;
    }];
}
#pragma mark -- UITextViewDelegate
- (void)textViewDidEndEditing:(UITextView *)textView{
    self.sumbitBtn.enabled = [self inputIsNil];
}
- (void)textViewDidChange:(UITextView *)textView {
    self.wordsLabel.text = [NSString stringWithFormat:@"%ld/300",textView.text.length];
    if (textView.text.length > 0) {
        self.placehoderLabel.hidden = YES;
    }else {
        self.placehoderLabel.hidden = NO;
    }
}
#pragma mark -- UITextFieldDelegate
//代理在xib里面
- (IBAction)judgeSumbitState:(id)sender {
    self.sumbitBtn.enabled = [self inputIsNil];
}
//判断是否输入完整
- (BOOL)inputIsNil {
    if (self.goodsNameTF.text.length && self.goodsDescTextView.text.length && self.goodsPriceTF.text.length && self.dataArray.count > 0 && self.truePriceTF.text.length && self.goodscountTF.text.length) {
        return YES;
    }
    return NO;
}
- (IBAction)sumbitBtn:(UIButton *)sender {
}
//提交至服务器
- (void)rightItemTapped {
    //当前时间戳
    NSString *timeStamp = [NSDate timestampFromCurrentDate];
    //1.拼接上架时间
    NSString *marketDateStr = [NSString stringWithFormat:@"%@ %@",self.preciousTimeLB.text,self.lastTimeLB.text];
    //2.md5加密字段
    NSString *sign = [NSString stringWithFormat:@"cqkrszxrappkeycontent%@goodsName%@goodscount%@goodstypeid%@marketDate%@mobileLogin%@shopid%@shopprice%@timestamp%@trueprice%@userId%@",self.goodsDescTextView.text,self.goodsNameTF.text,self.goodscountTF.text,@"61616",marketDateStr,@"true",@"61616",self.goodsPriceTF.text,timeStamp,self.truePriceTF.text,@"22522636"];
    //MD5
    NSString *signStr = [NSString MDStringFromString:sign];
    //请求参数
    NSDictionary *parameter =
    @{@"goodsName":self.goodsNameTF.text,
      @"userId":@"22522636",
      @"shopprice":self.goodsPriceTF.text,
      @"trueprice":self.truePriceTF.text,
      @"goodscount":self.goodscountTF.text,
      @"shopid":@"61616",
      @"content":self.goodsDescTextView.text,
      @"goodstypeid":@"61616",
      @"marketDate":marketDateStr,
      @"mobileLogin":@"true",
      @"timestamp":timeStamp,
      @"sign":signStr};
    //数据提交
    [[LHNetworking shareInstance].manager POST:addGoods_url parameters:parameter constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        //循环拼接数据
        for (NSInteger index = 0; index < self.dataArray.count; index++) {
            //根据当前时间生成图片名称
            NSString *currentDateStr = [NSDate dateStringFromCurrentDate];
            //fileName
            NSString *fileName = [NSString stringWithFormat:@"%@%ld.jpg",currentDateStr,index];
            //图片data
            UIImage *image = self.dataArray[index];
            NSData *imgData;
            if (UIImagePNGRepresentation(image) == nil) {
                imgData = UIImageJPEGRepresentation(image, 1);
            } else {
                imgData = UIImagePNGRepresentation(image);
            }
            //拼接data流
            if (index == 0) {
                [formData appendPartWithFileData:imgData name:@"photo" fileName:fileName mimeType:@"multipart/form-data"];
            }else {
                [formData appendPartWithFileData:imgData name:@"file" fileName:fileName mimeType:@"multipart/form-data"];
            }
            
        }
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //解析
        id jsonObject=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSDictionary *dictOfVlue=(NSDictionary *)jsonObject;
        NSLog(@"%@",dictOfVlue);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败---%@",error);
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
    self.title = @"添加商品";
    
    [self setLeftNaviItemWithTitle:@"" imageName:@"nav_return"];
    [self setRightNaviItemWithTitle:@"" imageName:@"mav_submit"];
    self.navigationController.navigationBar.barTintColor= [UIColor whiteColor];
    
    self.navigationController.navigationBar.hidden = NO;
    //计算scrollView的高度
    if (self.dataArray.count < 6) {
        self.scrollViewHeight.constant = 387 + self.itemSizeWidth +(self.dataArray.count / 3) *(self.itemSizeWidth + 10);
    }
}
- (void)viewWillDisappear:(BOOL)animated {
    [[LHNetworking shareInstance] cancelRquest];
}
@end
