//
//  MainTabBarController.m
//  V-LOVE
//
//  Created by mac on 15/10/15.
//  Copyright (c) 2015年 XXX. All rights reserved.
//

#define names @[@"Home",@"Time",@"Life",@"Game"]
#define imageNames  @[@[@"ln_tab_1",@"ln_tab_1s"],@[@"ln_tab_2",@"ln_tab_2s"],@[@"ln_tab_3",@"ln_tab_3s"],@[@"ln_tab_4",@"ln_tab_4s"]]
#define titleNames @[@"首页",@"时光",@"生活",@"游戏"]

#import "MainTabBarController.h"
#import "BaseNavigationController.h"
#import "HomeViewController.h"
#import "ThemeManager.h"
@interface MainTabBarController ()
{
    BOOL isSelected;
}

@end

@implementation MainTabBarController

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        // 接收通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeDidChange:) name:kThemeNameDidChangeNotification object:nil];
    }
    return self;
}

//接收通知调用的方法
- (void)themeDidChange:(NSNotification *)notification{
    [self _loadImage];
    
}
- (void)_loadImage{
    ThemeManager *manager = [ThemeManager shareInstance];
    UIColor *color  = [manager getThemeColor:@"Color"];
    self.tabBar.tintColor = color;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self _createSubControllers];
    
    [self _configureTabBar];
    
    [self _loadImage];

    
    //设置 选中 图标的底色
    self.tabBar.tintColor = [UIColor redColor];
    self.tabBar.translucent = NO;
    self.tabBar.barTintColor = [UIColor colorWithRed:0.98 green:0.97 blue:0.98 alpha:1];
}

#pragma mark - 加载子视图控制器
- (void)_createSubControllers
{
    
    NSMutableArray *navs = [[NSMutableArray alloc] initWithCapacity:names.count];
    
    for (int i = 0; i < names.count; i ++)
    {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:names[i] bundle:nil];
        BaseNavigationController *baseNavigationCtrl = [storyboard instantiateInitialViewController];
        [navs addObject:baseNavigationCtrl];
    }
    
    self.viewControllers = navs;
    

}


#pragma mark - 设置 标签栏 图标
- (void)_configureTabBar
{
    
    for (int i = 0; i < names.count; i ++)
    {
        UITabBarItem *tabBarItem = [self.tabBar.items objectAtIndex:i];
        tabBarItem.image = [UIImage imageNamed:imageNames[i][0]];
        tabBarItem.selectedImage = [UIImage imageNamed:imageNames[i][1]];
        tabBarItem.title = titleNames[i];
    }
}



@end
