//
//  BaseViewController.m
//  Nav+Tabbar
//
//  Created by 熊维东 on 16/5/18.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import "BaseViewController.h"
#import "define.h"
@interface BaseViewController ()

@end

@implementation BaseViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)leftItemTapped
{
    [self.navigationController popViewControllerAnimated:YES];
 }

- (void)rightItemTapped
{
    //methods
    
}

- (void)setLeftNaviItemWithTitle:(NSString *)title imageName:(NSString *)imageName
{
    if(imageName)
    {
        UIImage *leftImage = [UIImage imageNamed:imageName];
        UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [leftButton setImage:leftImage forState:UIControlStateNormal];
        leftButton.frame = CGRectMake(0, 0, leftImage.size.width, leftImage.size.height);
        [leftButton addTarget:self action:@selector(leftItemTapped) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
        self.navigationItem.leftBarButtonItem = leftItem;
        return;
    }
    if(title)
    {
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(leftItemTapped)];
        self.navigationItem.leftBarButtonItem = leftItem;
        return;
    }
}

- (void)setLeftNaviItemWithTitle:(NSString *)title size:(CGFloat)size imageName:(NSString *)imageName
{
    if(imageName)
    {
        UIImage *leftImage = [UIImage imageNamed:imageName];
        UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [leftButton setImage:leftImage forState:UIControlStateNormal];
        leftButton.frame = CGRectMake(0, 0, leftImage.size.width, leftImage.size.height);
        [leftButton addTarget:self action:@selector(leftItemTapped) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
        self.navigationItem.leftBarButtonItem = leftItem;
        return;
    }
    if(title)
    {
        UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        leftButton.titleLabel.font = [UIFont systemFontOfSize:size];
        [leftButton setTitle:title forState:UIControlStateNormal];
        leftButton.frame = CGRectMake(0, 0, 50, 30);
        [leftButton addTarget:self action:@selector(leftItemTapped) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
        self.navigationItem.leftBarButtonItem = leftItem;
        return;
    }
}

- (void)setRightNaviItemWithTitle:(NSString *)title imageName:(NSString *)imageName
{
    if(imageName)
    {
        UIImage *rightImage = [UIImage imageNamed:imageName];
        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [rightButton setImage:rightImage forState:UIControlStateNormal];
        rightButton.frame = CGRectMake(0, 0, rightImage.size.width, rightImage.size.height);
        [rightButton addTarget:self action:@selector(rightItemTapped) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
        self.navigationItem.rightBarButtonItem = rightItem;
        return;
    }
    if(title)
    {
        UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(rightItemTapped)];
        self.navigationItem.rightBarButtonItem = rightItem;
    }
}

- (void)setNaviTitle:(NSString *)title size:(CGFloat)size
{
    UIButton *midButton = [UIButton buttonWithType:UIButtonTypeCustom];
    midButton.titleLabel.font = [UIFont systemFontOfSize:size];
    [midButton setTitle:title forState:UIControlStateNormal];
    midButton.frame = CGRectMake(0, 0, 100, 40);
    self.navigationItem.titleView = midButton;
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
