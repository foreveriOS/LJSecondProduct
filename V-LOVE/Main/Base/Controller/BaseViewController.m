//
//  BaseViewController.m
//  V-LOVE
//
//  Created by mac on 15/10/15.
//  Copyright (c) 2015年 XXX. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self _creatTitleLable];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_home.jpg"]];
    

}

- (void)_creatTitleLable{
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 120, 50)];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.font = [UIFont boldSystemFontOfSize:20];
    _titleLabel.text = self.title;
    self.navigationItem.titleView = _titleLabel;
    
}
-(void)setTitle:(NSString *)title{
    [super setTitle:title];
    _titleLabel.text = title;
}


- (void)creatSubView:(NSString *)titleLabel forKey:(NSString *)theKey{
    MyView *view = [[MyView alloc]initWithFrame:CGRectMake(0, 10, KScreenWidth, 100)];
    view.titleLabel = titleLabel;
    view.label3.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
    [view.label3 addGestureRecognizer:tap];
    [self.view addSubview:view];
    
    
    _maskWindow = [[MaskWindow alloc]initWithFrame:CGRectMake(0, -64, KScreenWidth, KScreenHeight)];
    [self.view addSubview:_maskWindow];
    
    
    view.dateLabel = [[NSUserDefaults standardUserDefaults] objectForKey:theKey];
    
    [_maskWindow setBlock:^(NSString *str){
        view.dateLabel = str;
    }];
    
    
}
- (void)tapAction{
    _maskWindow.hidden = NO;
}
// 封装NSUserDefaults
- (void)UseNSUserDefaults:(NSString *)imageStr forKey:(NSString *)name{
    [[NSUserDefaults standardUserDefaults] setObject:imageStr forKey:name];
    [[NSUserDefaults standardUserDefaults] synchronize];
}




#pragma mark - 创建 导航栏 图标
- (void)createNavigationButtonWithNormalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName withSide:(NSString *)side frame:(CGRect)frame action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setImage:[UIImage imageNamed:normalImageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selectedImageName] forState:UIControlStateSelected];
    [button setAdjustsImageWhenHighlighted:NO];
    
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    if ([side isEqualToString:@"left"])
    {
        
        self.navigationItem.leftBarButtonItem = barButtonItem;
    }
    else if ([side isEqualToString:@"right"])
    {
        self.navigationItem.rightBarButtonItem = barButtonItem;
    }
    
}

@end
