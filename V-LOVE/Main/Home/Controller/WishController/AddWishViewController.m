//
//  AddWishViewController.m
//  V-LOVE
//
//  Created by mac on 15/10/26.
//  Copyright (c) 2015年 Anyi. All rights reserved.
//

#import "AddWishViewController.h"

@interface AddWishViewController ()

@end

@implementation AddWishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"添加情侣愿望";
    [self creatView];
    [self creatButton];
}
- (void)creatView{
    UITextView *view = [[UITextView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 200)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
}
- (void)creatButton{
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 20)];
    [button setTitle:@"完成" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = rightButton;
}
- (void)buttonAction{
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
