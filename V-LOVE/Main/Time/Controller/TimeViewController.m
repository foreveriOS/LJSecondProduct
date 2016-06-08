//
//  TimeViewController.m
//  V-LOVE
//
//  Created by mac on 15/10/15.
//  Copyright (c) 2015年 XXX. All rights reserved.
//

#import "TimeViewController.h"
#import "TimeLineTableView.h"
#import "PopView.h"
#import "TimeModel.h"
#import "TimeLineCollectionView.h"

@interface TimeViewController ()
{
    TimeLineTableView *_tableView;
    TimeLineCollectionView *_collectionView;
    PopView *_popView;
    UIWindow *_popWindow;
    NSString *string;
    NSMutableArray *_data;

}

@end

@implementation TimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self _setNavigationItem];
    
    [self _createSubViews];

    self.titleLabel.text = @"时光足迹";
    
}
#pragma mark - 创建 子视图
- (void)_createSubViews
{
    if (_data == nil) {
        _data = [[NSMutableArray alloc] init];
    }
    
    
    //创建 时间轴 显示 视图
    _tableView = [[TimeLineTableView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight - 64 - 49) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    
    //创建 图片 显示 视图
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(50, 10, 10, 10);
    layout.itemSize = CGSizeMake(kScreenWidth / 3 - 15, kScreenWidth / 3 - 15);
    
    _collectionView = [[TimeLineCollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    _collectionView.hidden = YES;
    [self.view addSubview:_collectionView];

}

#pragma mark - 设置 导航栏 按钮 图标
- (void)_setNavigationItem
{
    [self createNavigationButtonWithNormalImageName:@"top-bar-5" selectedImageName:@"top-bar-6" withSide:@"left" frame:CGRectMake(0, 0, 66, 27.5) action:@selector(leftButtonAction:)];

    [self createNavigationButtonWithNormalImageName:@"top-bar-4" selectedImageName:nil withSide:@"right" frame:CGRectMake(0, 0, 22.5, 20.5) action:@selector(rightButtonAction)];
}

#pragma mark - 切换列表 平铺视图
- (void)leftButtonAction:(UIButton *)button
{
//    NSLog(@"点击左边");
    button.selected = !button.selected;
    _tableView.hidden = !_tableView.hidden;
    _collectionView.hidden = !_collectionView.hidden;
    
    [_collectionView reloadData];
}

#pragma mark - 编辑
- (void)rightButtonAction
{
//    NSLog(@"点击右边");
    if (_popView == nil)
    {
        _popWindow = [[UIWindow alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 64)];
        _popWindow.windowLevel = UIWindowLevelStatusBar;
        _popWindow.hidden = NO;

        _popView = [[PopView alloc] initWithFrame:CGRectMake(0, -64, KScreenWidth, KScreenHeight)];
        
    }
    [self.view addSubview:_popView];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    [_popView addGestureRecognizer:tap];
    
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    [_popWindow addGestureRecognizer:tap2];
    

    //防止 block造成的 循环 引用
    __weak __typeof(self) weakSelf = self;
    [_popView setMyblock:^(NSString *str,NSData *data)
    {
        __strong __typeof(self) strongSelf = weakSelf;
        
        TimeModel *model = [[TimeModel alloc] init];
        model.text = str;
        model.imageData = data;

        [strongSelf ->_tableView.data insertObject:model atIndex:0];

        [strongSelf ->_tableView reloadData];
        
        if (data != nil)
        {
            [strongSelf ->_collectionView.data insertObject:data atIndex:0];
        }
        
    }];
    
}

- (void)tapAction
{
    _popView.hidden = YES;
    _popWindow.hidden = YES;
    _popView = nil;
    _popWindow = nil;

}
- (void)viewWillDisappear:(BOOL)animated
{
    [self tapAction];
}

@end
