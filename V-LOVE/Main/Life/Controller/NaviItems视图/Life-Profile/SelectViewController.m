//
//  SelectViewController.m
//  V_LOVE
//
//  Created by apple on 15/10/18.
//  Copyright (c) 2015年 zhengyiqun. All rights reserved.
//

#import "SelectViewController.h"

@interface SelectViewController ()

@end

@implementation SelectViewController

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
    // Do any additional setup after loading the view.
    self.title = @"我收藏的";
    [self _createSegmentedControl];
}

#pragma mark - UISegmentedControl创建
- (void)_createSegmentedControl
{
    NSArray * items = [NSArray arrayWithObjects:@"小组",@"生活", nil];
    UISegmentedControl * mySegmentedControl = [[UISegmentedControl alloc]initWithItems:items];
    mySegmentedControl.frame = CGRectMake(25, 10, KScreenWidth - 50, 30);
    mySegmentedControl.tintColor = [UIColor redColor];
    mySegmentedControl.selectedSegmentIndex = 0;
    //        self.navigationItem.titleView = mySegmentedControl;
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
