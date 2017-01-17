//
//  AnswerManagerViewController.m
//  装修人
//
//  Created by 熊维东 on 2016/12/12.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import "AnswerManagerViewController.h"
#import "AnswerView.h"
#import "QuestionView.h"
#import "Config.h"

typedef NS_ENUM(NSInteger, TypeCell)
{
    typeViewQuestionView =0,
    typeViewAnswerView = 1,
   
};


@interface AnswerManagerViewController ()<UITableViewDelegate,UITableViewDataSource>

{
    UIButton * btn_myQuestion ;
    UIButton * btn_myAnswer;
    UILabel * lb_question;
    UILabel * lb_answer;
    
}

@property(nonatomic,assign)TypeCell  typecell;

@end

@implementation AnswerManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initTableviewOrsomeView];
    
}

-(void)initTableviewOrsomeView
{
    self.aMytableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, KScreenWidth, KScreenHeight-64) style:UITableViewStyleGrouped];
    self.aMytableView.delegate = self;
    self.aMytableView.dataSource = self;
    self.aMytableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview: self.aMytableView ];
    

    UIView* bgview =  [[NSBundle mainBundle]loadNibNamed:@"CouponView" owner:self options:nil].lastObject;
    bgview.frame = CGRectMake(0, 64, KScreenWidth, 45);
    [self.view addSubview:bgview];
    
    btn_myQuestion = (UIButton*) [self.view viewWithTag:201];
    [btn_myQuestion setTitle:@"我要提问" forState:UIControlStateNormal];
    [btn_myQuestion addTarget:self action:@selector(myQuestionAction:) forControlEvents:UIControlEventTouchUpInside];
    
    btn_myAnswer = (UIButton*)  [self.view viewWithTag:202];
    [btn_myAnswer setTitle:@"我的回答" forState:UIControlStateNormal];
    [btn_myAnswer addTarget:self action:@selector(myAnswerAction:) forControlEvents:UIControlEventTouchUpInside];
    
    lb_question =(UILabel*)[self.view viewWithTag:203];
    lb_answer = (UILabel*)[self.view viewWithTag:204];
    lb_question.backgroundColor = COLOR(221, 62, 34, 1);

    
    [self.aMytableView registerNib:[UINib nibWithNibName:@"QuestionView" bundle:nil] forCellReuseIdentifier:@"questionCell"];
    [self.aMytableView registerNib:[UINib nibWithNibName:@"AnswerView" bundle:nil] forCellReuseIdentifier:@"answerCell"];
   
   
}
#pragma mark- 我的提问
-(void)myQuestionAction:(UIButton*) sender
{
    
    NSLog(@"我的提问");
    _typecell = typeViewQuestionView;
    lb_question.backgroundColor = COLOR(221, 62, 34, 1);
    [btn_myQuestion setTitleColor:COLOR(221, 62, 34, 1) forState:UIControlStateNormal];
    
    
    [btn_myAnswer setTitleColor:[UIColor darkGrayColor]forState:UIControlStateNormal];
    lb_answer.backgroundColor =[UIColor whiteColor];

    [self.aMytableView reloadData];

}
#pragma mark-  我的回答
-(void)myAnswerAction:(UIButton*) sender
{
    _typecell = typeViewAnswerView;
    NSLog(@" 我的回答");
    lb_answer.backgroundColor = COLOR(221, 62, 34, 1);
    [btn_myAnswer setTitleColor:COLOR(221, 62, 34, 1) forState:UIControlStateNormal];
    
    [btn_myQuestion setTitleColor:[UIColor darkGrayColor]forState:UIControlStateNormal];
    lb_question.backgroundColor =[UIColor whiteColor];
    [self.aMytableView reloadData];
}

#pragma mark - Datasource delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 9;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * questionidentifier = @"questionCell";
    static NSString * answeridentifier = @"answerCell";
  
    QuestionView * questionCell = [self.aMytableView dequeueReusableCellWithIdentifier:questionidentifier];
    AnswerView * answerCell = [self.aMytableView dequeueReusableCellWithIdentifier:answeridentifier];
    
    switch (_typecell) {
        case typeViewQuestionView:
            
            if (!questionCell) {
                
                questionCell  = [[QuestionView alloc ]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:questionidentifier];
                
            }

            [questionCell setBackgroundColor:[UIColor clearColor]];
            questionCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
            return questionCell;
            break;
    
        case typeViewAnswerView:
            
            if (!answerCell) {
                answerCell  = [[AnswerView alloc ]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:answeridentifier];
            }
            
            [answerCell setBackgroundColor:[UIColor clearColor]];
            answerCell.selectionStyle = UITableViewCellSelectionStyleNone;
            
         
            return answerCell;
            break;
  
        default:
            break;
    }


    return nil;
    
}

-(void)viewWillAppear:(BOOL)animated
{
    self.title = @"问答管理";
    self.navigationController.navigationBar.hidden = NO;
    [self setLeftNaviItemWithTitle:@"" imageName:@"nav_return"];
    self.navigationController.navigationBar.barTintColor =[UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
