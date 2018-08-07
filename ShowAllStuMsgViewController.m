//
//  ShowAllStuMsgViewController.m
//  学生成绩管理系统
//
//  Created by 萨缪 on 2018/8/7.
//  Copyright © 2018年 萨缪. All rights reserved.
//

#import "ShowAllStuMsgViewController.h"
#import "StudentMsg.h"
#import "MyClass.h"
#import "ShowTableViewCell.h"
#import "addStuMsgViewController.h"


@interface ShowAllStuMsgViewController ()<addStuMsgViewControllerDelegate>

@end

@implementation ShowAllStuMsgViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _numInt = 0;
    
    MyClass * iosClass = [[MyClass alloc] initWithClassName:@"iOS班级"];
    _nameArray1 = [[NSMutableArray alloc]init];
    _numArray1 = [[NSMutableArray alloc]init];
    _mathArray1 = [[NSMutableArray alloc]init];
    _peArray1 = [[NSMutableArray alloc]init];
    _creditArray1 = [[NSMutableArray alloc]init];
    
    if ( [[iosClass stuList] count] == 0 ){
    for (int i = 0; i < 10; i++) {
        StudentMsg * stu = [[StudentMsg alloc] initWithName:[NSString stringWithFormat:@"jpx%02d",arc4random()%50+1] andNum:arc4random()%100+1 andMathScore:arc4random()%100+1 andPEScore:arc4random()%100+1 andCredit:arc4random()%10+1];
        [iosClass addStudent:stu];
        [stu printStudent];
        
        [_nameArray1 addObject:[stu nameStr]];
        [_numArray1 addObject:[NSNumber numberWithInteger:[stu numInt]]];
        [_mathArray1 addObject:[NSNumber numberWithInteger:[stu scoreMathInt]]];
        [_peArray1 addObject:[NSNumber numberWithInteger:[stu scorePEInt]]];
        [_creditArray1 addObject:[NSNumber numberWithInteger:[stu creditInt]]];

    }
        
    }
    _numInt = [_nameArray1 count];
    NSLog(@"nameArray count = %li",[_nameArray1 count]);
    //NSLog(@"nameArray  = %@",_nameArray1);
    //NSLog(@"numArray = %@",_numArray1);
    
    NSLog(@"int = %li",_numInt);
    //获得学生信息  显示学生信息
    
    
    //在这里调用添加学生协议 插入数组中 位置已定 设全局变量 接收位置 还有其他五项信息
    addStuMsgViewController * addStuMsg = [[addStuMsgViewController alloc] init];
    addStuMsg.delegate = self;
    
    //先添加到学生类当中 然后重新获取
    _numInt = [_nameArray1 count];
    
    
    
    //注册申请
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    [_tableView registerClass:[ShowTableViewCell class] forCellReuseIdentifier:@"labelCell"];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    //在这里调用对吗？？？
    
    
    [self.view addSubview:_tableView];
    
}

- (void)getLocationTextFiled:(NSInteger)location andName:(NSString *)name andNum:(NSInteger)num andMath:(NSInteger)math andPE:(NSInteger)PE andCredit:(NSInteger)credit
{
    //添加到学生类中
//    StudentMsg * stu = [[StudentMsg alloc] initWithName:name andNum:num andMathScore:math andPEScore:PE andCredit:credit];
    [_nameArray1 insertObject:name atIndex:location];
    [_numArray1 insertObject:[NSNumber numberWithInteger:num] atIndex:location];
    [_mathArray1 insertObject:[NSNumber numberWithInteger:math] atIndex:location];
    [_peArray1 insertObject:[NSNumber numberWithInteger:PE] atIndex:location];
    [_creditArray1 insertObject:[NSNumber numberWithInteger:credit] atIndex:location];

}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell1 = nil;
    ShowTableViewCell * cell2 = nil;
    if ( indexPath.row == 0 ){
        cell1 = [_tableView dequeueReusableCellWithIdentifier:@"cell1"];
        if ( cell1 == nil ){
            cell1 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
            UIButton * button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            button1.frame = CGRectMake(0, 0, 200, 30);
            [button1 setTitle:@"显示完毕,返回主界面" forState:UIControlStateNormal];
            [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [button1 addTarget:self action:@selector(pressButton1:) forControlEvents:UIControlEventTouchUpInside];
            [cell1.contentView addSubview:button1];
        }
        return cell1;
    }
    else{
        cell2 = [_tableView dequeueReusableCellWithIdentifier:@"labelCell" forIndexPath:indexPath];
        //cell2.label.text = @"你哈奥";
        cell2.label.text = [NSString stringWithFormat:@"姓名:%@",[_nameArray1 objectAtIndex:indexPath.row-1]];
        
        cell2.label1.text = [NSString stringWithFormat:@"学号:%@",[_numArray1 objectAtIndex:indexPath.row-1]];
        
        cell2.label2.text = [NSString stringWithFormat:@"数学:%@分",[_mathArray1 objectAtIndex:indexPath.row-1]];
        
        cell2.label3.text = [NSString stringWithFormat:@"体育:%@分",[_peArray1 objectAtIndex:indexPath.row-1]];
        
        cell2.label4.text = [NSString stringWithFormat:@"学分:%@分",[_creditArray1 objectAtIndex:indexPath.row-1]];
        
//        cell2.label.text = [_nameArray1 objectAtIndex:indexPath.row-1];
//        cell2.label1.text = [_numArray1 objectAtIndex:indexPath.row-1];
//        cell2.label2.text = [_mathArray1 objectAtIndex:indexPath.row-1];
//        cell2.label3.text = [_peArray1 objectAtIndex:indexPath.row-1];
//        cell2.label4.text = [_creditArray1 objectAtIndex:indexPath.row-1];
        return cell2;
        
    }
    
    //return cell2;
}

//自定义单元格 第一栏一个button 点击返回主界面

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //NSLog(@"实际 = %li",_numInt+1);
    return _numInt+1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (void)pressButton1:(UIButton *)btn
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
