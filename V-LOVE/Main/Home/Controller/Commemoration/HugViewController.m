//
//  HugViewController.m
//  V-LOVE
//
//  Created by mac on 15/10/26.
//  Copyright (c) 2015年 Anyi. All rights reserved.
//

#import "HugViewController.h"

@interface HugViewController ()

@end

@implementation HugViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatSubView:@"第一次拥抱的日子" forKey:KhugTime];
    self.maskWindow.index = 4;
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
