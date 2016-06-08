//
//  MarryViewController.m
//  V-LOVE
//
//  Created by mac on 15/10/26.
//  Copyright (c) 2015年 Anyi. All rights reserved.
//

#import "MarryViewController.h"

@interface MarryViewController ()

@end

@implementation MarryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatSubView:@"结婚纪念日" forKey:KmarryTime];
    self.maskWindow.index = 6;}

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
