//
//  BirthdayViewController.m
//  V-LOVE
//
//  Created by mac on 15/10/23.
//  Copyright (c) 2015年 Anyi. All rights reserved.
//

#import "BirthdayViewController.h"
#import "MaskWindow.h"
@interface BirthdayViewController ()


@end

@implementation BirthdayViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self creatSubView:@"TA的生日" forKey:KBirthdayTime];
    self.maskWindow.index = 2;

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
