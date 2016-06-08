//
//  NoticeViewController.m
//  V_LOVE
//
//  Created by apple on 15/10/18.
//  Copyright (c) 2015年 zhengyiqun. All rights reserved.
//

#import "NoticeViewController.h"
#import "LifeProfileViewController.h"

@interface NoticeViewController ()

@end

@implementation NoticeViewController

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
    
    self.title = @"我发布的";
    [self _createAlertView];
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

- (void)_createAlertView
{
    UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"程序猿哥哥正在如火如荼的开发哦~ 要死啦要死啦~" delegate:self cancelButtonTitle:@"返回" otherButtonTitles:@"程序猿哥哥好辛苦呀", nil];
    [alertView show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        LifeProfileViewController * vc = [[LifeProfileViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else {
        LifeProfileViewController * vc = [[LifeProfileViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
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
