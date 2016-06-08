//
//  TogetherViewController.m
//  V-LOVE
//
//  Created by mac on 15/10/23.
//  Copyright (c) 2015年 Anyi. All rights reserved.
//

#import "TogetherViewController.h"

@interface TogetherViewController ()

@end

@implementation TogetherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatSubView:@"在一起的日子" forKey:KTogetherTime];
    self.maskWindow.index = 3;

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
