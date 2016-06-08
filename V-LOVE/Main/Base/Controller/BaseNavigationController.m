//
//  BaseNavigationController.m
//  V-LOVE
//
//  Created by mac on 15/10/15.
//  Copyright (c) 2015年 XXX. All rights reserved.
//

#import "BaseNavigationController.h"
#import "ThemeManager.h"
@interface BaseNavigationController ()

@end

@implementation BaseNavigationController


- (void)viewDidLoad {
    [super viewDidLoad];

    [self _loadImage];

    
    //导航栏颜色 设置
    self.navigationBar.barTintColor = [UIColor redColor];
    //导航栏透明度 设置
    self.navigationBar.translucent = NO;
    
    self.navigationBar.tintColor = [UIColor whiteColor];
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    [dic setValue:[UIFont boldSystemFontOfSize:20] forKey:NSFontAttributeName];
//    NSAttributedString *attributed
    self.navigationBar.titleTextAttributes = dic;

}

// 移除通知
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}
// 从故事版中获取的初始化用initWithCoder
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        // 接收通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeDidChange:) name:kThemeNameDidChangeNotification object:nil];
        
    }
    return self;
    
}


- (void)themeDidChange:(NSNotification *)notification{
    [self _loadImage];
}

- (void)_loadImage{
    
    ThemeManager *manager = [ThemeManager shareInstance];
    //02 标题颜色
    UIColor *color  = [manager getThemeColor:@"Color"];
    self.navigationBar.barTintColor = color;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


@end
