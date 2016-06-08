//
//  ZoomImageView.m
//  V-LOVE
//
//  Created by mac on 15/10/27.
//  Copyright © 2015年 TheFirstDream. All rights reserved.
//

#import "ZoomImageView.h"

@implementation ZoomImageView
{
    UIScrollView *_scrollView;
    UIImageView *_imageView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self initTap];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self initTap];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initTap];
    }
    return self;
}


- (void)initTap
{
    //开启 图片视图 用户点击事件
    self.userInteractionEnabled = YES;
    //创建 单击 手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(zoomIn)];
    [self addGestureRecognizer:tap];

}

#pragma mark - 图片 放大
- (void)zoomIn
{
    //01 创建 视图
    [self _createViews];
    
    //02 实现 拉近(放大)
    //获取 cell中的图片视图 相对于window的坐标
    CGRect frame = [self convertRect:self.bounds toView:self.window];
    _imageView.frame = frame;
    //动画 实现
    [UIView animateWithDuration:0.3 animations:^{
        _imageView.frame = _scrollView.frame;
        _scrollView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.9];
    } completion:^(BOOL finished){
        _scrollView.backgroundColor = [UIColor colorWithWhite:0 alpha:1];
    }];
    
    
}

#pragma mark - 缩小 还原
- (void)zoomOut
{

    
    CGRect frame = [self convertRect:self.bounds toView:self.window];
    
    [UIView animateWithDuration:0.3 animations:^{
        _imageView.frame = frame;
        _imageView.top += _scrollView.contentOffset.y;
        _scrollView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
    } completion:^(BOOL finished){
        _scrollView.backgroundColor = [UIColor clearColor];
        [_scrollView removeFromSuperview];
        _scrollView = nil;
        _imageView = nil;
    }];
    
}

- (void)_createViews
{
    if (_scrollView == nil)
    {
        //创建 滑动视图
        _scrollView = [[UIScrollView alloc] initWithFrame:self.window.bounds];
        [self.window addSubview:_scrollView];
        
        //创建 图片视图
        _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _imageView.image = self.image;
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        [_scrollView addSubview:_imageView];
        
    }
    
    // 单击 返回 手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(zoomOut)];
    [_scrollView addGestureRecognizer:tap];
    
}


@end
