//
//  commentViewController.m
//  装修人
//
//  Created by liuhang on 17/1/11.
//  Copyright © 2017年 熊维东. All rights reserved.
//

#import "commentViewController.h"
#import "commentCell.h"
#import "commentCollectionViewCell.h"

static NSString *CellIdentifier = @"commentCell";
@interface commentViewController ()<UITableViewDelegate,UITableViewDataSource>
//评论tableView
@property (weak, nonatomic) IBOutlet UITableView *commentTableView;
@end

@implementation commentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建UI
    [self createUI];
}
- (void)createUI {
    //cell高度
    self.commentTableView.rowHeight = 300.0f;
    //去除指示器,分割线
    self.commentTableView.showsVerticalScrollIndicator = NO;
    self.commentTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //注册
    [self.commentTableView registerNib:[UINib nibWithNibName:@"commentCell" bundle:nil] forCellReuseIdentifier:CellIdentifier];
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    commentCell *cell=[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell==nil){
        cell=[[commentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    return cell;
}
#pragma mark -- UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}
- (void)leftItemTapped {
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title = @"评价(555)";
    [self setLeftNaviItemWithTitle:@"" imageName:@"nav_return"];
    [self setRightNaviItemWithTitle:@"" imageName:@"nav_shop_cart"];
    self.navigationController.navigationBar.barTintColor= [UIColor whiteColor];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
@end
