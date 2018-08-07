//
//  LogInViewController.m
//  学生成绩管理系统
//
//  Created by 萨缪 on 2018/8/7.
//  Copyright © 2018年 萨缪. All rights reserved.
//

#import "LogInViewController.h"
#import "StudentMsg.h"
#import "MyClass.h"
#import "ShowAllStuMsgViewController.h"
#import "addStuMsgViewController.h"


@interface LogInViewController ()

@end

@implementation LogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    _InCount =
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton * addStuMsgButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    UIButton * deleteStuMsgButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    UIButton * changStuMsgButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    UIButton * findStuMsgButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    UIButton * allStuMsgButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    
    addStuMsgButton.frame = CGRectMake(40, 140, 100, 30);
//    a.titleLabel.text = @"增加学生信息";
    [addStuMsgButton setTitle:@"增加学生信息" forState:UIControlStateNormal];
    [addStuMsgButton addTarget:self action:@selector(pressaddStuMsgButton:) forControlEvents:UIControlEventTouchUpInside];
    
    deleteStuMsgButton.frame = CGRectMake(200, 140, 100, 30);
    //deleteStuMsgButton.titleLabel.text = @"删除指定学生信息";
    [deleteStuMsgButton setTitle:@"删除学生信息" forState:UIControlStateNormal];
    [deleteStuMsgButton addTarget:self action:@selector(pressdeleteStuMsgButton:) forControlEvents:UIControlEventTouchUpInside];
    
    changStuMsgButton.frame = CGRectMake(40, 190, 100, 30);
    //changStuMsgButton.titleLabel.text = @"修改指定学生信息";
    [changStuMsgButton setTitle:@"修改学生信息" forState:UIControlStateNormal];
    [changStuMsgButton addTarget:self action:@selector(presschangStuMsgButton:) forControlEvents:UIControlEventTouchUpInside];
    
    findStuMsgButton.frame = CGRectMake(200, 190, 100, 30);
    //findStuMsgButton.titleLabel.text = @"查找指定学生信息";
    [findStuMsgButton setTitle:@"查找学生信息" forState:UIControlStateNormal];
    [findStuMsgButton addTarget:self action:@selector(pressfindStuMsgButton:) forControlEvents:UIControlEventTouchUpInside];
    
    allStuMsgButton.frame = CGRectMake(70, 250, 200, 30);
    //findStuMsgButton.titleLabel.text = @"查找指定学生信息";
    [allStuMsgButton setTitle:@"显示所有学生信息" forState:UIControlStateNormal];
    [allStuMsgButton addTarget:self action:@selector(pressallStuMsgButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:addStuMsgButton];
    [self.view addSubview:deleteStuMsgButton];
    [self.view addSubview:changStuMsgButton];
    [self.view addSubview:findStuMsgButton];
    [self.view addSubview:allStuMsgButton];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)pressallStuMsgButton:(UIButton *)btn
{
    ShowAllStuMsgViewController * showStuMsgView = [[ShowAllStuMsgViewController alloc] init];
    
    
    [self presentViewController:showStuMsgView animated:YES completion:nil];
}

//添加
- (void)pressaddStuMsgButton:(UIButton *)btn
{
    addStuMsgViewController * addStuView = [[addStuMsgViewController alloc] init];
    [self presentViewController:addStuView animated:YES completion:nil];
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
