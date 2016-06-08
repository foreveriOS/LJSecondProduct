//
//  GameViewController.m
//  V_LOVE
//
//  Created by apple on 15/10/15.
//  Copyright (c) 2015年 zhengyiqun. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()<UIScrollViewDelegate>
{
    UIScrollView * _scrollView;
    UIPageControl * _pageControl;
    UIView * view;
    NSTimer *_timer;
}
@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.titleLabel.text = @"情侣游戏";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1];
    [self _createView];
}

- (void)_createView
{
    view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 150)];
    [self.view addSubview:view];
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 150)];
    _scrollView.backgroundColor = [UIColor whiteColor];
    _scrollView.delegate = self;
    _scrollView.bounces = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.contentSize = CGSizeMake(kScreenWidth * 5, 150);
    [view addSubview:_scrollView];
    
    NSArray * array = [NSArray arrayWithObjects:@"Game-scroll1.jpg",@"Game-scroll2.jpg",@"Game-scroll3.jpg",@"Game-scroll4.jpg",@"Game-scroll5.jpg", nil];
    for (int i = 0;i < 5;i++) {
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth * i, 0, kScreenWidth, 150)];
        imageView.image = [UIImage imageNamed:array[i]];
        [_scrollView addSubview:imageView];
    }
        //创建UIPageController
        _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, view.bounds.size.height - 25, kScreenWidth, 30)];
        _pageControl.numberOfPages = 5;
        _pageControl.currentPage = 0;
        _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
        _pageControl.pageIndicatorTintColor = [UIColor colorWithRed:.7 green:.7 blue:.7 alpha:1];
    

        [view addSubview:_pageControl];
    
    //创建游戏进入按钮
    NSArray * imageArr = @[@"icon_game_home1@3x",@"icon_game_tree1@3x",@"icon_game_kiss1@3x",@"icon_game_pop1@3x"];
    NSArray * NameArr = @[@"我们的家",@"爱情树",@"亲老婆",@"情侣消消乐"];
    CGFloat itemsWidth = kScreenWidth/3;
    for (int i = 0; i < 4; i++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = [UIColor whiteColor];
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(itemsWidth/2-25, 75-30, 53, 51)];
        imageView.image = [UIImage imageNamed:imageArr[i]];
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, itemsWidth, 20)];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor grayColor];
        label.font = [UIFont systemFontOfSize:11];
        label.text = NameArr[i];
        if (i < 3) {
            button.frame = CGRectMake(i * (itemsWidth+2), 152, itemsWidth, 150);
            [button addSubview:imageView];
            [button addSubview:label];
            [self.view addSubview:button];
        }else{
            button.frame = CGRectMake(0, 304, kScreenWidth/3, 150);
            [button addSubview:imageView];
            [button addSubview:label];
            [self.view addSubview:button];
        }
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    _timer = [NSTimer scheduledTimerWithTimeInterval:2 target: self selector: @selector(handleTimer:)  userInfo:nil  repeats: YES];
    [_timer fire];

}

- (void)viewWillDisappear:(BOOL)animated
{
    [_timer invalidate];
}

#pragma mark - 翻页时页码跟着移动
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //获取结束减速时的偏移量
    CGPoint point = scrollView.contentOffset;
    //计算得对应索引值
    NSInteger index = point.x / kScreenWidth;
    //页码移动
    _pageControl.currentPage = index;
}

#pragma mark - 页码自动翻页
- (void)handleTimer:(NSTimer *)timer
{
    [UIView animateWithDuration:0.5 animations:^{
        if (_pageControl.currentPage == 4) {
            _pageControl.currentPage=0;
            _scrollView.contentOffset = CGPointMake(_pageControl.currentPage*kScreenWidth, 0);
            
        }else{
            _pageControl.currentPage++;
            _scrollView.contentOffset = CGPointMake(_pageControl.currentPage*kScreenWidth, 0);
            
        }
    }];

}
- (void)_changePage
{
    _pageControl.currentPage = 0;
}





@end
