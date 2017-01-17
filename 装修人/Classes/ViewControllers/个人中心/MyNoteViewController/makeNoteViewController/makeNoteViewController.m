//
//  makeNoteViewController.m
//  装修人
//
//  Created by liuhang on 16/12/15.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import "makeNoteViewController.h"
#import "Config.h"
@interface makeNoteViewController ()<UITextFieldDelegate,UITextViewDelegate>
//标题
@property (weak, nonatomic) IBOutlet UITextField *titleTF;
//正文
@property (weak, nonatomic) IBOutlet UITextView *BodyTextView;
@property (weak, nonatomic) IBOutlet UILabel *characterNumberLB;
@end

@implementation makeNoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
#pragma mark -- UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
#pragma mark -- UITextViewDelegate
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString*)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}
- (void)textViewDidChange:(UITextView *)textView {
    NSString *numStr = [NSString stringWithFormat:@"%ld/100",textView.text.length];
    self.characterNumberLB.text = numStr;
    NSInteger isMore = textView.text.length - 100;
    if (isMore > 0) {
        self.characterNumberLB.textColor = [UIColor redColor];
    }else {
        self.characterNumberLB.textColor = RGB(153, 153, 153);
    }
}
#pragma mark -- 系统方法
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.title = @"写日记";
    [self setLeftNaviItemWithTitle:@"" imageName:@"nav_cancel"];
    [self setRightNaviItemWithTitle:@"" imageName:@"font_save"];
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBar.barTintColor =[UIColor whiteColor];
}
- (void)rightItemTapped {
    NSLog(@"点击了保存");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
