//
//  DayViewController.m
//  V-LOVE
//
//  Created by mac on 15/10/22.
//  Copyright (c) 2015年 Anyi. All rights reserved.
//

#import "DayViewController.h"
#import "MyView.h"
#import "MaskWindow.h"
@interface DayViewController ()
@end

@implementation DayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatSubView:@"我的生日" forKey:KDayTime];
    self.maskWindow.index = 1;
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
