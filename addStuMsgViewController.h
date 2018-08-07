//
//  addStuMsgViewController.h
//  学生成绩管理系统
//
//  Created by 萨缪 on 2018/8/7.
//  Copyright © 2018年 萨缪. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol addStuMsgViewControllerDelegate <NSObject>

- (void)getLocationTextFiled:(NSInteger)location andName:(NSString *)name andNum:(NSInteger)num andMath:(NSInteger)math andPE:(NSInteger)PE andCredit:(NSInteger)credit;

//- (void)getLocationTextFiled:(NSInteger)location;
                                                          
//- (void)getNameTextFiled:(NSString *)name;
//
//- (void)getNumTextFiled:(NSUInteger)num;
//
//- (void)getMathTextFiled:(NSInteger)math;
//
//- (void)getPETextFiled:(NSInteger)PE;
//
//- (void)getCreditTextFiled:(NSInteger)crdeit;

@end

@interface addStuMsgViewController : UIViewController

@property (nonatomic, strong) UITextField * nameTextFiled;

@property (nonatomic, strong) UITextField * numTextFiled;

@property (nonatomic, strong) UITextField * mathTextFiled;

@property (nonatomic, strong) UITextField * peTextFiled;

@property (nonatomic, strong) UITextField * creditTextFiled;

@property (nonatomic, strong) UITextField * locationTextFiled;

//委托代理
@property (nonatomic, weak) id <addStuMsgViewControllerDelegate>delegate;


@end
