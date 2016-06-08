//
//  WishViewController.m
//  V-LOVE
//
//  Created by mac on 15/10/15.
//  Copyright (c) 2015年 Anyi. All rights reserved.
//

#import "WishViewController.h"
#import "AddWishViewController.h"
@interface WishViewController (){
    UIView *view1;
    UIView *view2;
    UIView *view3;
}

@end

@implementation WishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatbuttonView];
    [self creatButton];
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}
- (void)creatButton{
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 19, 19)];
    [button setImage:[UIImage imageNamed:@"top-bar-7@2x"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = rightButton;
    
}
- (void)creatbuttonView{
    view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 40, KScreenWidth, KScreenHeight - 40)];
    view2 = [[UIView alloc]initWithFrame:CGRectMake(0, 40, KScreenWidth, KScreenHeight - 40)];
    view2.backgroundColor = [UIColor redColor];
    view3 = [[UIView alloc]initWithFrame:CGRectMake(0, 40, KScreenWidth, KScreenHeight - 40)];
    view3.backgroundColor = [UIColor yellowColor];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 40)];

    [self.view addSubview:view];
    [self.view addSubview:view1];
    [self.view addSubview:view2];
    [self.view addSubview:view2];
    view2.hidden = YES;
    view3.hidden = YES;
    NSArray *array = @[@"我们的愿望",@"我的愿望",@"TA的愿望"];
    CGFloat itemWidth = (KScreenWidth - 20) / 3;
    for (int i = 0; i < 3; i++) {
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake( 10 + i * itemWidth, 5, itemWidth, 30)];
        [button setTitle:array[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        button.layer.borderWidth = 1;
        button.layer.borderColor = [UIColor whiteColor].CGColor;
        button.titleLabel.font = [UIFont systemFontOfSize:13];
        button.tag = i;
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:button];
    }

}
- (void)buttonAction:(UIButton *)button{
    if (button.tag == 0) {
        view1.hidden = NO;
        view2.hidden = YES;
        view3.hidden = YES;
    }else if(button.tag == 1){
        view1.hidden = YES;
        view2.hidden = NO;
        view3.hidden = YES;
    }else{
        view1.hidden = YES;
        view2.hidden = YES;
        view3.hidden = NO;
    }
}
- (void)rightButtonAction{
   
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
