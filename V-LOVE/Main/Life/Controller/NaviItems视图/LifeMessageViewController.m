//
//  LifeMessageViewController.m
//  V_LOVE
//
//  Created by apple on 15/10/17.
//  Copyright (c) 2015年 zhengyiqun. All rights reserved.
//

#import "LifeMessageViewController.h"

@interface LifeMessageViewController ()

@end

@implementation LifeMessageViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self _createSegmentedControl];
    
    self.title = @"消息中心";
    self.view.backgroundColor = [UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1];
    
//    UIWindow * view1 = [[UIWindow alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 200)];
//    [view1 setHidden:NO];
//    view1.windowLevel = UIWindowLevelStatusBar;
//    view1.layer.borderColor = [UIColor redColor].CGColor;
//    view1.backgroundColor = [UIColor redColor];
//    [self.view addSubview:view1];
    
}

#pragma mark - UISegmentedControl创建
- (void)_createSegmentedControl
{
    NSArray * items = [NSArray arrayWithObjects:@"小组回复",@"生活回复",@"系统消息", nil];
    UISegmentedControl * mySegmentedControl = [[UISegmentedControl alloc]initWithItems:items];
    mySegmentedControl.frame = CGRectMake(25, 10, KScreenWidth - 50, 30);
    mySegmentedControl.tintColor = [UIColor redColor];
    mySegmentedControl.selectedSegmentIndex = 0;
    [self.view addSubview:mySegmentedControl];
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
