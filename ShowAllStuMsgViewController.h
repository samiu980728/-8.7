//
//  ShowAllStuMsgViewController.h
//  学生成绩管理系统
//
//  Created by 萨缪 on 2018/8/7.
//  Copyright © 2018年 萨缪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StudentMsg.h"
@interface ShowAllStuMsgViewController : UIViewController
<
UITableViewDelegate,
UITableViewDataSource
>
{
    UITableView * _tableView;
}


//方法很简单 每次随机建立10个学生信息

@property (nonatomic, copy) NSMutableArray * allStuArray;

@property (nonatomic, assign) NSInteger numInt;

//还需要5个数组分别储存学生的姓名 学分 学号 和两个成绩
@property (nonatomic, copy) NSMutableArray * nameArray1;

@property (nonatomic, copy) NSMutableArray * creditArray1;

@property (nonatomic, copy) NSMutableArray * peArray1;

@property (nonatomic, copy) NSMutableArray * numArray1;

@property (nonatomic, copy) NSMutableArray * mathArray1;

@end
