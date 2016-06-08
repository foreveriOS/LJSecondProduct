//
//  LifeViewController.m
//  V_LOVE
//
//  Created by apple on 15/10/15.
//  Copyright (c) 2015年 zhengyiqun. All rights reserved.
//

#import "LifeViewController.h"
#import "LifeProfileViewController.h"
#import "LifeMessageViewController.h"
#import "LifeTopicTableView.h"
#import "DataService.h"
#import "LifeModel.h"


@interface LifeViewController ()<UIScrollViewDelegate>
{
    UIScrollView * _scrollView;
    UIPageControl * _pageControl;
    UIButton * btn1;
    UIButton * btn2;
    UIView * selectedView;
    UIView * view;
    LifeTopicTableView * _tableView1;
    LifeTopicTableView * _tableView2;
    
    NSMutableArray *_data1;
    NSMutableArray *_data2;
    
    NSTimer *_timer;
}
@end

@implementation LifeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self _loadData];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    backItem.title = @"返回";
    self.navigationItem.backBarButtonItem = backItem;

    self.titleLabel.text = @"情侣生活";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1];
    [self setNavItems];
    [self _createView];
    
}

- (void)setNavItems
{
    UIButton * Leftbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    Leftbtn.frame = CGRectMake(0, 0, 20, 21);
    UIImageView * btnbg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 21)];
    btnbg.image = [UIImage imageNamed:@"homepage-1@3x"];
    [Leftbtn addSubview:btnbg];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:Leftbtn];
    [Leftbtn addTarget:self action:@selector(setProFile:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * Rightbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    Rightbtn.frame = CGRectMake(0, 0, 21, 22);
    UIImageView * btnbg1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 21, 22)];
    btnbg1.image = [UIImage imageNamed:@"homepage-2@3x"];
    [Rightbtn addSubview:btnbg1];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:Rightbtn];
    [Rightbtn addTarget:self action:@selector(setMessage:) forControlEvents:UIControlEventTouchUpInside];
    
    
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"homepage-1@3x"] style:UIBarButtonItemStyleDone target:self action:@selector(setProFile)];
}

- (void)setProFile:(UIButton *)button
{
    LifeProfileViewController * VC = [[LifeProfileViewController alloc]init];
    
    [self.navigationController pushViewController:VC animated:YES];
}

- (void)setMessage:(UIButton *)button
{
    LifeMessageViewController * VC = [[LifeMessageViewController alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
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
    
    NSArray * array = [NSArray arrayWithObjects:@"Life-scroll1.jpg",@"Life-scroll2.jpg",@"Life-scroll3.jpg",@"Life-scroll4.jpg",@"Life-scroll5.jpg", nil];
    for (int i = 0;i < 5;i++) {
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth * i, 0, kScreenWidth, 150)];
        imageView.image = [UIImage imageNamed:array[i]];
        [_scrollView addSubview:imageView];

        //创建UIPageController
        _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, view.bounds.size.height - 25, kScreenWidth, 30)];
        _pageControl.numberOfPages = 5;
        _pageControl.currentPage = 0;
        _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
        _pageControl.pageIndicatorTintColor = [UIColor colorWithRed:.7 green:.7 blue:.7 alpha:1];
        [view addSubview:_pageControl];
        
        
        //创建按钮
        btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        btn1.frame = CGRectMake(0, 150, kScreenWidth / 2, 35);
        btn1.backgroundColor = [UIColor whiteColor];
//        btn1.set.text = @"话题小组";
//        [btn1 setTitle:@"话题小组" forState:UIControlStateNormal];
        [btn1 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        btn1.tag = 100;
        [self.view addSubview:btn1];
        
        btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        btn2.frame = CGRectMake(kScreenWidth / 2, 150, kScreenWidth / 2, 35);
        btn2.backgroundColor = [UIColor whiteColor];
        btn2.tag = 101;
        [btn2 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn2];

        UILabel * label1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth/2, 35)];
        label1.text = @"话题小组";
        label1.font = [UIFont systemFontOfSize:17];
        label1.textColor = [UIColor colorWithRed:.7 green:.7 blue:.7 alpha:1];
        label1.textAlignment = NSTextAlignmentCenter;
        [btn1 addSubview:label1];
        
        UILabel * label2 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth/2, 35)];
        label2.text = @"吃喝玩乐";
        label2.font = [UIFont systemFontOfSize:17];
        label2.textColor = [UIColor colorWithRed:.7 green:.7 blue:.7 alpha:1];
        label2.textAlignment = NSTextAlignmentCenter;
        [btn2 addSubview:label2];
        
        UIView * freamView = [[UIView alloc]initWithFrame:CGRectMake(0, 184, kScreenWidth, 1)];
        freamView.backgroundColor = [UIColor colorWithRed:.7 green:.7 blue:.7 alpha:0.2];
        [self.view addSubview:freamView];
        
        selectedView = [[UIView alloc]initWithFrame:CGRectMake(0, 182, kScreenWidth/2, 2.5)];
        selectedView.backgroundColor = [UIColor redColor];
        [self.view addSubview:selectedView];
        
        //创建UITableView
        _tableView1 = [[LifeTopicTableView alloc]initWithFrame:CGRectMake(0, 185, kScreenWidth, kScreenHeight-64-49-180) style:UITableViewStylePlain];
        _tableView1.index = 1000;
        [self.view addSubview:_tableView1];
        
        _tableView2 = [[LifeTopicTableView alloc]initWithFrame:CGRectMake(0, 185, kScreenWidth, kScreenHeight-64-49-180) style:UITableViewStylePlain];
        _tableView2.index = 1001;
        [self.view addSubview:_tableView2];
        
        _tableView1.hidden = NO;
        _tableView2.hidden = YES;
        //初始化
        if (_data1 == nil)
        {
            _data1 = [[NSMutableArray alloc] init];
            [self _loadData1];
        }
        if (_data2 == nil)
        {
            _data2 = [[NSMutableArray alloc] init];
            [self _loadData2];
        }
    }

}


- (void)btnAction:(UIButton *)button
{
    if (button.tag == 100) {
        selectedView.frame = CGRectMake(0, 182, kScreenWidth/2, 2.5);
        _tableView2.hidden = YES;
        _tableView1.hidden = NO;
//        NSLog(@"话题小组");

    } else {
        selectedView.frame = CGRectMake(kScreenWidth/2, 182, kScreenWidth/2, 2.5);
        _tableView2.hidden = NO;
        _tableView1.hidden = YES;
//        NSLog(@"吃喝玩乐");
    }

}

- (void)viewDidAppear:(BOOL)animated
{
    [self _loadData1];
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


#pragma mark - 加载数据
- (void)_loadData1
{
    NSDictionary *params = @{
                             @"access_token":@"562949970844965-190334389f88849ab",
                             @"sig":@"FyzVbaoKi7WqRXX9KomW816Bl1U%3D"
                             };
    
    [DataService requestData:@"http://api.welove520.com/v5/life/group/home" HTTPMethod:@"POST" params:[params mutableCopy] completionHandle:^(id result) {
        NSArray *categories = result[@"categories"];
        for (NSDictionary *dic in categories)
        {
            LifeModel *model = [[LifeModel alloc] initWithDataDic:dic];
            // 防止 每次加载 都多出 重复数据
            if (_data1.count > [dic allKeys].count)
            {
                _data1 = [NSMutableArray array];
            }
            [_data1 addObject:model];
        }
        //回到主线程  更新UI
        dispatch_sync(dispatch_get_main_queue(), ^{
            _tableView1.data1 = _data1;
            [_tableView1 reloadData];
        });
    } errorHandle:^(NSError *error) {
        NSLog(@"请求失败");
    }];
    
    

}


- (void)_loadData2
{
    NSDictionary *params = @{
                             @"access_token":@"562949970844965-190334389f88849ab",
                             @"sig":@"X5P6PCnah%2B%2FfD7IHutIhj8Dttt8%3D"
                             };
    
    [DataService requestData:@"http://api.welove520.com/v5/life/home" HTTPMethod:@"POST" params:[params mutableCopy] completionHandle:^(id result) {
        NSArray *categories = result[@"categories"];
        for (NSDictionary *dic in categories)
        {
            LifeModel *model = [[LifeModel alloc] initWithDataDic:dic];
            [_data2 addObject:model];
        }
        //回到主线程  更新UI
        dispatch_sync(dispatch_get_main_queue(), ^{
            _tableView2.data2 = _data2;
            [_tableView2 reloadData];
        });
    } errorHandle:^(NSError *error) {
        NSLog(@"请求失败");
    }];
    
    
    
}

@end
