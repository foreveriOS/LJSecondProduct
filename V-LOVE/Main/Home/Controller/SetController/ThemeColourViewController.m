//
//  ThemeColourViewController.m
//  V-LOVE
//
//  Created by mac on 15/10/15.
//  Copyright (c) 2015年 Anyi. All rights reserved.
//

#import "ThemeColourViewController.h"
#import "ThemeManager.h"
@interface ThemeColourViewController ()
@end

@implementation ThemeColourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _creatButton];
    
}
- (void)_creatButton{
    UIColor *redColor = [UIColor redColor];
    UIColor *orangeColor = [UIColor orangeColor];
    UIColor *blackColor = [UIColor blackColor];
    UIColor *blueColor = [UIColor blueColor];
    UIColor *purpleColor = [UIColor purpleColor];
    UIColor *brownColor = [UIColor brownColor];
    UIColor *grayColor = [UIColor grayColor];
    UIColor *greenColor = [UIColor greenColor];

    NSArray *colorArray = @[redColor,orangeColor,blueColor,blackColor,brownColor,greenColor,grayColor,purpleColor];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 20, KScreenWidth, 30)];
    label.text = @"点击修改主题颜色";
    label.font = [UIFont systemFontOfSize:15];
    label.textColor = [UIColor grayColor];
    [self.view addSubview:label];
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 2; j++) {
            CGFloat width = (KScreenWidth - 50 * 4) / 5;
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(width + i * (50+width), 74 * j + 80 , 50, 50)];
        button.tag = i*2 + j;
        button.backgroundColor = colorArray[i*2 + j];
        button.layer.cornerRadius = 20;
            [button addTarget:self action:@selector(changeTheme:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        }
        
    }
}
- (void)changeTheme:(UIButton *)button{
    ThemeManager *manager = [ThemeManager shareInstance];
    if (button.tag == 0) {
        manager.themeName = @"红色";
    }else if(button.tag == 1){
        manager.themeName = @"橙色";
    }else if(button.tag == 2){
        manager.themeName = @"蓝色";
    }else if(button.tag == 3){
        manager.themeName = @"黑色";
    }else if(button.tag == 4){
        manager.themeName = @"棕色";
    }else if(button.tag == 5){
        manager.themeName = @"绿色";
    }else if(button.tag == 6){
        manager.themeName = @"灰色";
    }else if(button.tag == 7){
        manager.themeName = @"紫色";
    }

    [self.navigationController popToRootViewControllerAnimated:YES];
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
